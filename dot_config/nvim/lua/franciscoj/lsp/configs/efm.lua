local efmls = require("efmls-configs")
local Config = require("franciscoj.lsp.config")
local features = require("franciscoj.lsp.features")
local mason = require("franciscoj.mason")

mason.ensure_tools({
	{ name = "efm" },
	{ name = "goimports", version = "latest" },
	{ name = "golangci-lint", version = "v1.53.3" },
	{ name = "luacheck" },
	{ name = "rustfmt" },
	{ name = "rustywind" },
	{ name = "stylua" },
})

local golangci_lint = ("%s run --color never --out-format tab ${INPUT}"):format(mason.get_path("golangci_lint"))

local configs = {
	javascript = {
		formatter = require("efmls-configs.formatters.prettier"),
	},
	lua = {
		linter = require("efmls-configs.linters.luacheck"),
		formatter = require("efmls-configs.formatters.stylua"),
	},
	go = {
		linter = {
			prefix = "golangci-lint",
			lintCommand = golangci_lint,
			lintStdin = false,
			lintFormats = { "%.%#:%l:%c %m" },
			rootMarkers = {},
		},
		formatter = require("efmls-configs.formatters.goimports"),
	},
	rust = {
		formatter = require("efmls-configs.formatters.rustfmt"),
	},
}

if features.rubocop then
	table.insert(configs, {
		ruby = {
			linter = require("efmls-configs.linters.rubocop"),
		},
	})
end

local cfg = Config:new({
	init_options = { documentFormatting = true },
	on_attach = function(client)
		if client.server_capabilities.documentFormattingProvider then
			local id = vim.api.nvim_create_augroup("lsp_formatting", { clear = false })
			vim.api.nvim_clear_autocmds({ buffer = 0, group = id })
			vim.api.nvim_create_autocmd("BufWritePre", {
				buffer = 0,
				group = id,
				callback = function()
					vim.lsp.buf.format({ sync = true })
				end,
			})
		end
	end,
})
efmls.init(cfg:to_lspconfig())
efmls.setup(configs)
