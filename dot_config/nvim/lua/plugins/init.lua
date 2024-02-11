return {
	"folke/lazy.nvim",
	-- QOL plugins
	{
		"numToStr/Comment.nvim",
		event = { "VeryLazy" },
		config = function()
			require("Comment").setup()
		end,
	},
	{
		"kylechui/nvim-surround",
		event = { "VeryLazy" },
		config = function()
			require("nvim-surround").setup()
		end,
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
		event = { "VeryLazy" },
		config = function()
			vim.g.splitjoin_ruby_curly_braces = false
			vim.g.splitjoin_ruby_hanging_args = false
		end,
	},
	{
		"cohama/lexima.vim",
		event = { "VeryLazy" },
	},
	{
		"folke/zen-mode.nvim",
		lazy = true,
		keys = {
			{ "<leader>zz", "<cmd>ZenMode<cr>" },
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
			{ "<leader>U", "<cmd>MundoToggle<cr>" },
		},
	},
	{
		"junegunn/vim-easy-align",
		keys = {
			{ "ga", "<Plug>(EasyAlign)", mode = "n" },
			{ "ga", "<Plug>(EasyAlign)", mode = "x" },
		},
		config = function() end,
	},
	{ dir = "~/.config/private.nvim/" },
}
