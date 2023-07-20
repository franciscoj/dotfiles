local features = require("franciscoj.lsp.features")

-- I don't want solargraph or rubocop to be automatically setup. Only if the
-- project  is using them and has them as binstubs.
if not features.solargraph then
	return
end

local lspconfig = require("lspconfig")
local Config = require("franciscoj.lsp.config")

local cfg = Config:new({
	settings = { solargraph = { diagnostics = not features.rubocop } },
	cmd = { "bin/solargraph", "stdio" },
	on_attach = function(client, _bufnr)
		-- disable  formatting for solargraph so that rubocop handles it through
		-- null-ls
		client.server_capabilities.documentFormattingProvider = features.rubucop
		client.server_capabilities.documentRangeFormattingProvider = features.rubocop
	end,
})

lspconfig.solargraph.setup(cfg:to_lspconfig())
