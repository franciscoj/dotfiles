local packer = require("packer")
local plugins = function(use)
	use("wbthomason/packer.nvim")
	use("lewis6991/impatient.nvim")

	-- QOL plugins
	use({
		"numToStr/Comment.nvim",
		config = function()
			require("Comment").setup()
		end,
	})
	use({
		"kylechui/nvim-surround",
		config = function()
			require("nvim-surround").setup()
		end,
	})

	-- praise tpope section
	use("tpope/vim-abolish")
	use("tpope/vim-characterize")
	use("tpope/vim-eunuch")
	use("tpope/vim-repeat")
	use("tpope/vim-rsi")
	use("tpope/vim-unimpaired")
	use("tpope/vim-vinegar")

	use({
		"tpope/vim-projectionist",
		config = require("conf-projectionist"),
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
		config = require("conf-zen"),
	})
	use({
		"iamcco/markdown-preview.nvim",
		ft = { "markdown" },
		run = "cd app && yarn install",
	})
	use({
		"simnalamburt/vim-mundo",
		config = function()
			vim.keymap.set("n", "<leader>U", "<cmd>MundoToggle<cr>")
		end,
	})
	use({
		"junegunn/vim-easy-align",
		config = function()
			vim.keymap.set("n", "ga", "<Plug>(EasyAlign)")
			vim.keymap.set("x", "ga", "<Plug>(EasyAlign)")
		end,
	})

	-- Git
	use({
		"tpope/vim-fugitive",
		requires = {
			"tpope/vim-git",
			"tpope/vim-rhubarb",
			"sindrets/diffview.nvim",
			{ "junegunn/gv.vim", cmd = { "GV", "GV!" } },
		},
		config = require("conf-git"),
	})
	use({
		"lewis6991/gitsigns.nvim",
		requires = { "nvim-lua/plenary.nvim" },
		config = function()
			require("gitsigns").setup()
		end,
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

	-- Look & Feel
	use("kyazdani42/nvim-web-devicons")
	use({
		"catppuccin/nvim",
		as = "catppuccin",
		run = ":CatppuccinCompile",
		config = require("conf-catppuccin"),
	})
	use({
		"nvim-lualine/lualine.nvim",
		after = { "catppuccin/nvim" },
		config = require("conf-statusline"),
	})
	use({
		"akinsho/bufferline.nvim",
		config = require("conf-bufferline"),
	})
	use({
		"folke/noice.nvim",
		event = "VimEnter",
		config = function()
			require("noice").setup({
				routes = {
					{
						filter = {
							event = "cmdline",
							find = "^%s*[/?]",
						},
						view = "cmdline",
					},
				},
			})
		end,
		requires = {
			"MunifTanjim/nui.nvim",
			"rcarriga/nvim-notify",
		},
	})

	-- Neovim/treesitter/LSP specific
	use({
		"nvim-treesitter/nvim-treesitter",
		requires = {
			"nvim-treesitter/nvim-treesitter-textobjects",
			"andymass/vim-matchup",
		},
		run = ":TSUpdate",
		config = require("conf-treesitter"),
	})

	-- DAP and debuggers
	use({
		"rcarriga/nvim-dap-ui",
		requires = { "mfussenegger/nvim-dap" },
		config = require("conf-dap"),
	})

	use({
		"neovim/nvim-lspconfig",
		requires = {
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",
			"folke/trouble.nvim",
			"folke/neodev.nvim",
			"jose-elias-alvarez/null-ls.nvim",
		},
		config = require("conf-lsp"),
	})

	use({
		"nvim-telescope/telescope.nvim",
		requires = {
			"nvim-lua/plenary.nvim",
			"nvim-telescope/telescope-ui-select.nvim",
			{ "nvim-telescope/telescope-fzf-native.nvim", run = "make" },
		},
		config = require("conf-telescope"),
	})

	-- Sometimes LSPs are not enough
	use("pechorin/any-jump.vim")
	use("preservim/tagbar")
	use({
		"olexsmir/gopher.nvim",
		config = require("conf-gopher"),
		ft = "go",
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
		config = require("conf-cmp"),
	})

	-- Running tests
	use({
		"numToStr/FTerm.nvim",
		config = require("conf-fterm"),
	})
	use({
		"vim-test/vim-test",
		config = require("conf-test"),
	})

	-- Fern - File explorer
	use({
		"lambdalisue/fern.vim",
		requires = {
			"lambdalisue/fern-hijack.vim",
			"lambdalisue/fern-git-status.vim",
			"lambdalisue/nerdfont.vim",
			"lambdalisue/glyph-palette.vim",
			"lambdalisue/fern-renderer-nerdfont.vim",
		},
		config = require("conf-fern"),
	})

	use({
		"phaazon/hop.nvim",
		branch = "v2",
		config = require("conf-hop"),
	})

	use("~/.config/private.nvim/")
end

local config = {
	display = {
		open_fn = function()
			return require("packer.util").float({ border = "rounded" })
		end,
	},
}

packer.startup({ plugins, config = config })
