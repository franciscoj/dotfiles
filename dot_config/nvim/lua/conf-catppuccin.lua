local catppuccin = require("catppuccin")

catppuccin.setup({
	integrations = {
		dashboard = false,
		indent_blankline = { enabled = false },
		lsp_saga = false,
		notify = false,
		nvimtree = { enabled = false },
	},
})
vim.cmd([[colorscheme catppuccin]])
