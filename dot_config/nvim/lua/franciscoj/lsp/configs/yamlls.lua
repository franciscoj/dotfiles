local lspconfig = require("lspconfig")
local config = require("franciscoj.lsp.cfg").defaults()

config.settings = {
	yaml = {
		schemas = {
			["https://json.schemastore.org/github-workflow.json"] = "/.github/workflows/*",
			["https://raw.githubusercontent.com/compose-spec/compose-spec/master/schema/compose-spec.json"] = "docker-compose*.yml",
		},
	},
}

lspconfig.yamlls.setup(config)
