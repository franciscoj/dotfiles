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
h.nnoremap("<leader>tc", ":tabclose<CR>")

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

-- Load Session.vim in case it exists
vim.keymap.set("n", "<leader>sl", function()
	if vim.fn.getftype("Session.vim") ~= "" then
		vim.cmd([[source Session.vim]])
	else
		vim.notify("No Session.vim file", vim.log.levels.WARN)
	end
end)

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
end)
