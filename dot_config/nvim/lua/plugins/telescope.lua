return {
	{
		"nvim-telescope/telescope.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-telescope/telescope-ui-select.nvim",
			{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
		},
		keys = {
			{ "<leader>fr" },
		},
		config = function()
			local telescope = require("telescope")
			local builtin = require("telescope.builtin")
			local themes = require("telescope.themes")

			vim.keymap.set("n", "<leader>fr", function()
				builtin.registers(themes.get_cursor())
			end)

			telescope.setup({
				defaults = {
					layout_config = {
						width = 0.9,
						height = 0.9,
						-- other layout configuration here
					},
					-- other defaults configuration here
				},
				extensions = {
					fzf = {
						fuzzy = true, -- false will only do exact matching
						override_generic_sorter = true, -- override the generic sorter
						override_file_sorter = true, -- override the file sorter
						case_mode = "smart_case", -- or "ignore_case" or "respect_case"
						-- the default case_mode is "smart_case"
					},
					["ui-select"] = {
						themes.get_cursor({}), -- even more opts
					},
				},
				-- other configuration values here
			})
			telescope.load_extension("fzf")
			telescope.load_extension("ui-select")
		end,
	},
}
