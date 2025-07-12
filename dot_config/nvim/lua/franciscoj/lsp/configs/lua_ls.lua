local lazydev = require("lazydev")
lazydev.setup()

vim.lsp.config("lua_ls", {
	root_dir = function(bufnr, on_dir) on_dir(lazydev.find_workspace(bufnr)) end,
	settings = {
		Lua = {
			diagnostics = {
				globals = { "Snacks" },
			},
		},
	},
})
vim.lsp.enable("lua_ls")
