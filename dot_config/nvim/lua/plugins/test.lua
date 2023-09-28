return {
	{
		"vim-test/vim-test",
		keys = {
			{ "<leader>tf" },
			{ "<leader>tl" },
			{ "<leader>tr" },
		},
		config = function()
			local h = require("h")

			vim.g["test#strategy"] = "toggleterm"
			h.nnoremap("<leader>tf", ":TestFile<cr>")
			h.nnoremap("<leader>tl", ":TestNearest<cr>")
			h.nnoremap("<leader>tr", ":TestLast<cr>")
			h.nnoremap("<leader>ts", ":TestSuite<cr>")
		end,
	},
}
