--# selene: allow(mixed_table)
return {
	{
        "igorlfs/nvim-dap-view",
		dependencies = {
			"mfussenegger/nvim-dap",
			"nicholasmata/nvim-dap-cs",
			"williamboman/mason.nvim",
		},
		keys = {
			{ "<leader>dd" },
			{ "<leader>ds" },
			{ "<leader>di" },
			{ "<leader>do" },
			{ "<leader>db" },
		},
		cmd = {
			"DapNew",
		},
		config = function()
			-- Add the adapter for C#
			require("dap-cs").setup()

			local features = require("franciscoj.lsp.features")
			local dap = require("dap")
			local mason = require("franciscoj.mason")

			if features.go then
				mason.ensure_tools({
					{ name = "delve", version = "latest" },
				})
			end

			dap.adapters.rdbg = function(callback, config)
				callback({
					type = "server",
					port = "${port}",
					executable = {
						command = "bin/rdbg",
						args = {
							"--open",
							"--port",
							"${port}",
							"--command",
							"--",
							config.command,
							config.script,
						},
					},
				})
			end

			dap.configurations.ruby = {
				{
					type = "rdbg",
					name = "Debug current file",
					request = "launch",
					localfs = true,
					command = "ruby",
					script = "${file}",
				},
			}

			dap.adapters.delve = function(callback, _config)
				callback({
					type = "server",
					port = "${port}",
					executable = {
						command = mason.get_path("delve"),
						args = { "dap", "-l", "127.0.0.1:${port}" },
					},
				})
			end

			dap.configurations.go = {
				{
					type = "delve",
					name = "Debug",
					request = "launch",
					program = "${file}",
				},
				{
					type = "delve",
					name = "Debug test", -- configuration for debugging test files
					request = "launch",
					mode = "test",
					program = "${file}",
				},
				-- works with go.mod packages and sub packages
				{
					type = "delve",
					name = "Debug test (go.mod)",
					request = "launch",
					mode = "test",
					program = "./${relativeFileDirname}",
				},
			}

			vim.keymap.set("n", "<leader>dd", dap.continue)
			vim.keymap.set("n", "<leader>ds", dap.step_over)
			vim.keymap.set("n", "<leader>di", dap.step_into)
			vim.keymap.set("n", "<leader>do", dap.step_out)
			vim.keymap.set("n", "<leader>db", dap.toggle_breakpoint)
			-- nnoremap <silent> <Leader>b <Cmd>lua require'dap'.toggle_breakpoint()<CR>
			-- nnoremap <silent> <Leader>B <Cmd>lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>
			-- nnoremap <silent> <Leader>lp <Cmd>lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<CR>
			-- nnoremap <silent> <Leader>dr <Cmd>lua require'dap'.repl.open()<CR>
			-- nnoremap <silent> <Leader>dl <Cmd>lua require'dap'.run_last()<CR>
		end,
	},
}
