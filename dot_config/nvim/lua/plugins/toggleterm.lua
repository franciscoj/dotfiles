--# selene: allow(mixed_table)
local math = require("math")

return {
	{
		"akinsho/toggleterm.nvim",
		lazy = true,
		keys = {
			{ "<leader><ESC>", [[<CMD>:ToggleTerm<CR>]], desc = "Toggle terminal" },
			{ "<leader><ESC>", [[<C-\><C-N><CMD>:ToggleTerm<CR>]], mode = "t", desc = "Toggle terminal" },
			{ "<LocalLeader><ESC>", [[<C-\><C-N>]], mode = "t", desc = "Normal mode" },
		},
		config = function()
			require("toggleterm").setup({
				direction = "tab",
			})
		end,
	},
}
