require("options") -- Load the base defaults
require("keymaps") -- Global key mappings that don't deppend on plugins

local fn = vim.fn

-- Install packer if it isn't installed
local install_path = fn.stdpath("data").."/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system({"git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path})
end

require('packer').startup(function(use)
  use "wbthomason/packer.nvim"
  use "tpope/vim-abolish"
  use "tpope/vim-characterize"
  use "tpope/vim-commentary"
  use "tpope/vim-eunuch"
  use "tpope/vim-repeat"
  use "tpope/vim-rsi"
  use "tpope/vim-surround"
  use "tpope/vim-unimpaired"
  use "tpope/vim-vinegar"
  use { "dracula/vim", config = "vim.cmd[[colorscheme dracula]]" }
  use { "nvim-treesitter/nvim-treesitter", config = function() require("conf-treesitter") end }
  use {
    "neovim/nvim-lspconfig",
    require = "williamboman/nvim-lsp-installer",
    config = function() require("conf-lsp") end,
  }

  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
