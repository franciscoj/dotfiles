--# selene: allow(mixed_table)
return {
	{
		"catppuccin/nvim",
		name = "catppuccin",
		build = ":CatppuccinCompile",
		config = function()
			local catppuccin = require("catppuccin")
			local colors = require("catppuccin.palettes").get_palette()

			catppuccin.setup({
				flavour = "auto",
				float = {
					transparent = false,
					solid = false,
				},
				background = {
					light = "latte",
					dark = "macchiato",
				},
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
					blink_cmp = true,
					dap = true,
					diffview = true,
					flash = true,
					fzf = true,
					gitsigns = true,
					grug_far = true,
					lsp_trouble = true,
					markdown = true,
					mason = true,
					mini = true,
					native_lsp = {
						enabled = true,
					},
					neotree = true,
					noice = true,
					octo = true,
					overseer = true,
					snacks = true,
					treesitter = true,
					treesitter_context = true,
				},
				highlight_overrides = {
					WinSeparator = { bg = colors.none },
				},
			})

			vim.cmd([[colorscheme catppuccin]])
		end,
	},
}
