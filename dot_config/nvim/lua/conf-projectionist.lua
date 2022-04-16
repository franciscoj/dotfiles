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

vim.keymap.set("n", "<leader><leader>", "<cmd>A<cr>")
vim.keymap.set("n", "1<leader><leader>", "<cmd>AV<cr>")
