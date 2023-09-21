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
			require("mason").setup({
				ui = { border = "rounded" },
			})

			require("mason-lspconfig").setup({
				ensure_installed = {
					"elixirls",
					"gopls",
					"lua_ls",
					"marksman",
					"ruby-lsp",
					"tailwindcss",
					"tsserver",
					"yamlls",
				},
			})
		end,
	},
}
