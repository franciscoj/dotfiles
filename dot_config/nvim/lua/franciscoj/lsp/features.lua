-- Here I do some feature detection that I use in other places to decide
-- whether I enable or not some parts of the LSPs.
--
-- For example, if goimports is available I prefer it to the default gopls
-- formatting. However goimports works through null-ls while gopls works
-- through the regular lspconfig configuration.

local detect = function(file)
	return vim.fn.getftype(file) ~= ""
end

return {
	-- Elixir
	elixir = detect("mix.exs"),
	-- Go
	go = detect("go.mod"),
	-- JS/TS
	typescript = detect("package.json"),
	-- Ruby
	ruby = detect("Gemfile"),
	rubocop = vim.fn.executable("bin/rubocop") == 1,
	rust = detect("Cargo.toml"),
	sorbet = vim.fn.executable("bin/srb") == 1,
}
