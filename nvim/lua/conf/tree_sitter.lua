require'nvim-treesitter.configs'.setup {
  --ensure_installed = "all", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
  ensure_installed = {
    "css",
    "go",
    "graphql",
    "html",
    "javascript",
    "json",
    "lua",
    "regex",
    "ruby",
    "rust",
    "scss",
    "toml",
    "typescript",
    "yaml"
  },
  -- ignore_install = { "javascript" }, -- List of parsers to ignore installing
  highlight = { enable = true },
  incremental_selection = { enable = true },
  textobjects = { enable = true },
  indent = { enable = true },
  folding = { enable = false }
}

