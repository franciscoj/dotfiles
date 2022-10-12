return function()
	vim.keymap.set("n", "<leader>gg", ":Git<space>")
	vim.keymap.set("n", "<leader>gs", ":Git<cr>")
	vim.keymap.set("n", "<leader>gb", ":Git blame<cr>")
	vim.keymap.set("n", "<leader>gl", ":GV!<cr>") -- Log for current file
	vim.keymap.set("n", "<leader>gL", ":GV<cr>") -- Log for repo
	vim.keymap.set("n", "<leader>go", ":GBrowse<CR>")
	vim.keymap.set("v", "<leader>go", ":'<,'>GBrowse<CR>")
end
