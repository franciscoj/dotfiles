-- Plugins related with Git the usage of Git and GitHub
return {
	{
		"tpope/vim-fugitive",
		enabled = not vim.g.started_by_firenvim,
		dependencies = {
			"tpope/vim-git",
			"tpope/vim-rhubarb",
		},
		config = function()
			vim.keymap.set("n", "<leader>gg", ":Git<space>")
			vim.keymap.set("n", "<leader>gs", ":Git<cr>")
			vim.keymap.set("n", "<leader>gb", ":Git blame<cr>")
			vim.keymap.set("n", "<leader>go", ":GBrowse<CR>")
			vim.keymap.set("n", "<leader>gr", ":Git rebase -i main")
			vim.keymap.set("v", "<leader>go", ":'<,'>GBrowse<CR>")
		end,
	},
	{
		"junegunn/gv.vim",
		enabled = not vim.g.started_by_firenvim,
		keys = {
			{ "<leader>gl" },
			{ "<leader>gL" },
		},
		config = function()
			vim.keymap.set("n", "<leader>gl", ":GV!<cr>") -- Log for current file
			vim.keymap.set("n", "<leader>gL", ":GV<cr>") -- Log for repo
		end,
	},
	{
		"lewis6991/gitsigns.nvim",
		enabled = not vim.g.started_by_firenvim,
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			require("gitsigns").setup()
		end,
	},
	{
		"pwntester/octo.nvim",
		enabled = not vim.g.started_by_firenvim,
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-telescope/telescope.nvim",
			"kyazdani42/nvim-web-devicons",
		},
		cmd = { "Octo" },
		config = function()
			require("octo").setup()
		end,
	},
	{
		"sindrets/diffview.nvim",
		enabled = not vim.g.started_by_firenvim,
		cmd = {
			"DiffViewOpen",
			"DiffviewFileHistory",
			"DiffviewClose",
			"DiffviewToggleFiles",
			"DiffviewFocusFiles",
			"DiffviewRefresh",
			"DiffviewLog",
		},
	},
}
