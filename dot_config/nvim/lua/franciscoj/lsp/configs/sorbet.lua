local features = require("franciscoj.lsp.features")

-- I don't want sorbet to be automatically setup. Only if the project  is using
-- it and has it as binstub.
if not features.sorbet then
	return
end

local lspconfig = require("lspconfig")
local Config = require("franciscoj.lsp.config")

local cfg = Config:new({
	cmd = { "bin/srb", "tc", "--lsp" },
})

lspconfig.sorbet.setup(cfg:to_lspconfig())
