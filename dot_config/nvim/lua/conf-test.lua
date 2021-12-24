local h = require("h")

vim.g["test#strategy"] = "neoterm"

h.nnoremap("<leader>tf", ":TestFile<cr>")
h.nnoremap("<leader>tl", ":TesttNearest<cr>")
h.nnoremap("<leader>tr", ":TestLast<cr>")
h.nnoremap("<leader>ts", ":TestSuite<cr>")
