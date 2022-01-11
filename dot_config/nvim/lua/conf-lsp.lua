local installer = require("nvim-lsp-installer")
local trouble = require("trouble")
local h = require("h")
local capabilities = require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol.make_client_capabilities())

trouble.setup({})

local on_attach = function(client, _bufnr)
	-- Using LSP defaults
	h.nnoremap("gD", "<cmd>lua vim.lsp.buf.declaration()<CR>")
	h.nnoremap("gd", "<cmd>lua vim.lsp.buf.definition()<CR>")
	h.nnoremap("<LocalLeader>wa", "<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>")
	h.nnoremap("<LocalLeader>wr", "<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>")
	h.nnoremap("<LocalLeader>wl", "<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>")
	h.nnoremap("<LocalLeader>t", "<cmd>lua vim.lsp.buf.type_definition()<CR>")
	h.nnoremap("<LocalLeader>f", "<cmd>lua vim.lsp.buf.formatting()<CR>")
	h.nnoremap("K", "<cmd>lua vim.lsp.buf.hover()<CR>")
	h.nnoremap("<LocalLeader>k", "<cmd>lua vim.lsp.buf.signature_help()<CR>")
	h.nnoremap("<LocalLeader>r", "<cmd>lua vim.lsp.buf.rename()<CR>")
	h.nnoremap("<LocalLeader>a", "<cmd>lua vim.lsp.buf.code_action()<CR>")
	h.nnoremap("<LocalLeader>l", [[<cmd>lua vim.diagnostic.open_float(nil, {focus=false, border="rounded"})<CR>]])

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

local servers = { "gopls", "sumneko_lua" }
for _, name in pairs(servers) do
	local found, server = installer.get_server(name)
	if found then
		if not server:is_installed() then
			print("Installing " .. name)
			server:install()
		end
	end
end

installer.on_server_ready(function(server)
	local common_opts = {
		on_attach = on_attach,
		capabilities = capabilities,
		handlers = {
			["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "rounded" }),
			["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = "rounded" }),
		},
	}

	-- -- Now we'll create a server_opts table where we'll specify our custom LSP server configuration
	local server_opts = {
		-- Provide settings that should only apply to the specific servers
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
			common_opts.on_attach = function(client, bufnr)
				on_attach(client, bufnr)
			end

			-- Disable publishing LSP's diagnostics to use the ones from luacheck instead
			common_opts.handlers["textDocument/publishDiagnostics"] = function() end
		end,
		["gopls"] = function()
			common_opts.on_attach = function(client, bufnr)
				-- disable  formatting for gopls so that null-ls handles it
				client.resolved_capabilities.document_formatting = false
				client.resolved_capabilities.document_range_formatting = false

				on_attach(client, bufnr)
			end
		end,
	}

	-- Use the server's custom settings, if they exist, otherwise default to the default options
	local opts = server_opts[server.name] and server_opts[server.name]() or common_opts
	server:setup(opts)
end)

local null_ls = require("null-ls")
local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics

null_ls.setup({
	debug = false,
	sources = {
		diagnostics.golangci_lint,
		diagnostics.luacheck,
		formatting.goimports,
		formatting.stylua,
	},
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
