local features = require("franciscoj.lsp.features")
local lspconfig = require("lspconfig")
local Config = require("franciscoj.lsp.config")

if not features.go then
	return
end

local cfg = Config:new({
	on_attach = function(client, _bufnr)
		-- disable  formatting for gopls so that goimports handles it through
		-- null-ls
		client.server_capabilities.documentFormattingProvider = false
		client.server_capabilities.documentRangeFormattingProvider = false
	end,
})

lspconfig.gopls.setup(cfg:to_lspconfig())
