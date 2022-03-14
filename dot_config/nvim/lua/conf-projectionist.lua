local h = require("h")

vim.g.projectionist_heuristics = {
	["go.mod"] = {
		["internal/*.go"] = {
			alternate = "internal/{}_test.go",
			type = "source",
		},
		["internal/*_test.go"] = {
			alternate = "internal/{}.go",
			type = "test",
		},
	},
}

h.nnoremap("<leader><leader>", "<cmd>A<cr>")
h.nnoremap("1<leader><leader>", "<cmd>AV<cr>")
