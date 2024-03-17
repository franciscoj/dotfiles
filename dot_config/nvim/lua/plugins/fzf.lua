return {
	{
		"ibhagwan/fzf-lua",
		-- optional for icon support
		dependencies = { "nvim-tree/nvim-web-devicons" },
		keys = {
			{ "<leader>f" },
			{ "<leader>g" },
			{ "<leader>G" },
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

			vim.keymap.set("n", "<leader>f", fzf.files)
			vim.keymap.set("n", "<leader>g", fzf.live_grep)
			vim.keymap.set("n", "<leader>G", fzf.grep)
		end,
	},
}
