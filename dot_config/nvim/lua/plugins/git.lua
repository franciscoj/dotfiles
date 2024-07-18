-- Plugins related with Git the usage of Git and GitHub
--# selene: allow(mixed_table)
return {
	{
		"tpope/vim-fugitive",
		enabled = not vim.g.started_by_firenvim,
		dependencies = {
			"tpope/vim-git",
			"tpope/vim-rhubarb",
		},
		keys = {
			"<leader>gb",
			"<leader>gg",
			"<leader>gr",
			"<leader>gs",
			{ "<leader>go", mode = { "n", "v" } },
		},
		ft = "git",
		config = function()
			vim.keymap.set("n", "<leader>gb", "<cmd>Git blame<cr>")
			vim.keymap.set("n", "<leader>gg", ":Git<space>")
			vim.keymap.set("n", "<leader>go", "<cmd>GBrowse<cr>")
			vim.keymap.set("n", "<leader>gr", ":Git rebase -i main")
			vim.keymap.set("n", "<leader>gs", "<cmd>Git<cr>")
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
			vim.keymap.set("n", "<leader>gl", "<cmd>GV!<cr>") -- Log for current file
			vim.keymap.set("n", "<leader>gL", "<cmd>GV<cr>") -- Log for repo
		end,
	},
	{
		"lewis6991/gitsigns.nvim",
		event = "VeryLazy",
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
			"nvim-tree/nvim-web-devicons",
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
			"DiffviewOpen",
			"DiffviewFileHistory",
			"DiffviewClose",
			"DiffviewToggleFiles",
			"DiffviewFocusFiles",
			"DiffviewRefresh",
			"DiffviewLog",
		},
	},
}
