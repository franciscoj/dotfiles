return {
	{
		"vim-test/vim-test",
		enabled = not vim.g.started_by_firenvim,
		keys = {
			{ "<leader>tf" },
			{ "<leader>tl" },
			{ "<leader>tr" },
		},
		config = function()
			local h = require("h")

			vim.g["test#strategy"] = "toggleterm"
			h.nnoremap("<leader>tf", "<CMD>TestFile<CR>")
			h.nnoremap("<leader>tl", "<CMD>TestNearest<CR>")
			h.nnoremap("<leader>tr", "<CMD>TestLast<CR>")
			h.nnoremap("<leader>ts", "<CMD>TestSuite<CR>")
		end,
	},
}
