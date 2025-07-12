--# selene: allow(mixed_table)
return {
	"folke/lazy.nvim",
	-- QOL plugins
	{
		"folke/snacks.nvim",
		priority = 1000,
		lazy = false,
		---@type snacks.Config
		opts = {
			bigfile = { enabled = true },
			debug = { enabled = true },
			indent = {
				enabled = true,
				only_scope = true,
				only_current = true,
			},
			toggle = { enabled = true },
		},
		init = function()
			vim.api.nvim_create_autocmd("User", {
				pattern = "VeryLazy",
				callback = function()
					-- Setup some globals for debugging (lazy-loaded)
					_G.dd = function(...) Snacks.debug.inspect(...) end
					_G.bt = function() Snacks.debug.backtrace() end
					vim.print = _G.dd -- Override print to use snacks for `:=` command

					-- Create some toggle mappings
					Snacks.toggle.option("wrap", { name = "Wrap" }):map("yow")
					Snacks.toggle.option("relativenumber", { name = "Relative Number" }):map("yor")
					Snacks.toggle.diagnostics():map("yod")
					Snacks.toggle.line_number():map("yon")
				end,
			})
		end,
	},
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
	{
		"stevearc/oil.nvim",
		---@module 'oil'
		---@type oil.SetupOpts
		opts = {},
		-- Optional dependencies
		dependencies = { { "echasnovski/mini.icons", opts = {} } },
	},
}
