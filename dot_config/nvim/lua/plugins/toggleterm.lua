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
				if vim.o.lines >= 40 then
					return 20
				end

				return 40
			end,
			open_mapping = [[<leader><ESC>]],
			auto_scroll = false,
			responsiveness = {
				horizontal_breakpoint = 100,
			},
		},
	},
}
