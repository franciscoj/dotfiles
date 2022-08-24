local features = require("franciscoj.lsp.features")

-- I don't want solargraph or rubocop to be automatically setup. Only if the
-- project  is using them and has them as binstubs.
if not features.solargraph then
  return
end

local lspconfig = require("lspconfig")
local cfg = require("franciscoj.lsp.cfg")
local config = cfg.defaults()

config.settings = { solargraph = { diagnostics = not features.rubocop } }
config.cmd = { "bin/solargraph", "stdio" }
config.on_attach = function(client, bufnr)
  -- disable  formatting for solargraph so that rubocop handles it through
  -- null-ls
  client.resolved_capabilities.document_formatting = not features.rubocop
  client.resolved_capabilities.document_range_formatting = not features.rubocop

  cfg.on_attach(client, bufnr)
end

lspconfig.solargraph.setup(config)
