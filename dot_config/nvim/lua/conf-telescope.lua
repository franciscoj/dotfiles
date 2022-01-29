local h = require("h")
local action_layout = require("telescope.actions.layout")
local trouble = require("trouble.providers.telescope")
local telescope = require("telescope")

h.nnoremap("<leader>f", "<cmd>Telescope find_files<cr>")
h.nnoremap("<leader>g", "<cmd>Telescope live_grep<cr>")
h.nnoremap("<leader>F", "<cmd>Telescope resume<cr>")
h.nnoremap("<leader>m", "<cmd>Telescope marks<cr>")
h.nnoremap('<leader>"', "<cmd>Telescope registers<cr>")
h.nnoremap("<leader><leader>", "<cmd>Telescope buffers<cr>")

telescope.setup({
	defaults = {
		mappings = {
			n = {
				["<M-p>"] = action_layout.toggle_preview,
				["<c-t>"] = trouble.open_with_trouble,
			},
			i = {
				["<M-p>"] = action_layout.toggle_preview,
				["<c-t>"] = trouble.open_with_trouble,
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
	},
	-- other configuration values here
})
telescope.load_extension("fzf")
