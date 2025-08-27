-- Easily add ending characters
vim.keymap.set("n", "<leader>,", "mzA,<esc>`z:delm z<cr>", { desc = "EOL ," })
vim.keymap.set("n", "<leader>.", "mzA.<esc>`z:delm z<cr>", { desc = "EOL ." })
vim.keymap.set("n", "<leader>;", "mzA;<esc>`z:delm z<cr>", { desc = "EOL ;" })
vim.keymap.set("n", "<leader>:", "mzA:<esc>`z:delm z<cr>", { desc = "EOL :" })

-- Save
vim.keymap.set("n", "<leader>w", "<cmd>write<cr>", { desc = "Write file" })
vim.keymap.set("n", "<leader>wa", "<cmd>wall<cr>", { desc = "Write all files" })

-- Edit file on current folder
vim.keymap.set("n", "<leader>e", ":e <C-R>=expand('%:p:h') . '/'<cr>", { desc = "Edit on current folder" })
vim.keymap.set("n", "<leader>ec", [[:let @+ = expand("%:p:h")<cr>]], { desc = "Copy current path" })
vim.keymap.set("n", "<leader>ef", [[:let @+ = expand("%:p:t")<cr>]], { desc = "Copy current file name" })




-- Toggle search highlight off
vim.keymap.set("n", "<LocalLeader><esc>", ":nohlsearch<cr>", { desc = "Hide highlights" })

-- Win management
vim.keymap.set("n", "<C-J>", "<cmd>wincmd j<CR>", { desc = "Window ->" })
vim.keymap.set("n", "<C-K>", "<cmd>wincmd k<CR>", { desc = "Window ↓" })
vim.keymap.set("n", "<C-H>", "<cmd>wincmd h<CR>", { desc = "Window <-" })
vim.keymap.set("n", "<C-L>", "<cmd>wincmd l<CR>", { desc = "Window ↑" })
vim.keymap.set("n", "<leader>s", "<cmd>wincmd s<CR>", { desc = "Split --" })
vim.keymap.set("n", "<leader>v", "<cmd>wincmd v<CR>", { desc = "Split |" })
vim.keymap.set("n", "<leader>q", "<cmd>wincmd c<CR>", { desc = "Close window" })

-- Tab management
vim.keymap.set("n", "<leader>tt", "<C-W>T", { desc = "Move to new tab" })
vim.keymap.set("n", "<leader>tc", "<cmd>tabclose<CR>", { desc = "Close tab" })

-- Code movement
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "n", "nzz")
vim.keymap.set("n", "N", "Nzz")

-- More comfortable <esc>
vim.keymap.set("i", "jk", "<esc>")
vim.keymap.set("i", "jj", "<esc>")

-- Reselect after indent
vim.keymap.set("x", "<", "<gv")
vim.keymap.set("x", ">", ">gv")

-- Easy add ::
vim.keymap.set("i", ";;", "::")

-- Load Session.vim in case it exists
vim.keymap.set("n", "<leader>sl", function()
	if vim.fn.getftype("Session.vim") ~= "" then
		vim.cmd([[source Session.vim]])
		vim.notify("Session loaded", vim.log.levels.INFO)
	else
		vim.notify("No Session.vim file", vim.log.levels.ERROR)
	end
end, { desc = "Load existing session" })

-- Open the repo name inside quotes on the browser
vim.keymap.set("n", "<leader>og", function()
	vim.cmd([[normal "zyi"]])
	local url = "https://github.com/" .. vim.fn.getreg("z")

	vim.ui.open(url)
	vim.notify("Opened: " .. url, vim.log.levels.INFO)
end, { desc = "Browse repo under cursor" })
