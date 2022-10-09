return function()
	local fterm = require("FTerm")

	fterm.setup({
		border = "rounded",
		dimensions = {
			height = 0.95,
			width = 0.95,
		},
	})

	vim.keymap.set("n", "<leader><ESC>", fterm.toggle)
	vim.keymap.set("t", "<leader><ESC>", "<C-\\><C-N><CMD>lua require('FTerm').toggle()<CR>")
	vim.keymap.set("t", "<LocalLeader><ESC>", "<C-\\><C-N>")
end
