local features = require("franciscoj.lsp.features")
local lspconfig = require("lspconfig")
local Config = require("franciscoj.lsp.config")

if not features.typescript then
	return
end

local function organize_imports()
	local params = {
		command = "_typescript.organizeImports",
		arguments = { vim.api.nvim_buf_get_name(0) },
		title = "",
	}
	vim.lsp.buf.execute_command(params)
end

local cfg = Config:new({
	commands = {
		OrganizeImports = {
			organize_imports,
			description = "Organize Imports",
		},
	},
	on_attach = function(client, _bufnr)
		-- disable  formatting for ts_ls so that prettier handles it through
		-- null-ls
		client.server_capabilities.documentFormattingProvider = false
		client.server_capabilities.documentRangeFormattingProvider = false

		vim.keymap.set("n", "<LocalLeader>O", "<cmd>:OrganizeImports<CR>")
	end,
})

lspconfig.ts_ls.setup(cfg:to_lspconfig())
