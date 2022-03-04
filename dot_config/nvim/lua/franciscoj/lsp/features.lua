-- Here I do some feature detection that I use in other places to decide
-- whether I enable or not some parts of the LSPs.
--
-- For example, if goimports is available I prefer it to the default gopls
-- formatting. However goimports works through null-ls while gopls works
-- through the regular lspconfig configuration.
return {
	-- Go
	goimports = vim.fn.executable("goimports") == 1,
	golangci_lint = vim.fn.executable("golangci-lint") == 1,

	-- Lua
	luacheck = vim.fn.executable("luacheck") == 1,
	stylua = vim.fn.executable("stylua") == 1,

	-- Ruby
	rubocop = vim.fn.executable("bin/rubocop") == 1,
	solargraph = vim.fn.executable("bin/solargraph") == 1,
}