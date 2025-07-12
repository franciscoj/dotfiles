local features = require("franciscoj.lsp.features")

vim.lsp.config("rust_analyzer", {
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
vim.lsp.enable("rust_analyzer", features.rust)
