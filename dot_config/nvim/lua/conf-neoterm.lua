local h = require("h")

vim.g.neoterm_default_mod = 'botright'
vim.g.neoterm_autoinsert = 1

-- Use a count to toggle a different terminal. E.g. 1tt will toggle the first
-- one, while 2<leader>tt will toggle the second one.
h.nnoremap("<leader><ESC>", ":<C-U>exec v:count.'Ttoggle resize=40'<CR>")
h.nnoremap("<leader><leader><ESC>", ":<C-U>exec v:count.'Tclear'<cr>")
h.tnoremap("<leader><leader><ESC>", "<C-\\><C-N>:<C-U>exec v:count.'Tclear'<cr>A")
h.tnoremap("<leader><ESC>", "<C-\\><C-N>:<C-U>exec v:count.'Ttoggle resize=40'<CR>")
-- <ESC><ESC> will get into normal mode and toggle-off the terminal
h.tnoremap("<ESC><ESC>", "<C-\\><C-N>")

