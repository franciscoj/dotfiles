require("options") -- Load the base defaults
require("keymaps") -- Global key mappings that don't deppend on plugins

local fn = vim.fn

-- Install packer if it isn't installed
local install_path = fn.stdpath("data").."/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system({"git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path})
end

local packer_plugins = function(use)
  use "wbthomason/packer.nvim"

  -- QOL plugins
  use "tpope/vim-abolish"
  use "tpope/vim-characterize"
  use "tpope/vim-commentary"
  use "tpope/vim-eunuch"
  use "tpope/vim-repeat"
  use "tpope/vim-rsi"
  use "tpope/vim-surround"
  use "tpope/vim-unimpaired"
  use "tpope/vim-vinegar"
  use {
    "AndrewRadev/splitjoin.vim",
    config = function ()
      vim.g.splitjoin_ruby_curly_braces = false
      vim.g.splitjoin_ruby_hanging_args = false
    end
  }
  -- Git
  use {
    "tpope/vim-fugitive",
    requires = {
      "tpope/vim-git",
      "tpope/vim-rhubarb",
      "junegunn/gv.vim",
    },
    config = function() require("conf-git") end,
  }
  -- Support project specific config
  use {
    "embear/vim-localvimrc",
    config = function ()
      vim.g.localvimrc_persistent = 1
    end
  }
  -- Look & Feel
  use "kyazdani42/nvim-web-devicons"
  use { "dracula/vim", config = "vim.cmd[[colorscheme dracula]]" }
  use { 'nvim-lualine/lualine.nvim', config = function() require("conf-statusline") end }
  -- Neovim/treesitter/LSP specific
  use { "nvim-treesitter/nvim-treesitter", config = function() require("conf-treesitter") end }
  use {
    "neovim/nvim-lspconfig",
    requires = { "williamboman/nvim-lsp-installer", "tami5/lspsaga.nvim" },
    config = function() require("conf-lsp") end,
  }
  use {
    "nvim-telescope/telescope.nvim",
    config = function() require("conf-telescope") end,
    requires = {
      "nvim-lua/plenary.nvim",
      { "nvim-telescope/telescope-fzf-native.nvim", run = "make" },
    },
  }
  -- Autocomplete + snippets
  use {
    "hrsh7th/nvim-cmp",
    requires = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-cmdline",
      "onsails/lspkind-nvim",
      "hrsh7th/cmp-vsnip",
      "hrsh7th/vim-vsnip",
      "rafamadriz/friendly-snippets",
    },
    config = function () require("conf-cmp") end
  }
  -- Running tests
  use { "kassio/neoterm", config = function() require("conf-neoterm") end }
  use {
    "vim-test/vim-test",
    config = function() require("conf-test") end,
  }

  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end

local packer_config = {
  display = {
    open_fn = function()
      return require('packer.util').float({ border = 'single' })
    end
  }
}
require('packer').startup({packer_plugins, config = packer_config})
