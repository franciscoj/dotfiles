return function()
	local h = require("h")
	local fterm = function(cmd)
		require("FTerm").run(cmd)
	end

	vim.g["test#custom_strategies"] = { fterm = fterm }
	vim.g["test#strategy"] = "fterm"

	h.nnoremap("<leader>tf", ":TestFile<cr>")
	h.nnoremap("<leader>tl", ":TestNearest<cr>")
	h.nnoremap("<leader>tr", ":TestLast<cr>")
	h.nnoremap("<leader>ts", ":TestSuite<cr>")
end
