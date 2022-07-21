-- Make sure this is the very first so that it registers the installation
-- hooks.
require("nvim-lsp-installer").setup({
	ensure_installed = { "sumneko_lua", "gopls", "yamlls", "tsserver" },
})

require("franciscoj.lsp.null-ls")
require("franciscoj.lsp.configs")
require("trouble").setup({})
