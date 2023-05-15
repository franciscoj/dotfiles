return {
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			"folke/neodev.nvim",
			"folke/trouble.nvim",
			"jose-elias-alvarez/null-ls.nvim",
			"williamboman/mason.nvim",
		},
		config = function()
			require("franciscoj.lsp.null-ls")
			require("franciscoj.lsp.configs")
		end,
	},
	{
		"folke/trouble.nvim",
		config = function()
			require("trouble").setup({})
		end,
	},
	{
		"williamboman/mason.nvim",
		dependencies = { "williamboman/mason-lspconfig.nvim" },
		config = function()
			require("mason").setup({
				ui = { border = "rounded" },
			})

			require("mason-lspconfig").setup({
				ensure_installed = {
					"elixirls",
					"gopls",
					"lua_ls",
					"marksman",
					"tailwindcss",
					"tsserver",
					"yamlls",
				},
			})
		end,
	},
}
