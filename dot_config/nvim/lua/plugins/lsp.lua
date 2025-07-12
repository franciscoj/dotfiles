--# selene: allow(mixed_table)
return {
	{
		"folke/lazydev.nvim",
		cmd = { "LazyDev" },
		ft = "lua",
	},
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			"folke/neoconf.nvim",
			"folke/trouble.nvim",
			"williamboman/mason.nvim",
			"ibhagwan/fzf-lua",
		},
		config = function()
			require("neoconf").setup({})
			require("franciscoj.lsp.configs")
		end,
	},
	{
		"folke/trouble.nvim",
		opts = {},
		cmd = "Trouble",
		keys = {
			{
				"<localleader>D",
				"<cmd>Trouble diagnostics toggle<cr>",
				desc = "Trouble Diagnostics",
			},
			{
				"<localleader>d",
				"<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
				desc = "Trouble Diagnostics (current buffer)",
			},
		},
	},
	{
		"williamboman/mason.nvim",
		lazy = true,
		dependencies = { "williamboman/mason-lspconfig.nvim" },
		config = function()
			local features = require("franciscoj.lsp.features")
			require("mason").setup({
				ui = { border = "rounded" },
				registries = {
					"github:mason-org/mason-registry",
					"github:Crashdummyy/mason-registry",
				},
			})

			local ensure = { "yamlls", "marksman", "jsonls" }

			if features.ruby_ls then
				table.insert(ensure, "ruby_lsp")
			end

			if features.elixir then
				table.insert(ensure, "elixirls")
			end

			if features.go then
				table.insert(ensure, "gopls")
			end

			if features.typescript then
				table.insert(ensure, "eslint")
				table.insert(ensure, "ts_ls")
			end

			if features.tailwind then
				table.insert(ensure, "tailwindcss")
			end

			if features.rust then
				table.insert(ensure, "rust_analyzer")
			end

			if features.ansible then
				table.insert(ensure, "ansiblels")
			end

			require("mason-lspconfig").setup({ ensure_installed = ensure })
		end,
	},
	{
		"seblyng/roslyn.nvim",
		ft = "cs",
		---@module 'roslyn.config'
		---@type RoslynNvimConfig
		opts = {
			-- your configuration comes here; leave empty for default settings
		},
	},
}
