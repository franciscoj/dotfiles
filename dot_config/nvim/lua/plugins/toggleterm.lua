--# selene: allow(mixed_table)
local math = require("math")

return {
	{
		"akinsho/toggleterm.nvim",
		lazy = true,
		keys = {
			{ "<leader><ESC>", [[<CMD>:ToggleTerm<CR>]] },
			{ "<leader><ESC>", [[<C-\><C-N><CMD>:ToggleTerm<CR>]], mode = "t" },
			{ "<LocalLeader><ESC>", [[<C-\><C-N>]], mode = "t" },
		},
		config = function()
			require("toggleterm").setup({
				direction = "tab",
			})
		end,
	},
}
