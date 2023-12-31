local lspconfig = require("lspconfig")
local Config = require("franciscoj.lsp.config")
local features = require("franciscoj.lsp.features")

if features.rust ~= true then
	return
end

local cfg = Config:new({
	settings = {
		-- to enable rust-analyzer settings visit:
		-- https://github.com/rust-analyzer/rust-analyzer/blob/master/docs/user/generated_config.adoc
		["rust-analyzer"] = {
			checkOnSave = {
				command = "clippy",
			},
		},
	},
	init_options = {
		userLanguages = {
			rust = "html",
		},
	},
})

lspconfig.rust_analyzer.setup(cfg:to_lspconfig())
