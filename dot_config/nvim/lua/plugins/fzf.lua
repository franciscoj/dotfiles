--# selene: allow(mixed_table)
return {
	{
		"ibhagwan/fzf-lua",
		-- optional for icon support
		dependencies = { "nvim-tree/nvim-web-devicons" },
		keys = {
			{ "<leader>fG", function() require("fzf-lua").grep() end, desc = "Grep" },
			{ "<leader>fb", function() require("fzf-lua").buffers() end, desc = "Find Buffer" },
			{ "<leader>ff", function() require("fzf-lua").files() end, desc = "Find File" },
			{ "<leader>fg", function() require("fzf-lua").live_grep() end, desc = "Live Grep" },
			{ "<leader>fm", function() require("fzf-lua").marks() end, desc = "Find Mark" },
			{ "<leader>fr", function() require("fzf-lua").registers() end, desc = "Find Registers" },
			{ "<leader>fv", function() require("fzf-lua").grep_visual() end, desc = "Find Visual Selection", mode = { "x" } },
			{ "<leader>fw", function() require("fzf-lua").grep_cword() end, desc = "Find Word Under Cursor" },
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
		end,
	},
	{
		"stevearc/dressing.nvim",
		config = function()
			require("dressing").setup({
				select = {
					backend = { "fzf_lua", "nui", "telescope", "builtin" },
				},
			})
		end,
	},
}
