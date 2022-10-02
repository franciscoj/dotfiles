local lspconfig = require("lspconfig")
local cfg = require("franciscoj.lsp.cfg")
local config = cfg.defaults()

config.on_attach = function(client, bufnr)
	-- disable  formatting for gopls so that goimports handles it through
	-- null-ls
	client.server_capabilities.documentFormattingProvider = false
	client.server_capabilities.documentRangeFormattingProvider = false

	cfg.on_attach(client, bufnr)
end

lspconfig.gopls.setup(config)
