local catppuccin = require("catppuccin")

vim.g.catppuccin_flavour = "macchiato"

catppuccin.setup({
  dim_inactive = {
    enabled = true,
    shade = "dark",
  },
  styles = {
    comments = { "italic" },
    functions = { "italic", "bold" },
    keywords = { "bold" },
    strings = { "italic" },
  },
  integrations = {
    bufferline = true,
    cmp = true,
    fern = true,
    gitsigns = true,
    lsp_trouble = true,
    markdown = true,
    native_lsp = { enabled = true },
    telescope = true,
    treesitter = true,
  },
})
vim.cmd([[colorscheme catppuccin]])
