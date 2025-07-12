local features = require("franciscoj.lsp.features")

vim.lsp.config("gopls", {
	on_attach = function(client, _bufnr)
		-- disable  formatting for gopls so that goimports handles it through
		-- null-ls
		client.server_capabilities.documentFormattingProvider = false
		client.server_capabilities.documentRangeFormattingProvider = false
	end,
})
vim.lsp.enable("gopls", features.go)
