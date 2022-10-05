local nnoremap = function(lhs, rhs)
  vim.keymap.set("n", lhs, rhs, { silent = true })
end
-- Easily add ending characters
nnoremap("<leader>,", "mzA,<esc>`z:delm z<cr>")
nnoremap("<leader>;", "mzA;<esc>`z:delm z<cr>")
nnoremap("<leader>:", "mzA:<esc>`z:delm z<cr>")

-- Save
nnoremap("<leader>w", ":write<cr>")
nnoremap("<leader>wa", ":wall<cr>")

-- Edit file on current folder
nnoremap("<leader>e", ":e <C-R>=expand('%:p:h') . '/'<cr>")

-- Toggle search highlight off
nnoremap("<LocalLeader><esc>", ":nohlsearch<cr>")

-- Win management
nnoremap("<C-J>", ":wincmd j<CR>")
nnoremap("<C-K>", ":wincmd k<CR>")
nnoremap("<C-H>", ":wincmd h<CR>")
nnoremap("<C-L>", ":wincmd l<CR>")
nnoremap("<leader>s", ":wincmd s<CR>")
nnoremap("<leader>v", ":wincmd v<CR>")
nnoremap("<leader>q", ":wincmd c<CR>")

-- More comfortable <esc>
vim.keymap.set("i", "jj", "<esc>")

-- Reselect after indent
vim.keymap.set("x", "<", "<gv")
vim.keymap.set("x", ">", ">gv")

-- Neovim config

require("franciscoj.reload")
nnoremap("<leader>vr", "<cmd>lua ReloadConfig()<CR>")
nnoremap("<Leader>ve", ":e $MYVIMRC<CR>")
