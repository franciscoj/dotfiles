--[[
lvim is the global options object

Linters should be
filled in as strings with either
a global executable or a path to
an executable
]]
-- THESE ARE EXAMPLE CONFIGS FEEL FREE TO CHANGE TO WHATEVER YOU WANT

-- general
lvim.log.level = "warn"
lvim.format_on_save = true
lvim.colorscheme = "dracula"

-- keymappings [view all the defaults by pressing <leader>Lk]
lvim.leader = "space"
-- add your own keymapping
lvim.keys.normal_mode["<C-s>"] = ":w<cr>"
-- unmap a default keymapping
-- lvim.keys.normal_mode["<C-Up>"] = ""
-- edit a default keymapping
-- lvim.keys.normal_mode["<C-q>"] = ":q<cr>"

-- Change Telescope navigation to use j and k for navigation and n and p for history in both input and normal mode.
-- we use protected-mode (pcall) just in case the plugin wasn't loaded yet.
-- local _, actions = pcall(require, "telescope.actions")
-- lvim.builtin.telescope.defaults.mappings = {
--   -- for input mode
--   i = {
--     ["<C-j>"] = actions.move_selection_next,
--     ["<C-k>"] = actions.move_selection_previous,
--     ["<C-n>"] = actions.cycle_history_next,
--     ["<C-p>"] = actions.cycle_history_prev,
--   },
--   -- for normal mode
--   n = {
--     ["<C-j>"] = actions.move_selection_next,
--     ["<C-k>"] = actions.move_selection_previous,
--   },
-- }

-- Use which-key to add extra bindings with the leader-key prefix
-- lvim.builtin.which_key.mappings["P"] = { "<cmd>Telescope projects<CR>", "Projects" }
-- lvim.builtin.which_key.mappings["t"] = {
--   name = "+Trouble",
--   r = { "<cmd>Trouble lsp_references<cr>", "References" },
--   f = { "<cmd>Trouble lsp_definitions<cr>", "Definitions" },
--   d = { "<cmd>Trouble lsp_document_diagnostics<cr>", "Diagnostics" },
--   q = { "<cmd>Trouble quickfix<cr>", "QuickFix" },
--   l = { "<cmd>Trouble loclist<cr>", "LocationList" },
--   w = { "<cmd>Trouble lsp_workspace_diagnostics<cr>", "Diagnostics" },
-- }
lvim.builtin.which_key.mappings[","] = { "mzA,<esc>`z:delm z<cr>", "Add trailing ," }
lvim.builtin.which_key.mappings[";"] = { "mzA;<esc>`z:delm z<cr>", "Add trailing ;" }
lvim.builtin.which_key.mappings[":"] = { "mzA:<esc>`z:delm z<cr>", "Add trailing :" }
lvim.builtin.which_key.mappings["<leader>"] = {
  name = "+Fugitive",
  s = { ":Git<cr>", "Status" },
  b = { ":Git blame<cr>", "Blame" },
  l = { ":GV!<cr>", "Log for current file" },
  L = { ":GV<cr>", "Log for project" },
}

-- TODO: User Config for predefined plugins
-- After changing plugin config exit and reopen LunarVim, Run :PackerInstall :PackerCompile
lvim.builtin.dashboard.active = false
lvim.builtin.terminal.active = true
lvim.builtin.nvimtree.setup.view.side = "left"
lvim.builtin.nvimtree.show_icons.git = 0

-- if you don't want all the parsers change this to a table of the ones you want
lvim.builtin.treesitter.ensure_installed = {
  "bash",
  "css",
  "go",
  "javascript",
  "json",
  "lua",
  "python",
  "rust",
  "typescript",
  "yaml",
}

lvim.builtin.treesitter.ignore_install = { "haskell" }
lvim.builtin.treesitter.highlight.enabled = true

-- generic LSP settings

-- ---@usage disable automatic installation of servers
-- lvim.lsp.automatic_servers_installation = false

-- ---@usage Select which servers should be configured manually. Requires `:LvimCacheRest` to take effect.
-- See the full default list `:lua print(vim.inspect(lvim.lsp.override))`
-- vim.list_extend(lvim.lsp.override, { "pyright" })

-- ---@usage setup a server -- see: https://www.lunarvim.org/languages/#overriding-the-default-configuration
-- local opts = {} -- check the lspconfig documentation for a list of all possible options
-- require("lvim.lsp.manager").setup("pylsp", opts)

