return {
	{
		"stevearc/conform.nvim",
		config = function()
			local features = require("franciscoj.lsp.features")
			local mason = require("franciscoj.mason")
			local ensure = {
				{ name = "stylua" },
				{ name = "prettier" },
			}
			if features.go then
				ensure.insert({ name = "goimports", version = "latest" })
			end
			mason.ensure_tools(ensure)

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
					timeout_ms = 3000,
					lsp_fallback = true,
				},
			})
		end,
	},
}
