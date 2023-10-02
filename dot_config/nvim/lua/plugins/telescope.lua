return {
	{
		"nvim-telescope/telescope.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-telescope/telescope-ui-select.nvim",
			{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
		},
		keys = {
			{ "<leader>f" },
			{ "<leader>g" },
			{ "<leader>F" },
			{ "<LocalLeader>m" },
			{ "<LocalLeader>'" },
			{ "<leader>B" },
			{ "<leader>h" },
		},
		config = function()
			local action_layout = require("telescope.actions.layout")
			local trouble = require("trouble.providers.telescope")
			local telescope = require("telescope")
			local builtin = require("telescope.builtin")
			local themes = require("telescope.themes")

			vim.keymap.set("n", "<leader>f", builtin.find_files)
			vim.keymap.set("n", "<leader>g", builtin.live_grep)
			vim.keymap.set("n", "<leader>F", builtin.resume)
			vim.keymap.set("n", "<LocalLeader>m", builtin.marks)
			vim.keymap.set("n", "<LocalLeader>'", function()
				builtin.registers(themes.get_cursor())
			end)
			vim.keymap.set("n", "<leader>B", builtin.buffers)
			vim.keymap.set("n", "<leader>h", builtin.help_tags)

			telescope.setup({
				defaults = {
					mappings = {
						n = {
							["<M-p>"] = action_layout.toggle_preview,
							["<C-t>"] = trouble.open_with_trouble,
						},
						i = {
							["<M-p>"] = action_layout.toggle_preview,
							["<C-t>"] = trouble.open_with_trouble,
						},
					},
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
