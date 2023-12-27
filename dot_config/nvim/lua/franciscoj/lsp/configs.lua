require("franciscoj.lsp.configs.gopls")
require("franciscoj.lsp.configs.lua_ls")
require("franciscoj.lsp.configs.rust_analyzer")
require("franciscoj.lsp.configs.sorbet")
require("franciscoj.lsp.configs.tsserver")
require("franciscoj.lsp.configs.yamlls")

local Config = require("franciscoj.lsp.config")
local lspconfig = require("lspconfig")
local features = require("franciscoj.lsp.features")

-- This is a default config that is safe to use for all LSPs without any specific configuration
local cfg = Config:new({})

if features.elixir then
	lspconfig.elixirls.setup(cfg:to_lspconfig())
end

if features.ruby then
	lspconfig.ruby_ls.setup(cfg:to_lspconfig())
end

if features.typescript then
	lspconfig.tailwindcss.setup(cfg:to_lspconfig())
end


lspconfig.marksman.setup(cfg:to_lspconfig())
