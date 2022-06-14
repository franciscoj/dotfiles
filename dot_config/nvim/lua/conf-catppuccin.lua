local catppuccin = require("catppuccin")

catppuccin.setup({
	integrations = {
		dashboard = false,
		fern = true,
		indent_blankline = { enabled = false },
		lsp_saga = false,
		lsp_trouble = true,
		notify = false,
		nvimtree = { enabled = false },
	},
})
vim.cmd([[colorscheme catppuccin]])
