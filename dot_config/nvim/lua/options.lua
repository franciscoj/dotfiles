-- These are what I consider my preferred and sensible vim options
local home = os.getenv("HOME")
local options = {
  autoread = true,
  backup = true,
  backupdir = home.."/.config/nvim/files/backup/",
  clipboard = "unnamedplus",
  cmdheight = 2,
  completeopt = "menu,menuone,noselect",
  copyindent = true,
  cursorline = true,
  directory = home.."/.config/nvim/files/swap/",
  expandtab = true,
  fileencoding = "utf-8",
  hlsearch = true,
  ignorecase = true,
  list = false,
  listchars = "trail:~,tab:| ,eol:¬",
  mouse = "a",
  number = true,
  numberwidth = 4,
  relativenumber = true,
  scrolloff = 8,
  shada ="'100,n"..home.."/.config/nvim/files/info/viminfo",
  shiftwidth = 2,
  sidescrolloff = 8,
  signcolumn = "yes",
  smartcase = true,
  smartindent = true,
  smarttab = true,
  spell = false,
  spelllang = "en_US",
  splitbelow = true,
  splitright = true,
  tabstop = 2,
  termguicolors = true,
  timeoutlen = 500,
  undodir = home.."/.config/nvim/files/undo/",
  undofile = true,
  updatetime = 300,
  viewdir = home.."/.config/nvim/files/view",
  wrap = false,
}

for k, v in pairs(options) do
  vim.opt[k] = v
end

-- On a delete and insert (e.g. `caw`) it mark where the change ends.
vim.opt.cpoptions:append "$"

-- Leader and LocalLeader that are accessible and usable
vim.g.mapleader = " "
vim.g.maplocalleader = ","

-- Remove tons of stuff from netrw and set it a a tree to make it more comfortable to use
vim.g.netrw_liststyle = 3
