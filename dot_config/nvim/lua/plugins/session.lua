--# selene: allow(mixed_table)
return {
	{
		"tpope/vim-obsession",
		keys = {
			{ "<leader>ss", "<cmd>Obsession<cr>", desc = "Session capture" },
			{ "<leader>sd", "<cmd>Obsession!<cr>", desc = "Session delete" },
		},
	},
}
