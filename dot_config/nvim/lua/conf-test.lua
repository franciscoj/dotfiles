return function()
	local fterm = function(cmd)
		require("FTerm").run(cmd)
	end

	vim.g["test#custom_strategies"] = { fterm = fterm }
	vim.g["test#strategy"] = "fterm"

	vim.keymap.set("n", "<leader>tf", ":TestFile<cr>")
	vim.keymap.set("n", "<leader>tl", ":TestNearest<cr>")
	vim.keymap.set("n", "<leader>tr", ":TestLast<cr>")
	vim.keymap.set("n", "<leader>ts", ":TestSuite<cr>")
end
