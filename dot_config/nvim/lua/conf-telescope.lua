local h = require("h")

h.nnoremap("<leader>f", ":Telescope find_files<cr>")
h.nnoremap("<leader>g", ":Telescope live_grep<cr>")
h.nnoremap("<leader>F", ":Telescope resume<cr>")
h.nnoremap("<leader>m", ":Telescope marks<cr>")

local action_layout = require("telescope.actions.layout")
local telescope = require("telescope")
telescope.setup({
  defaults = {
    mappings = {
      n = {
        ["<M-p>"] = action_layout.toggle_preview
      },
      i = {
        ["<M-p>"] = action_layout.toggle_preview
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
      fuzzy = true,                    -- false will only do exact matching
      override_generic_sorter = true,  -- override the generic sorter
      override_file_sorter = true,     -- override the file sorter
      case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
                                       -- the default case_mode is "smart_case"
    }
  }
  -- other configuration values here
})
telescope.load_extension("fzf")
