local catppuccin = require("catppuccin")

vim.g.catppuccin_flavour = "macchiato"

catppuccin.setup({
  compile = {
    enabled = true,
  },
  dim_inactive = {
    enabled = true,
    shade = "dark",
  },
  styles = {
    comments = { "italic" },
    functions = { "italic", "bold" },
    keywords = { "bold" },
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
vim.cmd [[highlight WinSeparator guibg=None]]
