--# selene: allow(mixed_table)
return {
	{
		"akinsho/toggleterm.nvim",
		keys = {
			{ "<LocalLeader><ESC>", [[<C-\><C-N>]], mode = "t", desc = "Normal mode" },
			{ "<leader>tf", "<cmd>TermSelect<cr>", mode = "n", desc = "Select terminal"}
		},
		lazy = false,
		cmd = {
			"ToggleTerm",
		},
		opts = {
			size = function()
				if vim.o.lines >= 80 then
					return 40
				end

				return 20
			end,
			open_mapping = [[<C-ESC>]],
			auto_scroll = false,
			responsiveness = {
				horizontal_breakpoint = 100,
			},
		},
	},
}
