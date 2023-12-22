return {
	{
		"tpope/vim-projectionist",
		enabled = vim.g.started_by_firenvim ~= true,
		config = function()
			local h = require("h")
			vim.g.projectionist_heuristics = {
				["go.mod"] = {
					["*.go"] = {
						alternate = "{}_test.go",
						type = "source",
					},
					["*_test.go"] = {
						alternate = "{}.go",
						type = "test",
					},
				},
			}

			h.nnoremap("<leader><leader>", "<cmd>A<cr>")
			h.nnoremap("v<leader><leader>", "<cmd>AV<cr>")
			h.nnoremap("s<leader><leader>", "<cmd>AS<cr>")
		end,
	},
}
