local lspconfig = require("lspconfig")
local Config = require("franciscoj.lsp.config")
local neodev = require("neodev")

neodev.setup({
	override = function(root_dir, library)
		local dotfiles_root = root_dir .. "/.chezmoi.toml.tmpl"
		local f = io.open(dotfiles_root, "r")

		if f ~= nil then
			library.enabled = true
			library.runtime = true
			library.types = true
			library.plugins = true

			io.close(f)
		end
	end,
})

local cfg = Config:new({
	settings = {
		Lua = {
			diagnostics = {
				globals = { "vim" },
			},
		},
	},
	handlers = {
		-- Disable the diagnostics from the LSP as I tipically use luacheck,
		-- which is configured on a different plugin
		["textDocument/publishDiagnostics"] = function() end,
	},
	on_attach = function(client, _bufnr)
		client.server_capabilities.documentFormattingProvider = false
		client.server_capabilities.documentRangeFormattingProvider = false
	end,
})

lspconfig.lua_ls.setup(cfg:to_lspconfig())