-- you can set a custom on_attach function that will be used for all the language servers
-- See <https://github.com/neovim/nvim-lspconfig#keybindings-and-completion>
-- lvim.lsp.on_attach_callback = function(client, bufnr)
--   local function buf_set_option(...)
--     vim.api.nvim_buf_set_option(bufnr, ...)
--   end
--   --Enable completion triggered by <c-x><c-o>
--   buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")
-- end
-- you can overwrite the null_ls setup table (useful for setting the root_dir function)
-- lvim.lsp.null_ls.setup = {
--   root_dir = require("lspconfig").util.root_pattern("Makefile", ".git", "node_modules"),
-- }
-- or if you need something more advanced
-- lvim.lsp.null_ls.setup.root_dir = function(fname)
--   if vim.bo.filetype == "javascript" then
--     return require("lspconfig/util").root_pattern("Makefile", ".git", "node_modules")(fname)
--       or require("lspconfig/util").path.dirname(fname)
--   elseif vim.bo.filetype == "php" then
--     return require("lspconfig/util").root_pattern("Makefile", ".git", "composer.json")(fname) or vim.fn.getcwd()
--   else
--     return require("lspconfig/util").root_pattern("Makefile", ".git")(fname) or require("lspconfig/util").path.dirname(fname)
--   end
-- end

-- -- set a formatter, this will override the language server formatting capabilities (if it exists)
-- local formatters = require "lvim.lsp.null-ls.formatters"
-- formatters.setup {
--   { exe = "black", filetypes = { "python" } },
--   { exe = "isort", filetypes = { "python" } },
--   {
--     exe = "prettier",
--     ---@usage arguments to pass to the formatter
--     -- these cannot contain whitespaces, options such as `--line-width 80` become either `{'--line-width', '80'}` or `{'--line-width=80'}`
--     args = { "--print-with", "100" },
--     ---@usage specify which filetypes to enable. By default a providers will attach to all the filetypes it supports.
--     filetypes = { "typescript", "typescriptreact" },
--   },
-- }

-- -- set additional linters
-- local linters = require "lvim.lsp.null-ls.linters"
-- linters.setup {
--   { exe = "flake8", filetypes = { "python" } },
--   {
--     exe = "shellcheck",
--     ---@usage arguments to pass to the formatter
--     -- these cannot contain whitespaces, options such as `--line-width 80` become either `{'--line-width', '80'}` or `{'--line-width=80'}`
--     args = { "--severity", "warning" },
--   },
--   {
--     exe = "codespell",
--     ---@usage specify which filetypes to enable. By default a providers will attach to all the filetypes it supports.
--     filetypes = { "javascript", "python" },
--   },
-- }

-- Additional Plugins
-- lvim.plugins = {
--     {"folke/tokyonight.nvim"},
--     {
--       "folke/trouble.nvim",
--       cmd = "TroubleToggle",
--     },
-- }
lvim.plugins = {
  {"dracula/vim"}, -- colorscheme
   -- git plugins
  {"tpope/vim-fugitive"},
  {"junegunn/gv.vim"},
  {"tpope/vim-rhubarb"},
   -- QoL plugins
  {"tpope/vim-surround"},
  {"tpope/vim-unimpaired"},
  {"tpope/vim-repeat"},
  {"tpope/vim-rsi"},
  -- Running tests
  {
    "kassio/neoterm",
    config = function ()
      local h = require("h")
      vim.g.neoterm_default_mod = 'botright'
      vim.g.neoterm_autoinsert = 1

      -- Use count to toggle a different format, e.g. 2<leader><esc> will toggle a second and different terminal
      h.nnoremap("<leader><esc>", ":<C-U>exec v:count.'Ttoggle resize=40'<CR>")
      h.tnoremap("<leader><esc>", "<C-\\><C-N>:<C-U>exec v:count.'Ttoggle resize=40'<CR>")
      h.nnoremap("<leader><leader><esc>", ":<C-U>exec v:count.'Tclear'<cr>")
      h.tnoremap("<leader><leader><esc>", "<C-\\><C-N>:<C-U>exec v:count.'Tclear'<cr>A")
      h.tnoremap("<esc><esc>", "<C-\\><C-N>")
    end,
  },
  {
    "vim-test/vim-test",
    config = function ()
      local h = require("h")
      vim.g["test#strategy"] = "neoterm"

      h.nnoremap("<leader>tf", ":TestFile<cr>")
      h.nnoremap("<leader>tl", ":TestNearest<cr>")
      h.nnoremap("<leader>tr", ":TestLast<cr>")
      h.nnoremap("<leader>ts", ":TestSuite<cr>")
    end,
  },
  {
    "embear/vim-localvimrc",
    config = function ()
      vim.g.localvimrc_persistent = true
    end
  },
  -- Per project config
  {
    "AndrewRadev/splitjoin.vim",
    config = function ()
      vim.g.splitjoin_ruby_curly_braces = false
      vim.g.splitjoin_ruby_hanging_args = false
    end
  }
}

-- Autocommands (https://neovim.io/doc/user/autocmd.html)
-- lvim.autocommands.custom_groups = {
--   { "BufWinEnter", "*.lua", "setlocal ts=8 sw=8" },
-- }

-- Default on lunarvim is too low and makes it rather impossible to use some
-- "samekey" combinations like `jj` instead of <esc> and `cc` on fugitive
vim.opt.timeoutlen = 500