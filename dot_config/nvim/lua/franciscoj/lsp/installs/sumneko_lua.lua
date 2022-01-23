local config = require("franciscoj.lsp.cfg").defaults()

return function()
	config.settings = {
		Lua = {
			diagnostics = {
				globals = { "vim", "hs" },
			},
			workspace = {
				-- Make the server aware of Neovim runtime files
				library = vim.api.nvim_get_runtime_file("", true),
			},
		},
	}

	-- Disable publishing LSP's diagnostics to use the ones from luacheck
	-- instead
	config.handlers["textDocument/publishDiagnostics"] = function() end

	return config
end
