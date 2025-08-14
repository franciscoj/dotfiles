-- Here I do some feature detection that I use in other places to decide
-- whether I enable or not some parts of the LSPs.
--
-- For example, if goimports is available I prefer it to the default gopls
-- formatting. However goimports works through null-ls while gopls works
-- through the regular lspconfig configuration.

local detect_file = function(file)
	return vim.fn.getftype(file) ~= ""
end

local can_run = function(file)
	return vim.fn.executable(file) == 1
end

local is_forced = function(name)
	local forced = os.getenv("FRANCISCOJ_LSP_FORCED")
	return forced and forced:find(name) ~= nil or false
end

return {
	codespaces = os.getenv("CODESPACES"),
	elixir = is_forced("elixir") or detect_file("mix.exs"),
	go = is_forced("go") or detect_file("go.mod"),
	lua = is_forced("lua") or detect_file("selene.toml"),
	rust = is_forced("rust") or detect_file("Cargo.toml"),
	-- Phoenix apps usually keep the JS stack inside the assets folder
	typescript = is_forced("typescript") or detect_file("package.json") or detect_file("assets/package.json"),
	tailwind = is_forced("tailwind") or detect_file("tailwind.config.js"),
	ansible = is_forced("ansible") or detect_file("playbook.yml"),

	-- Ruby
	ruby_ls = is_forced("ruby_ls") or can_run("ruby-lsp"),
	rubocop = is_forced("rubocop") or can_run("bin/rubocop"),
	ruby = is_forced("ruby") or detect_file("Gemfile"),
	sorbet = is_forced("sorbet") or can_run("bin/srb"),
	roslyn = is_forced("roslyn") or vim.fs.root(0, function(fname, _)
		return fname:match("%.sln$") ~= nil or fname:match("%.csproj$") ~= nil
	end) ~= nil,
}
