return {
	{
		"stevearc/conform.nvim",
		config = function()
			local mason = require("franciscoj.mason")
			mason.ensure_tools({
				{ name = "goimports", version = "latest" },
				{ name = "stylua" },
				{ name = "prettier" },
			})

			require("conform").setup({
				formatters_by_ft = {
					go = { "goimports" },
					javascript = { "prettier" },
					json = { "prettier" },
					lua = { "stylua" },
					ruby = { "rubocop" },
					typescript = { "prettier" },
					["*"] = { "trim_whitespace" },
				},
				format_on_save = {
					timeout_ms = 500,
					lsp_fallback = true,
				},
			})
		end,
	},
}
