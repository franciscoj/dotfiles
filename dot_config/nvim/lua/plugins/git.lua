-- Plugins related with Git the usage of Git and GitHub
--# selene: allow(mixed_table)
return {
	{
		"tpope/vim-fugitive",
		dependencies = {
			"tpope/vim-git",
			"tpope/vim-rhubarb",
		},
		keys = {
			{ "<leader>gg", ":Git<space>", desc = "Git" },
			{ "<leader>gr", ":Git rebase -i main", desc = "Git rebase" },
			{ "<leader>gc", "<cmd>Git commit<cr>", desc = "Git commit" },
			{ "<leader>gs", "<cmd>Git<cr>", desc = "Git status" },
			{ "<leader>go", "<cmd>GBrowse<cr>", mode = { "n" }, desc = "Show file on GitHub" },
			{ "<leader>go", ":'<,'>GBrowse<cr>", mode = { "x" }, desc = "Show selection on GitHub" },
		},
		ft = "git",
	},
	{
		"junegunn/gv.vim",
		dependencies = { "tpope/vim-fugitive" },
		keys = {
			{ "<localleader>gl", "<CMD>GV!<CR>", desc = "Git log current file" },
			{ "<leader>gl", "<CMD>GV<CR>", desc = "Git log for repo" },
		},
	},
	{
		"lewis6991/gitsigns.nvim",
		event = "VeryLazy",
		dependencies = { "nvim-lua/plenary.nvim" },
		keys = {
			{ "<leader>gb", function() require("gitsigns").blame() end, desc = "Git blame" },
			{ "<localleader>gb", function() require("gitsigns").blame_line() end, desc = "Git blame line" },
			{ "]h", function() require("gitsigns").nav_hunk("next") end, desc = "Next git change" },
			{ "[h", function() require("gitsigns").nav_hunk("prev") end, desc = "Prev git change" },
			{ "<leader>hd", function() require("gitsigns").preview_hunk() end, desc = "Diff git change" },
			{ "<leader>hs", function() require("gitsigns").stage_hunk() end, desc = "Stage git change" },
			{ "<leader>hu", function() require("gitsigns").undo_stage_hunk() end, desc = "Unstage git change" },
		},
		config = function() require("gitsigns").setup() end,
	},
	{
		"pwntester/octo.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"ibhagwan/fzf-lua",
			"nvim-tree/nvim-web-devicons",
		},
		keys = {
			{ "<leader>lp", "<cmd>Octo pr list author=franciscoj<cr>", desc = "List my PRs" },
			{ "<leader>li", "<cmd>Octo issue list<cr>", desc = "List issues" },
		},
		cmd = { "Octo" },
		opts = {
			picker = "fzf-lua",
		},
	},
	{
		"sindrets/diffview.nvim",
		keys = {
			{ "<leader>gd", "<CMD>DiffviewOpen<CR>", desc = "Git diff" },
			{ "<leader>gD", "<CMD>DiffviewOpen HEAD~1<CR>", desc = "Git diff last commit" },
			{ "<leader>dc", "<CMD>DiffviewClose<CR>", desc = "Close git diff" },
		},
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
