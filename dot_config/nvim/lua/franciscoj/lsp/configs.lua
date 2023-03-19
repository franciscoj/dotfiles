require("franciscoj.lsp.configs.gopls")
require("franciscoj.lsp.configs.lua_ls")
require("franciscoj.lsp.configs.solargraph")
require("franciscoj.lsp.configs.sorbet")
require("franciscoj.lsp.configs.tsserver")
require("franciscoj.lsp.configs.yamlls")

local lspconfig = require("lspconfig")
local cfg = require("franciscoj.lsp.cfg")
local config = cfg.defaults()

lspconfig.elixirls.setup(config)
lspconfig.marksman.setup(config)
lspconfig.rust_analyzer.setup(config)
