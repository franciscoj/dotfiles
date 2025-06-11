local lspconfig = require("lspconfig")
local Config = require("franciscoj.lsp.config")

local cfg = Config:new({
	cmd = { "OmniSharp" },
})

lspconfig.omnisharp.setup(cfg:to_lspconfig())
