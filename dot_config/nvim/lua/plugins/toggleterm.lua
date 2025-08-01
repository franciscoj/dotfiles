--# selene: allow(mixed_table)
return {
	{
		"akinsho/toggleterm.nvim",
		keys = {
			{ "<leader><ESC>", [[<CMD>:ToggleTerm<CR>]], desc = "Toggle terminal" },
			{ "<leader><ESC>", [[<C-\><C-N><CMD>:ToggleTerm<CR>]], mode = "t", desc = "Toggle terminal" },
			{ "<LocalLeader><ESC>", [[<C-\><C-N>]], mode = "t", desc = "Normal mode" },
		},
		opts = {},
	},
}
