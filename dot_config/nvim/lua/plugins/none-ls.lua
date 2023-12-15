return {
	"nvimtools/none-ls.nvim",
	config = function()
		local null_ls = require("null-ls")
			local actions = null_ls.builtins.code_actions
		-- local diagnostics = null_ls.builtins.diagnostics
		local Config = require("franciscoj.lsp.config")
		local formatting = null_ls.builtins.formatting
		local features = require("franciscoj.lsp.features")
		local mason = require("franciscoj.mason")

		local ensure = {
			{ name = "stylua" },
			{ name = "prettier" },
		}
		if features.go then
			table.insert(ensure, { name = "goimports", version = "latest" })
		end
		mason.ensure_tools(ensure)

		local cfg = Config:new({
			sources = {
				actions.gomodifytags,
				actions.impl,
				actions.gitsigns,
				formatting.goimports,
				formatting.prettier,
				formatting.stylua,
				formatting.rubocop,
				formatting.trim_newlines,
				formatting.trim_whitespace,
			},
		})
		null_ls.setup(cfg:to_lspconfig())
	end,
}
