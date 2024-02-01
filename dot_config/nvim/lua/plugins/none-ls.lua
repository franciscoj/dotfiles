return {
	"nvimtools/none-ls.nvim",
	lazy = true,
	ft = {
		"go",
		"json",
		"lua",
		"ruby",
		"rust",
		"yaml",
	},
	config = function()
		local null_ls = require("null-ls")
		local actions = null_ls.builtins.code_actions
		local diagnostics = null_ls.builtins.diagnostics
		local Config = require("franciscoj.lsp.config")
		local formatting = null_ls.builtins.formatting
		local features = require("franciscoj.lsp.features")
		local mason = require("franciscoj.mason")

		local ensure = {
			{ name = "stylua" },
			{ name = "prettier" },
			{ name = "luacheck" },
		}

		if features.go then
			table.insert(ensure, { name = "goimports", version = "latest" })
			table.insert(ensure, { name = "golangci-lint", version = "v1.53.3" })
		end

		mason.ensure_tools(ensure)

		local cfg = Config:new({
			sources = {
				actions.gitsigns,
				actions.gomodifytags,
				actions.impl,
				diagnostics.eslint,
				diagnostics.golangci_lint,
				diagnostics.luacheck,
				diagnostics.rubocop.with({ timeout = 5000 }),
				formatting.goimports,
				formatting.prettier,
				formatting.rubocop.with({ timeout = 5000 }),
				formatting.rustfmt,
				formatting.stylua,
				formatting.trim_newlines,
				formatting.trim_whitespace,
			},
		})
		null_ls.setup(cfg:to_lspconfig())
	end,
}
