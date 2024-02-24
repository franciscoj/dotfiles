return {
	"nvimtools/none-ls.nvim",
	lazy = true,
	ft = {
		"go",
		"javascript",
		"json",
		"lua",
		"ruby",
		"rust",
		"typescript",
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

		local ensure = {}

		if features.typescript then
			table.insert(ensure, { name = "prettier" })
		end

		if features.lua then
			table.insert(ensure, { name = "stylua" })
			table.insert(ensure, { name = "luacheck" })
		end

		if features.go then
			table.insert(ensure, { name = "goimports", version = "latest" })
			table.insert(ensure, { name = "golangci-lint", version = "v1.53.3" })
		end

		mason.ensure_tools(ensure)

		local sources = {
			actions.gitsigns,
			formatting.trim_newlines,
			formatting.trim_whitespace,
		}

		if features.typescript then
			table.insert(features, diagnostics.eslint)
			table.insert(features, formatting.prettier)
		end

		if features.lua then
			table.insert(features, formatting.stylua)
			table.insert(features, diagnostics.luacheck)
		end

		if features.go then
			table.insert(features, actions.gomodifytags)
			table.insert(features, actions.impl)
			table.insert(features, formatting.goimports)
			table.insert(features, diagnostics.golangci_lint)
		end

		if features.rust then
			table.insert(features, formatting.rustfmt)
		end

		if features.rubocop then
			table.insert(features, diagnostics.rubocop.with({ timeout = 5000 }))
			table.insert(features, formatting.rubocop.with({ timeout = 5000 }))
		end

		local cfg = Config:new({ sources = sources })
		null_ls.setup(cfg:to_lspconfig())
	end,
}
