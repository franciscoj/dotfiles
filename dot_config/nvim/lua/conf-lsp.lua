local capabilities = require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol.make_client_capabilities())
local h = require("h")
local installer = require("nvim-lsp-installer")
local lsp = require("lspconfig")
local null_ls = require("null-ls")
local trouble = require("trouble")

local function on_attach(client, _bufnr)
	-- Using LSP defaults
	h.nnoremap("gD", "<cmd>lua vim.lsp.buf.declaration()<CR>")
	h.nnoremap("gd", "<cmd>lua vim.lsp.buf.definition()<CR>")
	h.nnoremap("<LocalLeader>t", "<cmd>lua vim.lsp.buf.type_definition()<CR>")
	h.nnoremap("<LocalLeader>f", "<cmd>lua vim.lsp.buf.formatting()<CR>")
	h.nnoremap("K", "<cmd>lua vim.lsp.buf.hover()<CR>")
	h.nnoremap("<LocalLeader>k", "<cmd>lua vim.lsp.buf.signature_help()<CR>")
	h.nnoremap("<LocalLeader>r", "<cmd>lua vim.lsp.buf.rename()<CR>")
	h.nnoremap("<LocalLeader>a", "<cmd>lua vim.lsp.buf.code_action()<CR>")
	h.nnoremap("<LocalLeader>l", [[<cmd>lua vim.diagnostic.open_float(nil, {focus=false, border="rounded"})<CR>]])

	-- I'm not sure why these are for
	-- h.nnoremap("<LocalLeader>wa", "<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>")
	-- h.nnoremap("<LocalLeader>wr", "<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>")
	-- h.nnoremap("<LocalLeader>wl", "<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>")

	-- Using Telescope
	h.nnoremap("<LocalLeader>o", "<cmd>Telescope lsp_dynamic_workspace_symbols<CR>")
	h.nnoremap("gr", ":Telescope lsp_references<CR>")
	h.nnoremap("gi", ":Telescope lsp_implementations<CR>")

	-- Using trouble.nvim
	h.nnoremap("<LocalLeader>d", "<cmd>Trouble document_diagnostics<CR>")
	h.nnoremap("<LocalLeader>D", "<cmd>Trouble workspace_diagnostics<CR>")

	-- Disable global diagnostics because they are mostly annoying
	vim.diagnostic.config({ virtual_text = false })

	if client.resolved_capabilities.code_lens then
		vim.api.nvim_exec(
			[[
        augroup lsp_code_lens_refresh
          autocmd! * <buffer>

          autocmd BufEnter,InsertLeave,CursorHold <buffer> lua vim.lsp.codelens.refresh()
          autocmd BufEnter <buffer> lua vim.lsp.codelens.display()
        augroup END
      ]],
			false
		)

		h.nnoremap("<LocalLeader>A", "<cmd>lua vim.lsp.codelens.run()<cr>")
	end
end

-- Initialize null-ls linters and formatters
local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics
local has_stylua = vim.fn.executable("stylua") == 1
local has_luacheck = vim.fn.executable("luacheck") == 1
local has_goimports = vim.fn.executable("goimports") == 1
local has_golangci_lint = vim.fn.executable("golangci-lint") == 1
local has_rubocop = vim.fn.executable("bin/rubocop") == 1
local null_ls_sources = {}
local handlers = {
	["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "rounded" }),
	["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = "rounded" }),
}

if has_golangci_lint then
	table.insert(null_ls_sources, diagnostics.golangci_lint)
end

if has_goimports then
	table.insert(null_ls_sources, formatting.goimports)
end

if has_rubocop then
	table.insert(null_ls_sources, formatting.rubocop.with({ command = "bin/rubocop" }))
	table.insert(null_ls_sources, diagnostics.rubocop.with({ command = "bin/rubocop" }))
end

-- These is only relevant when editing dotfiles
if vim.env.DOTFILES and has_luacheck then
	table.insert(null_ls_sources, diagnostics.luacheck)
end

if vim.env.DOTFILES and has_stylua then
	table.insert(null_ls_sources, formatting.stylua)
end

if #null_ls_sources ~= 0 then
	null_ls.setup({
		debug = false,
		sources = null_ls_sources,
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

-- Setup servers that I want automatically installed
local installable_servers = { "gopls", "sumneko_lua", "yamlls" }
for _, name in pairs(installable_servers) do
	local found, server = installer.get_server(name)
	if found then
		if not server:is_installed() then
			print("installing: " .. name)
			server:install()
		end
	end
end

installer.on_server_ready(function(server)
	-- Only configure here the servers that I want autoinstalled
	if not h.has_value(installable_servers, server.name) then
		return
	end

	local common_opts = {
		on_attach = on_attach,
		capabilities = capabilities,
		handlers = handlers,
	}

	-- These are server specific options for the ones that are automatically
	-- installed
	local server_opts = {
		["sumneko_lua"] = function()
			common_opts.settings = {
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
			common_opts.on_attach = on_attach

			-- Disable publishing LSP's diagnostics to use the ones from luacheck
			-- instead
			common_opts.handlers["textDocument/publishDiagnostics"] = function() end
		end,
		["gopls"] = function()
			common_opts.on_attach = function(client, bufnr)
				-- disable  formatting for gopls so that goimports handles it through
				-- null-ls
				client.resolved_capabilities.document_formatting = not has_goimports
				client.resolved_capabilities.document_range_formatting = not has_goimports

				on_attach(client, bufnr)
			end
		end,
		["yamlls"] = function()
			common_opts.settings = {
				yaml = {
					schemas = {
						["https://json.schemastore.org/github-workflow.json"] = "/.github/workflows/*",
						["https://raw.githubusercontent.com/compose-spec/compose-spec/master/schema/compose-spec.json"] = "docker-compose*.yml",
					},
				},
			}
		end,
	}

	-- Use the server's custom settings, if they exist, otherwise default to the
	-- default options
	local opts = server_opts[server.name] and server_opts[server.name]() or common_opts
	server:setup(opts)
end)

-- I don't want solargraph or rubocop to be automatically setup. Only if the
-- project  is using them and has them as binstubs.
if vim.fn.executable("bin/solargraph") == 1 then
	lsp.solargraph.setup({
		on_attach = function(client, bufnr)
			-- disable  formatting for solargraph so that goimports handles it through
			-- null-ls
			client.resolved_capabilities.document_formatting = not has_rubocop
			client.resolved_capabilities.document_range_formatting = not has_rubocop

			on_attach(client, bufnr)
		end,
		capabilities = capabilities,
		cmd = { "bin/solargraph", "stdio" },
		handlers = handlers,
	})
end

trouble.setup({})
