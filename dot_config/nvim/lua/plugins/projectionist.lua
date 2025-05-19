--# selene: allow(mixed_table)
return {
	{
		"tpope/vim-projectionist",
		event = "VeryLazy",
		config = function()
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

			vim.keymap.set("n", "<leader><leader>", "<cmd>A<cr>", { desc = "Alternate file" })
			vim.keymap.set("n", "v<leader><leader>", "<cmd>AV<cr>", { desc = "Alternate file (vert)" })
			vim.keymap.set("n", "s<leader><leader>", "<cmd>AS<cr>", { desc = "Alternate file (hor)" })
		end,
	},
}
