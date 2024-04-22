local features = require("franciscoj.lsp.features")

return {
	{
		"iamcco/markdown-preview.nvim",
		enabled = not vim.g.started_by_firenvim and not features.codespaces,
		ft = { "markdown" },
		build = "cd app && yarn install",
	},
}
