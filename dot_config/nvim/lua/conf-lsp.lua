return function()
	-- Make sure this is the very first so that it registers the installation
	-- hooks.
	require("mason").setup({
		ui = { border = "rounded" },
	})

	require("mason-lspconfig").setup({
		ensure_installed = {
			"gopls",
			"marksman",
			"sumneko_lua",
			"tsserver",
			"yamlls",
		},
	})

	require("franciscoj.lsp.null-ls")
	require("franciscoj.lsp.configs")
	require("trouble").setup({})
end
