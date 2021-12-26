require'nvim-treesitter.configs'.setup {
  ensure_installed = {
    "bash",
    "comment",
    "dockerfile",
    "go",
    "html",
    "javascript",
    "jsonc",
    "lua",
    "make",
    "ruby",
    "rust",
    "scss",
    "toml",
    "tsx",
    "typescript",
    "yaml",
  },
  highlight = { enable = true },
  indent = { enable = true },
  incremental_selection = { enable = true },
  textobjects = { enable = true },
}
