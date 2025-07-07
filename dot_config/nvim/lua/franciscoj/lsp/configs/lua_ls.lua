local lazydev = require("lazydev")
lazydev.setup()

vim.lsp.config("lua_ls", {
	root_dir = function(bufnr, on_dir) on_dir(lazydev.find_workspace(bufnr)) end,
	handlers = {
		["textDocument/publishDiagnostics"] = function() end,
	},
	on_attach = function(client)
		-- Disable the default formatting capabilities of the lua LSP
		client.server_capabilities.documentFormattingProvider = false
		client.server_capabilities.documentRangeFormattingProvider = false
	end,
})
vim.lsp.enable("lua_ls")
