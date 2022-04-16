vim.g["test#strategy"] = "neoterm"

vim.keymap.set("n", "<leader>tf", ":TestFile<cr>")
vim.keymap.set("n", "<leader>tl", ":TestNearest<cr>")
vim.keymap.set("n", "<leader>tr", ":TestLast<cr>")
vim.keymap.set("n", "<leader>ts", ":TestSuite<cr>")
