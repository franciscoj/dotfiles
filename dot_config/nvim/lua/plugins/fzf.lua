return {
	{
		"ibhagwan/fzf-lua",
		-- optional for icon support
		dependencies = { "nvim-tree/nvim-web-devicons" },
		keys = {
			{ "<leader>ff" },
			{ "<leader>fg" },
			{ "<leader>fG" },
			{ "<leader>gf" },
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
				}
			})
			-- calling `setup` is optional for customization

			vim.keymap.set("n", "<leader>ff", fzf.files)
			vim.keymap.set("n", "<leader>fg", fzf.live_grep)
			vim.keymap.set("n", "<leader>fG", fzf.grep)
			vim.keymap.set("n", "<leader>gf", fzf.git_status)
		end,
	},
}
