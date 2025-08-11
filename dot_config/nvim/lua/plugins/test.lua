--# selene: allow(mixed_table)
return {
	{
		"vim-test/vim-test",
		keys = {
			{ "<LocalLeader>tf", "<CMD>TestFile<CR>", desc = "Run test file" },
			{ "<LocalLeader>tl", "<CMD>TestNearest<CR>", desc = "Run nearest test" },
			{ "<LocalLeader>tr", "<CMD>TestLast<CR>", desc = "Repeat last test" },
		},
		dependencies = {
			"akinsho/toggleterm.nvim",
		},
		init = function()
			vim.g["test#strategy"] = "toggleterm"
			vim.g["test#csharp#runner"] = "dotnettest"
			-- normal verbosity
			vim.g["test#csharp#dotnettest#options"] = "-v:n"
		end,
	},
}
