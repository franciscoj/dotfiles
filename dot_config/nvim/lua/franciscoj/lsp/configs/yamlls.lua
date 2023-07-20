local lspconfig = require("lspconfig")
local Config = require("franciscoj.lsp.config")

local cfg = Config:new({
	settings = {
		yaml = {
			schemas = {
				["https://json.schemastore.org/github-workflow.json"] = "/.github/workflows/*",
				["https://raw.githubusercontent.com/compose-spec/compose-spec/master/schema/compose-spec.json"] = "docker-compose*.yml",
			},
		},
	},
})

lspconfig.yamlls.setup(cfg:to_lspconfig())
