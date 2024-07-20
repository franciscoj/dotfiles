-- Easily add ending characters
vim.keymap.set("n", "<leader>,", "mzA,<esc>`z:delm z<cr>", { desc = "EOL ," })
vim.keymap.set("n", "<leader>.", "mzA.<esc>`z:delm z<cr>", { desc = "EOL ." })
vim.keymap.set("n", "<leader>;", "mzA;<esc>`z:delm z<cr>", { desc = "EOL ;" })
vim.keymap.set("n", "<leader>:", "mzA:<esc>`z:delm z<cr>", { desc = "EOL :" })

-- Save
vim.keymap.set("n", "<leader>w", ":write<cr>", { desc = "Write file" })
vim.keymap.set("n", "<leader>wa", ":wall<cr>", { desc = "Write all files" })

-- Edit file on current folder
vim.keymap.set("n", "<leader>e", ":e <C-R>=expand('%:p:h') . '/'<cr>", { desc = "Edit on current folder" })
vim.keymap.set("n", "<leader>ec", [[:let @+ = expand("%")<cr>]], { desc = "Copy current path" })
vim.keymap.set("n", "<leader>eC", [[:let @+ = expand("%:p")<cr>]], { desc = "Copy current absolute path" })

-- Toggle search highlight off
vim.keymap.set("n", "<LocalLeader><esc>", ":nohlsearch<cr>", { desc = "Hide highlights" })

-- Win management
vim.keymap.set("n", "<C-J>", ":wincmd j<CR>", { desc = "Window ->" })
vim.keymap.set("n", "<C-K>", ":wincmd k<CR>", { desc = "Window ↓" })
vim.keymap.set("n", "<C-H>", ":wincmd h<CR>", { desc = "Window <-" })
vim.keymap.set("n", "<C-L>", ":wincmd l<CR>", { desc = "Window ↑" })
vim.keymap.set("n", "<leader>s", ":wincmd s<CR>", { desc = "Split --" })
vim.keymap.set("n", "<leader>v", ":wincmd v<CR>", { desc = "Split |" })
vim.keymap.set("n", "<leader>q", ":wincmd c<CR>", { desc = "Close window" })

-- Tab management
vim.keymap.set("n", "<leader>tt", ":tabnew %<CR>", { desc = "New tab" })
vim.keymap.set("n", "<leader>tc", ":tabclose<CR>", { desc = "Close tab" })

-- Code movement
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "n", "nzz")
vim.keymap.set("n", "N", "Nzz")

-- More comfortable <esc>
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
	else
		vim.notify("No Session.vim file", vim.log.levels.WARN)
	end
end, { desc = "Session load" })

-- Open the repo name inside quotes on the browser
local open_cmd = function()
	if vim.fn.executable("open") == 1 then
		return "open"
	end

	if vim.fn.executable("xdg-open") == 1 then
		return "xdg-open"
	end

	return false
end

local open = function(url)
	local cmd = open_cmd()

	if not cmd then
		vim.notify("couldn't find open or xdg-open, doing nothing", vim.log.levels.WARN)
	end

	local Job = require("plenary.job")
	Job:new({
		command = cmd,
		args = { url },
		cwd = "/usr/bin",
	}):sync() -- or start()
end

vim.keymap.set("n", "<leader>og", function()
	vim.cmd([[normal yi"]])
	local url = "https://github.com/" .. vim.fn.getreg("*")

	open(url)
end, { desc = "Browse repo under cursor" })
