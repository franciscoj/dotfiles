local config = require("franciscoj.lsp.cfg").defaults()
local features = require("franciscoj.lsp.features")

return function()
	-- Disable publishing LSP's diagnostics to use the ones from luacheck
	-- instead
	if features.luacheck then
		config.handlers["textDocument/publishDiagnostics"] = function() end
	end

	if vim.env.DOTFILES then
		config.settings = {
			Lua = {
				diagnostics = {
					globals = { "vim", "hs" },
				},
			},
		}

		return require("lua-dev").setup({
			lspconfig = config,
		})
	else
		return config
	end
end
