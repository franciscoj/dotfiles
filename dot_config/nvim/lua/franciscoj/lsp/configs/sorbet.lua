local features = require("franciscoj.lsp.features")

vim.lsp.config("sorber", {
	cmd = { "bin/srb", "tc", "--lsp" },
})
vim.lsp.enable("sorbet", features.sorbet)
