local features = require("franciscoj.lsp.features")

-- I don't want sorbet to be automatically setup. Only if the project  is using
-- it and has it as binstub.
if not features.sorbet then
	return
end

vim.lsp.config("sorber", {
	cmd = { "bin/srb", "tc", "--lsp" },
})
vim.lsp.enable("sorbet")
