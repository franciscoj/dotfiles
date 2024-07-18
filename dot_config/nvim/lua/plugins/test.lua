--# selene: allow(mixed_table)
return {
	{
		"vim-test/vim-test",
		enabled = not vim.g.started_by_firenvim,
		keys = {
			{
				"<LocalLeader>tf",
				"<CMD>TestFile<CR>",
				desc = "Run current test file",
			},
			{
				"<LocalLeader>tl",
				"<CMD>TestNearest<CR>",
				desc = "Run nearest test",
			},
			{
				"<LocalLeader>tr",
				"<CMD>TestLast<CR>",
				desc = "Repeat last test run",
			},
		},
		dependencies = {
			"akinsho/toggleterm.nvim",
		},
		config = function() vim.g["test#strategy"] = "toggleterm" end,
	},
}
