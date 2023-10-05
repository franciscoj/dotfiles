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
			require("franciscoj.lsp.configs")
		end,
	},
	{
		"SmiteshP/nvim-navic",
		config = function()
			require("nvim-navic").setup({
				highlight = true,
				icons = {
					File = " ",
					Module = " ",
					Namespace = " ",
					Package = " ",
					Class = " ",
					Method = " ",
					Property = " ",
					Field = " ",
					Constructor = " ",
					Enum = " ",
					Interface = " ",
					Function = " ",
					Variable = " ",
					Constant = " ",
					String = " ",
					Number = " ",
					Boolean = " ",
					Array = " ",
					Object = " ",
					Key = " ",
					Null = " ",
					EnumMember = " ",
					Struct = " ",
					Event = " ",
					Operator = " ",
					TypeParameter = " ",
				},
			})
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
				table.insert(ensure, "tsserver")
				table.insert(ensure, "tailwindcss")
			end

			require("mason-lspconfig").setup({ ensure_installed = ensure })
		end,
	},
}
