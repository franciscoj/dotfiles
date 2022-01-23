local null_ls = require("null-ls")
local features = require("franciscoj.lsp.features")
local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics

-- No sources by default, if feature detection for any of the linters I'm
-- interested in  works, then those are enabled.
local sources = {}

if features.golangci_lint then
	table.insert(sources, diagnostics.golangci_lint)
end

if features.goimports then
	table.insert(sources, formatting.goimports)
end

if features.rubocop then
	table.insert(sources, formatting.rubocop.with({ command = "bin/rubocop" }))
	table.insert(sources, diagnostics.rubocop.with({ command = "bin/rubocop" }))
end

-- These is only relevant when editing DOTFILES
if vim.env.DOTFILES then
	if features.luacheck then
		table.insert(sources, diagnostics.luacheck)
	end

	if features.stylua then
		table.insert(sources, formatting.stylua)
	end
end

if #sources ~= 0 then
	null_ls.setup({
		debug = false,
		sources = sources,
		on_attach = function(client)
			if client.resolved_capabilities.document_formatting then
				vim.cmd([[
          augroup LspFormatting
            autocmd! * <buffer>
            autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()
          augroup END
        ]])
			end
		end,
	})
end
