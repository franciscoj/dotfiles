return {
	{
		"catppuccin/nvim",
		name = "catppuccin",
		build = ":CatppuccinCompile",
		config = function()
			if vim.g.started_by_firenvim == true then
				vim.g.catppuccin_flavour = "latte"
			else
				vim.g.catppuccin_flavour = "macchiato"
			end

			local catppuccin = require("catppuccin")
			local colors = require("catppuccin.palettes").get_palette()

			catppuccin.setup({
				compile = { enabled = true },
				dim_inactive = {
					enabled = true,
					shade = "dark",
				},
				styles = {
					comments = { "italic" },
					functions = { "italic", "bold" },
					keywords = { "bold" },
				},
				integrations = {
					bufferline = true,
					cmp = true,
					dap = {
						enabled = true,
						enable_ui = true,
					},
					fern = true,
					gitsigns = true,
					hop = true,
					lsp_trouble = true,
					markdown = true,
					mason = true,
					native_lsp = {
						enabled = true,
					},
					noice = true,
					telescope = true,
					treesitter = true,
					treesitter_context = true,
				},
				highlight_overrides = {
					WinSeparator = { bg = colors.none },
				},
			})

			vim.cmd([[colorscheme catppuccin]])
			vim.api.nvim_set_hl(0, "DapStopped", { fg = colors.sky })
		end,
	},
}
