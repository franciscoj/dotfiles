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
	codespaces = os.getenv("CODESPACES"),
	elixir = detect("mix.exs"),
	go = detect("go.mod"),
	lua = detect(".luacheckrc"),
	rust = detect("Cargo.toml"),
	-- Phoenix apps usually keep the JS stack inside the assets folder
	typescript = detect("package.json") or detect("assets/package.json"),
	tailwind = detect("tailwind.config.js"),
	ansible = detect("playbook.yml"),

	-- Ruby
	ruby_ls = vim.fn.executable("ruby-lsp") == 1,
	rubocop = vim.fn.executable("bin/rubocop") == 1,
	ruby = detect("Gemfile"),
	sorbet = vim.fn.executable("bin/srb") == 1,
}
