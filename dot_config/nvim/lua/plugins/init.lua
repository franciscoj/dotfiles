--# selene: allow(mixed_table)
return {
	"folke/lazy.nvim",
	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		opts = {
			preset = "helix",
		},
		keys = {
			{
				"<leader>?",
				function() require("which-key").show({ global = false }) end,
				desc = "Buffer Local Keymaps (which-key)",
			},
		},
	},
	-- QOL plugins
	{ "nvim-lua/plenary.nvim" },
	{
		"numToStr/Comment.nvim",
		event = { "VeryLazy" },
		config = function() require("Comment").setup() end,
	},
	{
		"echasnovski/mini.surround",
		version = "*",
		event = { "VeryLazy" },
		config = function() require("mini.surround").setup() end,
	},
	{
		"echasnovski/mini.indentscope",
		version = "*",
		event = { "VeryLazy" },
		config = function() require("mini.indentscope").setup() end,
	},
	{
		"echasnovski/mini.pairs",
		version = "*",
		event = { "VeryLazy" },
		config = function() require("mini.pairs").setup() end,
	},
	-- praise tpope section
	"tpope/vim-abolish",
	"tpope/vim-characterize",
	"tpope/vim-eunuch",
	"tpope/vim-repeat",
	"tpope/vim-rsi",
	"tpope/vim-unimpaired",
	"tpope/vim-vinegar",
	{
		"AndrewRadev/splitjoin.vim",
		submodules = false,
		event = { "VeryLazy" },
		config = function()
			vim.g.splitjoin_ruby_curly_braces = false
			vim.g.splitjoin_ruby_hanging_args = false
		end,
	},
	{
		"folke/zen-mode.nvim",
		lazy = true,
		keys = {
			{ "<leader>zz", "<cmd>ZenMode<cr>", desc = "Zen mode" },
		},
		config = function()
			require("zen-mode").setup({
				window = { width = 100 },
				plugins = {
					gitsigns = { enabled = true },
				},
			})
		end,
	},
	{
		"simnalamburt/vim-mundo",
		keys = {
			{ "<leader>U", "<cmd>MundoToggle<cr>", desc = "Undo tree" },
		},
	},
	{
		"junegunn/vim-easy-align",
		keys = {
			{ "ga", "<Plug>(EasyAlign)", mode = "n" },
			{ "ga", "<Plug>(EasyAlign)", mode = "x" },
		},
	},
	{ dir = "~/.config/private.nvim/" },
}
