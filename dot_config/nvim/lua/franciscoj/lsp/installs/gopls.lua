local cfg = require("franciscoj.lsp.cfg")
local features = require("franciscoj.lsp.features")
local config = cfg.defaults()

return function()
	config.on_attach = function(client, bufnr)
		-- disable  formatting for gopls so that goimports handles it through
		-- null-ls
		client.resolved_capabilities.document_formatting = not features.goimports
		client.resolved_capabilities.document_range_formatting = not features.goimports

		cfg.on_attach(client, bufnr)
	end

	return config
end
