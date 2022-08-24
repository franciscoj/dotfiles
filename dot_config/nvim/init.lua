require("options") -- Load the base defaults
require("keymaps") -- Global key mappings that don't deppend on plugins

-- Install packer if it isn't installed
local fn = vim.fn
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
local bootstrap_packer = false

if fn.empty(fn.glob(install_path)) > 0 then
  bootstrap_packer = fn.system({
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  })

  -- Add the directory where we just installed packer to the runtimepath so
  -- that it is taken into account. Otherwise it is going to be ignored and
  -- require("packer") won't work.
  vim.o.runtimepath = vim.fn.stdpath("data") .. "/site/pack/*/start/*," .. vim.o.runtimepath
end

local ok, impatient = pcall(require, "impatient")
if not ok then
  print("Not loading impatient")
end

local packer = require("packer")
local plugins = function(use)
  use("wbthomason/packer.nvim")
  use("lewis6991/impatient.nvim")

  -- QOL plugins
  use("tpope/vim-abolish")
  use("tpope/vim-characterize")
  use("tpope/vim-commentary")
  use("tpope/vim-eunuch")
  use("tpope/vim-repeat")
  use("tpope/vim-rsi")
  use("tpope/vim-surround")
  use("tpope/vim-unimpaired")
  use("tpope/vim-vinegar")
  use({
    "tpope/vim-projectionist",
    config = function()
      require("conf-projectionist")
    end,
  })
  use({
    "AndrewRadev/splitjoin.vim",
    config = function()
      vim.g.splitjoin_ruby_curly_braces = false
      vim.g.splitjoin_ruby_hanging_args = false
    end,
  })
  use("cohama/lexima.vim")
  use({
    "folke/zen-mode.nvim",
    config = function()
      require("zen-mode").setup({
        window = {
          width = 80,
        },
        plugins = {
          gitsigns = { enabled = true },
        },
      })
    end,
  })
  use({
    "simnalamburt/vim-mundo",
    config = function()
      vim.keymap.set("n", "<leader>U", "<cmd>MundoToggle<cr>")
    end
  })
  use({
    "junegunn/vim-easy-align",
    config = function()
      vim.keymap.set("n", "ga", "<Plug>(EasyAlign)")
      vim.keymap.set("x", "ga", "<Plug>(EasyAlign)")
    end
  })

  use({
    "pwntester/octo.nvim",
    requires = {
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope.nvim",
      "kyazdani42/nvim-web-devicons",
    },
    cmd = { "Octo" },
    config = function()
      require("octo").setup()
    end,
  })

  -- Git
  use({
    "tpope/vim-fugitive",
    requires = {
      "tpope/vim-git",
      "tpope/vim-rhubarb",
      { "junegunn/gv.vim", cmd = { "GV", "GV!" } },
    },
    config = function()
      require("conf-git")
    end,
  })
  use({
    "lewis6991/gitsigns.nvim",
    requires = { "nvim-lua/plenary.nvim" },
    config = function()
      require("gitsigns").setup()
    end,
  })

  -- Support project specific config
  use({
    "embear/vim-localvimrc",
    config = function()
      vim.g.localvimrc_persistent = 1
    end,
  })

  -- Look & Feel
  use("kyazdani42/nvim-web-devicons")
  use({
    "catppuccin/nvim",
    as = "catppuccin",
    run = ":CatppuccinCompile",
    config = function()
      require("conf-catppuccin")
    end,
  })
  use({
    "nvim-lualine/lualine.nvim",
    config = function()
      require("conf-statusline")
    end,
  })
  use({
    "akinsho/bufferline.nvim",
    config = function()
      require("conf-bufferline")
    end,
  })

  -- Neovim/treesitter/LSP specific
  use({
    "nvim-treesitter/nvim-treesitter",
    requires = "nvim-treesitter/nvim-treesitter-textobjects",
    run = ":TSUpdate",
    config = function()
      require("conf-treesitter")
    end,
  })

  local lsp_requires = {
    "williamboman/nvim-lsp-installer",
    "folke/trouble.nvim",
    "folke/lua-dev.nvim",
  }
  if vim.env.DOTFILES then
    -- This makes luacheck installation work on Mac
    -- https://github.com/wbthomason/packer.nvim/issues/180#issuecomment-871634199
    if jit.os == "OSX" then
      vim.fn.setenv("MACOSX_DEPLOYMENT_TARGET", "10.15")
    end

    table.insert(lsp_requires, {
      "jose-elias-alvarez/null-ls.nvim",
      rocks = { "luacheck" },
    })
  else
    table.insert(lsp_requires, "jose-elias-alvarez/null-ls.nvim")
  end

  -- Show LSP progress information
  use({
    "j-hui/fidget.nvim",
    config = function()
      require("fidget").setup({})
    end,
  })

  use({
    "neovim/nvim-lspconfig",
    requires = lsp_requires,
    config = function()
      require("conf-lsp")
    end,
  })

  use({
    "nvim-telescope/telescope.nvim",
    config = function()
      require("conf-telescope")
    end,
    requires = {
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope-ui-select.nvim",
      { "nvim-telescope/telescope-fzf-native.nvim", run = "make" },
    },
  })

  use({
    "iamcco/markdown-preview.nvim",
    ft = { "markdown" },
    run = "cd app && yarn install"
  })

  -- Autocomplete + snippets
  use({
    "hrsh7th/nvim-cmp",
    requires = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-nvim-lsp-signature-help",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-cmdline",
      "onsails/lspkind-nvim",
      "L3MON4D3/LuaSnip",
      "saadparwaiz1/cmp_luasnip",
      "rafamadriz/friendly-snippets",
    },
    config = function()
      require("conf-cmp")
    end,
  })

  -- Running tests
  use({
    "kassio/neoterm",
    config = function()
      require("conf-neoterm")
    end,
  })
  use({
    "vim-test/vim-test",
    config = function()
      require("conf-test")
    end,
  })

  -- Fern
  use({
    "lambdalisue/fern.vim",
    requires = {
      "lambdalisue/fern-hijack.vim",
      "lambdalisue/fern-git-status.vim",
      "lambdalisue/nerdfont.vim",
      "lambdalisue/fern-renderer-nerdfont.vim",
    },
    config = function()
      require("conf-fern")
    end,
  })

  if bootstrap_packer then
    packer.sync()
  end
end

local config = {
  display = {
    open_fn = function()
      return require("packer.util").float({ border = "rounded" })
    end,
  },
}

packer.startup({ plugins, config = config })
