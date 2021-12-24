local h = require("h")

-- Easily add ending characters
h.nnoremap("<leader>,", "mzA,<esc>`z:delm z<cr>")
h.nnoremap("<leader>;", "mzA;<esc>`z:delm z<cr>")
h.nnoremap("<leader>:", "mzA:<esc>`z:delm z<cr>")

-- Save
h.nnoremap("<leader>w", ":write<cr>")
h.nnoremap("<leader>wa", ":wall<cr>")

-- Edit file on current folder
h.nnoremap("<leader>e", ":e <C-R>=expand('%:p:h') . '/'<cr>")

-- Toggle search highlight off
h.nnoremap("<esc><esc>", ":nohlsearch<cr>")

-- Win management
h.nnoremap("<C-J>", ":wincmd j<CR>")
h.nnoremap("<C-K>", ":wincmd k<CR>")
h.nnoremap("<C-H>", ":wincmd h<CR>")
h.nnoremap("<C-L>", ":wincmd l<CR>")
h.nnoremap("<leader>s", ":wincmd s<CR>")
h.nnoremap("<leader>v", ":wincmd v<CR>")
h.nnoremap("<leader>q", ":wincmd c<CR>")

-- More comfortable <esc>
h.inoremap("jj", "<esc>")

-- Reselect after indent
h.xnoremap("<", "<gv")
h.xnoremap(">", ">gv")
