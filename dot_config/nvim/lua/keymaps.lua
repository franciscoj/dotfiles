-- Easily add ending characters
vim.keymap.set("n", "<leader>,", "mzA,<esc>`z:delm z<cr>")
vim.keymap.set("n", "<leader>;", "mzA;<esc>`z:delm z<cr>")
vim.keymap.set("n", "<leader>:", "mzA:<esc>`z:delm z<cr>")

-- Save
vim.keymap.set("n", "<leader>w", ":write<cr>")
vim.keymap.set("n", "<leader>wa", ":wall<cr>")

-- Edit file on current folder
vim.keymap.set("n", "<leader>e", ":e <C-R>=expand('%:p:h') . '/'<cr>")

-- Toggle search highlight off
vim.keymap.set("n", "<LocalLeader><esc>", ":nohlsearch<cr>")

-- Win management
vim.keymap.set("n", "<C-J>", ":wincmd j<CR>")
vim.keymap.set("n", "<C-K>", ":wincmd k<CR>")
vim.keymap.set("n", "<C-H>", ":wincmd h<CR>")
vim.keymap.set("n", "<C-L>", ":wincmd l<CR>")
vim.keymap.set("n", "<leader>s", ":wincmd s<CR>")
vim.keymap.set("n", "<leader>v", ":wincmd v<CR>")
vim.keymap.set("n", "<leader>q", ":wincmd c<CR>")

-- More comfortable <esc>
vim.keymap.set("i", "jj", "<esc>")

-- Reselect after indent
vim.keymap.set("x", "<", "<gv")
vim.keymap.set("x", ">", ">gv")

-- Neovim config
vim.keymap.set("n", "<Leader>vr", ":source $MYVIMRC<CR>")
vim.keymap.set("n", "<Leader>ve", ":e $MYVIMRC<CR>")
