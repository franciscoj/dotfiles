local home = os.getenv("HOME")
local cfg = home .. "/.config/nvim"

-- These are what I consider my preferred and sensible vim options. I keep each
-- one commented because I always forget what each one does.

-- Leader and LocalLeader that are accessible and usable
vim.g.mapleader = " "
vim.g.maplocalleader = ","
vim.opt.fileencoding = "utf-8" -- Assume files are on UTF-8

-- Use a menu for completions but don't automatically select one of the
-- options.
vim.opt.pumheight = 7
vim.opt.completeopt = { "menu", "menuone", "noselect", "preview", "popup" }
vim.opt.mouse = "a"               -- Enable the mouse, sometimes usefull for scrolling
vim.opt.timeoutlen = 500          -- ms to complete a mapping
vim.opt.clipboard = "unnamedplus" -- Use system clipboard

-- Enable backups
vim.opt.backup = true
vim.opt.backupdir = cfg .. "/files/backup/"
vim.opt.directory = cfg .. "/files/swap/"

-- Persist undo history
vim.opt.undodir = cfg .. "/files/undo/"
vim.opt.undofile = true

-- Store some info so that it is shared between neovim sessions
vim.opt.shada = "'100,n" .. cfg .. "/files/info/viminfo"

-- Destination for :mkview
vim.opt.viewdir = cfg .. "/files/view"

-- Keep list disabled but ready to be enabled
vim.opt.list = false
vim.opt.listchars = { trail = "~", tab = "| ", eol = "¬" }

-- Show current line's number and relative numbers on all the others.
vim.opt.number = true
vim.opt.numberwidth = 4
vim.opt.relativenumber = true

-- Keep the signcolum always on
vim.opt.signcolumn = "yes"
vim.opt.hlsearch = true   -- Highlight search
vim.opt.ignorecase = true -- Ignore case by default
vim.opt.smartcase = true  -- But take it into account if present in the search term
vim.opt.splitbelow = true -- Put new horizontal split below
vim.opt.splitright = true -- Put new vertical split on right

-- Number of rows/columns to keep visible before getting to screen limits
vim.opt.scrolloff = 8
vim.opt.sidescrolloff = 8

-- Indent as 2 spaces by default, when tab present, use it
vim.opt.copyindent = true
vim.opt.expandtab = true
vim.opt.shiftwidth = 2
vim.opt.smartindent = true
vim.opt.smarttab = true
vim.opt.tabstop = 2

-- Ignore spelling by default, but use en when using it (mainly .md and commit
-- messages)
vim.opt.spell = false
vim.opt.spelllang = "en"
vim.opt.spellfile = cfg .. "/spell/en.utf-8.add"

-- These make things look prettier
vim.opt.cmdheight = 1        -- Single line for command mode
vim.opt.cursorline = true    -- Highlights the line where the cursor is
vim.opt.termguicolors = true -- Enables 24-bit RGB color
vim.opt.wrap = false         -- Don't auto-wrap lines by default

-- On a delete and insert (e.g. `caw`) it mark where the change ends.
vim.opt.cpoptions:append("$")

vim.opt.winborder = "rounded"

-- Use zsh if available
if vim.fn.executable("/bin/zsh") then
	vim.opt.shell = "/bin/zsh"
end

if vim.env.CODESPACES then
	vim.g.clipboard = {
		name = "rdm",
		copy = {
			["+"] = { "rdm", "copy" },
			["*"] = { "rdm", "copy" },
		},
		paste = {
			["+"] = { "rdm", "paste" },
			["*"] = { "rdm", "paste" },
		},
	}
end

vim.opt.laststatus = 3

vim.cmd([[set guifont=JetBrainsMono\ Nerd\ Font:h20]])
