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
			{ "<leader>gg", ":Git<space>" },
			{ "<leader>gr", ":Git rebase -i main" },
			{ "<leader>gc", "<cmd>Git commit<cr>" },
			{ "<leader>gs", "<cmd>Git<cr>" },
			{ "<leader>go", "<cmd>GBrowse<cr>", mode = { "n" } },
			{ "<leader>go", ":'<,'>GBrowse<cr>", mode = { "x" } },
		},
		ft = "git",
	},
	{
		"junegunn/gv.vim",
		enabled = not vim.g.started_by_firenvim,
		dependencies = { "tpope/vim-fugitive" },
		keys = {
			{ "<localleader>gl", "<CMD>GV!<CR>" }, -- Log for current file
			{ "<leader>gl", "<CMD>GV<CR>" }, -- Log for repo
		},
	},
	{
		"lewis6991/gitsigns.nvim",
		event = "VeryLazy",
		enabled = not vim.g.started_by_firenvim,
		dependencies = { "nvim-lua/plenary.nvim" },
		keys = {
			{
				"<leader>gb",
				function()
					require("gitsigns").blame()
				end,
			},
			{
				"<localleader>gb",
				function()
					require("gitsigns").blame_line()
				end,
			},
			{
				"]h",
				function()
					require("gitsigns").nav_hunk("next")
				end,
			},
			{
				"[h",
				function()
					require("gitsigns").nav_hunk("prev")
				end,
			},
			{
				"<localleader>hd",
				function ()
					require("gitsigns").preview_hunk()
				end
			},
			{
				"<localleader>hs",
				function ()
					require("gitsigns").stage_hunk()
				end
			},
			{
				"<localleader>hu",
				function ()
					require("gitsigns").undo_stage_hunk()
				end
			}
		},
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
