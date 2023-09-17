return {
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			"SmiteshP/nvim-navic",
			"folke/neodev.nvim",
			"folke/trouble.nvim",
			"williamboman/mason.nvim",
		},
		config = function()
			require("nvim-navic").setup({
				highlight = true,
			})
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
