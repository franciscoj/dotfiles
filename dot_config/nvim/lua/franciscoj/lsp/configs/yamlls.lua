vim.lsp.config("yamlls", {
	settings = {
		yaml = {
			schemas = {
				["https://www.schemastore.org/github-workflow.json"] = "/.github/workflows/*",
				["https://raw.githubusercontent.com/compose-spec/compose-spec/master/schema/compose-spec.json"] = "docker-compose*.yml",
			},
		},
	},
})

vim.lsp.enable("yamlls")
