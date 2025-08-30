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
					-- Create some toggle mappings
					Snacks.toggle.option("wrap", { name = "Wrap" }):map("yow")
					Snacks.toggle.option("relativenumber", { name = "Relative Number" }):map("yor")
					Snacks.toggle.option("list", { name = "List" }):map("yol")
					Snacks.toggle.diagnostics():map("yod")
					Snacks.toggle.line_number():map("yon")
					Snacks.toggle.indent():map("yoi")
					Snacks.toggle
						.new({
							id = "copilot",
							name = "copilot autocomplete",
							get = function() return vim.g.franciscoj_copilot_enabled end,
							set = function(state) vim.g.franciscoj_copilot_enabled = state end,
						})
						:map("yoc")
					Snacks.toggle
						.new({
							id = "image",
							name = "image preview",
							get = function() return require("image").is_enabled() end,
							set = function(state)
								if state then
									require("image").enable()
								else
									require("image").disable()
								end
							end,
						})
						:map("yoI")
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
		"nvim-mini/mini.surround",
		version = "*",
		event = { "VeryLazy" },
		opts = {},
	},
	{
		"nvim-mini/mini.pairs",
		version = "*",
		event = { "VeryLazy" },
		opts = {},
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
		dependencies = { { "nvim-mini/mini.icons", opts = {} } },
	},
	{
		"3rd/image.nvim",
		build = false, -- so that it doesn't build the rock https://github.com/3rd/image.nvim/issues/91#issuecomment-2453430239
		opts = {
			backend = "ueberzug",
			processor = "magick_cli",
			integrations = {
				markdown = {
					clear_in_insert_mode = true,
					only_render_image_at_cursor = false, -- defaults to false
					only_render_image_at_cursor_mode = "inline", -- "popup" or "inline", defaults to "popup"
				},
			},
		},
	},
}
