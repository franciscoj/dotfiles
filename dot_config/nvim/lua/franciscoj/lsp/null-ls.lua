local null_ls = require("null-ls")
local features = require("franciscoj.lsp.features")
local mason = require("franciscoj.mason")
local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics
local code_actions = null_ls.builtins.code_actions

mason.ensure_tools({
	{ name = "golangci-lint", version = "v1.49.0" },
	{ name = "goimports", version = "latest" },
	{ name = "luacheck" },
	{ name = "stylua" },
})

local sources = {
	code_actions.gitsigns,
	diagnostics.golangci_lint.with({ command = mason.get_path("golangci-lint") }),
	diagnostics.luacheck.with({ command = mason.get_path("luacheck") }),
	diagnostics.tsc,
	formatting.goimports.with({ command = mason.get_path("goimports") }),
	formatting.prettier,
	formatting.stylua.with({ command = mason.get_path("stylua") }),
}

if features.rubocop then
	table.insert(sources, formatting.rubocop.with({ command = "bin/rubocop" }))
	table.insert(sources, diagnostics.rubocop.with({ command = "bin/rubocop" }))
end

null_ls.setup({
	debug = false,
	sources = sources,
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
