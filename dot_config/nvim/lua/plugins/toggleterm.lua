local math = require("math")

return {
	{
		"akinsho/toggleterm.nvim",
		lazy = true,
		keys = {
			{ "<leader><ESC>", [[<CMD>:ToggleTerm<CR>]] },
			{ mode = "t", "<leader><ESC>", [[<C-\><C-N><CMD>:ToggleTerm<CR>]] },
			{ mode = "t", "<LocalLeader><ESC>", [[<C-\><C-N>]] },
		},
		config = function()
			require("toggleterm").setup({
				direction = "tab",
			})
		end,
	},
}
