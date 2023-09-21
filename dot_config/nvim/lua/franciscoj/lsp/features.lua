-- Here I do some feature detection that I use in other places to decide
-- whether I enable or not some parts of the LSPs.
--
-- For example, if goimports is available I prefer it to the default gopls
-- formatting. However goimports works through null-ls while gopls works
-- through the regular lspconfig configuration.
return {
	-- Ruby
	rubocop = vim.fn.executable("bin/rubocop") == 1,
	sorbet = vim.fn.executable("bin/srb") == 1,
}
