local math = require("math")

return {
	{
		"akinsho/toggleterm.nvim",
		config = function()
			vim.keymap.set("n", "<leader><ESC>", [[<CMD>:ToggleTerm<CR>]])
			vim.keymap.set("t", "<leader><ESC>", [[<C-\><C-N><CMD>:ToggleTerm<CR>]])
			vim.keymap.set("t", "<LocalLeader><ESC>", [[<C-\><C-N>]])
			require("toggleterm").setup({
				direction = "float",
				float_opts = {
					border = "rounded",
					width = function()
						return math.floor(vim.o.columns * 0.95)
					end,
					height = function()
						return math.floor(vim.o.lines * 0.95)
					end,
				},
			})
		end,
	},
}
