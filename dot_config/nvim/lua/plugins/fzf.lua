return {
	{
		"ibhagwan/fzf-lua",
		-- optional for icon support
		dependencies = { "nvim-tree/nvim-web-devicons" },
		keys = {
			{ "<leader>fG" },
			{ "<leader>fb" },
			{ "<leader>ff" },
			{ "<leader>fg" },
			{ "<leader>fm" },
			{ "<leader>fr" },
			{ "<leader>gf" },
			{ "i", "<localleader>'" },
		},
		config = function()
			local fzf = require("fzf-lua")
			local actions = require("fzf-lua.actions")
			fzf.setup({
				winopts = {
					height = 0.99,
					width = 0.99,
				},
				files = {
					actions = {
						["ctrl-i"] = { actions.toggle_ignore },
						["ctrl-g"] = false,
					},
				},
				grep = {
					actions = {
						["ctrl-l"] = { actions.grep_lgrep },
						["ctrl-g"] = false,
					},
				},
			})
			-- calling `setup` is optional for customization

			vim.keymap.set("n", "<leader>fG", fzf.grep)
			vim.keymap.set("n", "<leader>fb", fzf.buffers)
			vim.keymap.set("n", "<leader>ff", fzf.files)
			vim.keymap.set("n", "<leader>fg", fzf.live_grep)
			vim.keymap.set("n", "<leader>fm", fzf.marks)
			vim.keymap.set("n", "<leader>fr", fzf.registers)
			vim.keymap.set("n", "<leader>gf", fzf.git_status)
			vim.keymap.set("i", "<localleader>'", fzf.registers)
		end,
	},
}
