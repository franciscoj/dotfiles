return {
	{
		"vim-test/vim-test",
		config = function()
			local fterm = function(cmd)
				require("FTerm").run(cmd)
			end

			vim.g["test#custom_strategies"] = { fterm = fterm }
			vim.g["test#strategy"] = "fterm"
		end,
	},
	{
		"nvim-neotest/neotest",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-treesitter/nvim-treesitter",
			"antoinemadec/FixCursorHold.nvim",
			-- File types
			"haydenmeade/neotest-jest", -- JavaScript,TypeScript / Jest
			"zidhuss/neotest-minitest", -- Ruby / minitest
			"nvim-neotest/neotest-go", -- Go / go test - testify
		},
		keys = {
			{ "<leader>tf" },
			{ "<leader>tl" },
			{ "<leader>tr" },
			{ "<leader>tt" },
			{ "<leader>to" },
		},
		config = function()
			local h = require("h")
			h.nnoremap("<leader>tf", function()
				require("neotest").run.run(vim.fn.expand("%"))
			end)
			h.nnoremap("<leader>tl", function()
				require("neotest").run.run()
			end)
			h.nnoremap("<leader>tr", function()
				require("neotest").run.run_last()
			end)
			h.nnoremap("<leader>tt", function()
				require("neotest").summary.toggle()
			end)
			h.nnoremap("<leader>to", function()
				require("neotest").output_pannel.toggle()
			end)

			require("neotest").setup({
				adapters = {
					require("neotest-go"),
					require("neotest-minitest"),
					require("neotest-jest"),
				},
			})
		end,
	},
}
