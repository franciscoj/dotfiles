local lspconfig = require("lspconfig")
local cfg = require("franciscoj.lsp.cfg")
local features = require("franciscoj.lsp.features")
local config = cfg.defaults()

config.on_attach = function(client, bufnr)
  -- disable  formatting for tsserver so that prettier handles it through
  -- null-ls
  client.resolved_capabilities.document_formatting = false
  client.resolved_capabilities.document_range_formatting = false

  cfg.on_attach(client, bufnr)
end

lspconfig.tsserver.setup(config)
