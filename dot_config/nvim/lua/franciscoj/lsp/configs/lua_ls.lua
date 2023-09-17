local lspconfig = require("lspconfig")
local Config = require("franciscoj.lsp.config")
local neodev = require("neodev")

neodev.setup()

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
