require("franciscoj.lsp.configs.efm")
require("franciscoj.lsp.configs.gopls")
require("franciscoj.lsp.configs.lua_ls")
require("franciscoj.lsp.configs.solargraph")
require("franciscoj.lsp.configs.sorbet")
require("franciscoj.lsp.configs.tsserver")
require("franciscoj.lsp.configs.yamlls")

local Config = require("franciscoj.lsp.config")
local lspconfig = require("lspconfig")

-- This is a default config that is safe to use for all LSPs without any specific configuration
local cfg = Config:new({})

lspconfig.elixirls.setup(cfg:to_lspconfig())
lspconfig.marksman.setup(cfg:to_lspconfig())
lspconfig.rust_analyzer.setup(cfg:to_lspconfig())
lspconfig.tailwindcss.setup(cfg:to_lspconfig())
