local h = require("h")

h.nnoremap("<leader>gg", ":Git<space>")
h.nnoremap("<leader>gs", ":Git<cr>")
h.nnoremap("<leader>gb", ":Git blame<cr>")
h.nnoremap("<leader>gl", ":GV!<cr>") -- Log for current file
h.nnoremap("<leader>gL", ":GV<cr>") -- Log for repo
h.nnoremap("<leader>go", ":GBrowse<CR>")
h.xnoremap("<leader>go", ":'<,'>GBrowse<CR>")
