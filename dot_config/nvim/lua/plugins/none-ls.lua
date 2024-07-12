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
		local features = require("franciscoj.lsp.features")
		local null_ls = require("null-ls")

		if features.lua then
			null_ls.register(null_ls.builtins.diagnostics.selene)
		end

		local actions = null_ls.builtins.code_actions
		local diagnostics = null_ls.builtins.diagnostics
		local Config = require("franciscoj.lsp.config")
		local formatting = null_ls.builtins.formatting
		local mason = require("franciscoj.mason")

		-- These will be automatically installed through mason
		local ensure = {}

		if features.typescript then
			table.insert(ensure, { name = "prettier" })
		end

		if features.lua then
			table.insert(ensure, { name = "stylua" })
			table.insert(ensure, { name = "selene" })
		end

		if features.go then
			table.insert(ensure, { name = "goimports", version = "latest" })
			table.insert(ensure, { name = "golangci-lint", version = "v1.53.3" })
		end

		mason.ensure_tools(ensure)

		local sources = {
			actions.gitsigns,
		}

		if features.typescript then
			table.insert(sources, formatting.prettier)
		end

		if features.lua then
			table.insert(sources, formatting.stylua)
			table.insert(sources, diagnostics.luacheck)
		end

		if features.go then
			table.insert(sources, actions.gomodifytags)
			table.insert(sources, actions.impl)
			table.insert(sources, formatting.goimports)
			table.insert(sources, diagnostics.golangci_lint)
		end

		if features.rust then
			table.insert(sources, formatting.rustfmt)
		end

		if features.rubocop then
			table.insert(sources, diagnostics.rubocop.with({ timeout = 5000, prefer_local = "bin" }))
			table.insert(sources, formatting.rubocop.with({ timeout = 5000, prefer_local = "bin" }))
		end

		local cfg = Config:new({ sources = sources })
		null_ls.setup(cfg:to_lspconfig())
	end,
}
