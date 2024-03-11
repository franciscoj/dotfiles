return {
	{
		"neovim/nvim-lspconfig",
		ft = {
			"elixir",
			"go",
			"javascript",
			"json",
			"lua",
			"markdown",
			"ruby",
			"rust",
			"typescript",
			"yaml",
		},
		dependencies = {
			"folke/neoconf.nvim",
			"folke/neodev.nvim",
			"folke/trouble.nvim",
			"williamboman/mason.nvim",
		},
		lazy = true,
		config = function()
			require("neoconf").setup({})
			require("franciscoj.lsp.configs")
		end,
	},
	{
		"folke/trouble.nvim",
		lazy = true,
		config = function()
			require("trouble").setup({})
		end,
	},
	{
		"williamboman/mason.nvim",
		lazy = true,
		dependencies = { "williamboman/mason-lspconfig.nvim" },
		config = function()
			local features = require("franciscoj.lsp.features")
			require("mason").setup({
				ui = { border = "rounded" },
			})

			local ensure = { "yamlls", "marksman" }

			if features.ruby then
				table.insert(ensure, "ruby_ls")
			end

			if features.elixir then
				table.insert(ensure, "elixirls")
			end

			if features.go then
				table.insert(ensure, "gopls")
			end

			if features.typescript then
				table.insert(ensure, "eslint_lsp")
				table.insert(ensure, "tsserver")
			end

			if features.tailwind then
				table.insert(ensure, "tailwindcss")
			end

			if features.rust then
				table.insert(ensure, "rust_analyzer")
			end

			require("mason-lspconfig").setup({ ensure_installed = ensure })
		end,
	},
}
