local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
vim.opt.rtp:prepend(lazypath)

require("options") -- Load the base defaults
require("keymaps") -- Global key mappings that don't deppend on plugins
require("franciscoj") -- Some niceties to explore/code Lua code

require("lazy").setup("plugins", { ui = { border = "rounded" } })
