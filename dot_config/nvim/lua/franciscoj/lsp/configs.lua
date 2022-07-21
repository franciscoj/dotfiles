require("franciscoj.lsp.configs.solargraph")
require("franciscoj.lsp.configs.gopls")
require("franciscoj.lsp.configs.sumneko_lua")
require("franciscoj.lsp.configs.yamlls")

local lspconfig = require("lspconfig")
local cfg = require("franciscoj.lsp.cfg")
local features = require("franciscoj.lsp.features")
local config = cfg.defaults()

lspconfig.tsserver.setup(config)
