return {
	"folke/lazy.nvim",
	-- QOL plugins
	{
		"numToStr/Comment.nvim",
		config = function()
			require("Comment").setup()
		end,
	},
	{
		"kylechui/nvim-surround",
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
		config = function()
			vim.g.splitjoin_ruby_curly_braces = false
			vim.g.splitjoin_ruby_hanging_args = false
		end,
	},
	"cohama/lexima.vim",
	{
		"folke/zen-mode.nvim",
		config = function()
			local h = require("h")

			require("zen-mode").setup({
				window = { width = 100 },
				plugins = {
					gitsigns = { enabled = true },
				},
			})

			h.nnoremap("<leader>zz", "<cmd>ZenMode<cr>")
		end,
	},
	{
		"simnalamburt/vim-mundo",
		config = function()
			vim.keymap.set("n", "<leader>U", "<cmd>MundoToggle<cr>")
		end,
	},
	{
		"junegunn/vim-easy-align",
		config = function()
			vim.keymap.set("n", "ga", "<Plug>(EasyAlign)")
			vim.keymap.set("x", "ga", "<Plug>(EasyAlign)")
		end,
	},
	{ dir = "~/.config/private.nvim/" },
}
