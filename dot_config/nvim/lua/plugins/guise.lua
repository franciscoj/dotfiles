local features = require("franciscoj.lsp.features")

return {
	"lambdalisue/guise.vim",
	enabled = not features.codespaces,
	dependencies = {
		"vim-denops/denops.vim",
	},
}
