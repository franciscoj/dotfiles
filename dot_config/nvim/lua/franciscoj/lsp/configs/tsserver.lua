local lspconfig = require("lspconfig")
local cfg = require("franciscoj.lsp.cfg")
local features = require("franciscoj.lsp.features")
local config = cfg.defaults()

local function organize_imports()
  local params = {
    command = "_typescript.organizeImports",
    arguments = { vim.api.nvim_buf_get_name(0) },
    title = ""
  }
  vim.lsp.buf.execute_command(params)
end

config.on_attach = function(client, bufnr)
  -- disable  formatting for tsserver so that prettier handles it through
  -- null-ls
  client.resolved_capabilities.document_formatting = false
  client.resolved_capabilities.document_range_formatting = false

  cfg.on_attach(client, bufnr)
end

config.commands = {
  OrganizeImports = {
    organize_imports,
    description = "Organize Imports"
  }
}

lspconfig.tsserver.setup(config)
