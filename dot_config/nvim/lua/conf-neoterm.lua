vim.g.neoterm_default_mod = "botright"
vim.g.neoterm_autoinsert = 1

-- Use a count to toggle a different terminal. E.g. 1tt will toggle the first
-- one, while 2<leader>tt will toggle the second one.
vim.keymap.set("n", "<leader><ESC>", ":<C-U>exec v:count.'Ttoggle resize=40'<CR>")
vim.keymap.set("n", "<leader><leader><ESC>", ":<C-U>exec v:count.'Tclear'<cr>")
vim.keymap.set("t", "<leader><leader><ESC>", "<C-\\><C-N>:<C-U>exec v:count.'Tclear'<cr>A")
vim.keymap.set("t", "<leader><ESC>", "<C-\\><C-N>:<C-U>exec v:count.'Ttoggle resize=40'<CR>")
-- <ESC><ESC> will get into normal mode and toggle-off the terminal
vim.keymap.set("t", "<LocalLeader><ESC>", "<C-\\><C-N>")
