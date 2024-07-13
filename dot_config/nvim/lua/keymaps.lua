local h = require("h")

-- Easily add ending characters
h.nnoremap("<leader>,", "mzA,<esc>`z:delm z<cr>")
h.nnoremap("<leader>.", "mzA.<esc>`z:delm z<cr>")
h.nnoremap("<leader>;", "mzA;<esc>`z:delm z<cr>")
h.nnoremap("<leader>:", "mzA:<esc>`z:delm z<cr>")

-- Save
h.nnoremap("<leader>w", ":write<cr>")
h.nnoremap("<leader>wa", ":wall<cr>")

-- Edit file on current folder
h.nnoremap("<leader>e", ":e <C-R>=expand('%:p:h') . '/'<cr>")
h.nnoremap("<leader>ec", [[:let @+ = expand("%")<cr>]])
h.nnoremap("<leader>eC", [[:let @+ = expand("%:p")<cr>]])

-- Toggle search highlight off
h.nnoremap("<LocalLeader><esc>", ":nohlsearch<cr>")

-- Win management
h.nnoremap("<C-J>", ":wincmd j<CR>")
h.nnoremap("<C-K>", ":wincmd k<CR>")
h.nnoremap("<C-H>", ":wincmd h<CR>")
h.nnoremap("<C-L>", ":wincmd l<CR>")
h.nnoremap("<leader>s", ":wincmd s<CR>")
h.nnoremap("<leader>v", ":wincmd v<CR>")
h.nnoremap("<leader>q", ":wincmd c<CR>")

-- Tab management
h.nnoremap("<leader>tt", ":tabnew %<CR>")
h.nnoremap("<leader>tc", ":tabclose")

-- Code movement
h.nnoremap("<C-u>", "<C-u>zz")
h.nnoremap("<C-d>", "<C-d>zz")
h.nnoremap("n", "nzz")
h.nnoremap("N", "Nzz")

-- More comfortable <esc>
vim.keymap.set("i", "jj", "<esc>")

-- Reselect after indent
vim.keymap.set("x", "<", "<gv")
vim.keymap.set("x", ">", ">gv")

-- Easy add ::
vim.keymap.set("i", ";;", "::")

-- Load session in case it exists
vim.keymap.set("n", "<leader>sl", function()
	if vim.fn.getftype("Session.vim") ~= "" then
		vim.cmd [[source Session.vim]]
	else
		print("No Session.vim file")
	end
end)

-- Neovim config
require("franciscoj.reload")
h.nnoremap("<leader>vr", "<cmd>lua ReloadConfig()<CR>")
h.nnoremap("<Leader>ve", ":e $MYVIMRC<CR>")
