local lspconfig = require("lspconfig")
local Config = require("franciscoj.lsp.config")

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
		-- disable  formatting for tsserver so that prettier handles it through
		-- null-ls
		client.server_capabilities.documentFormattingProvider = false
		client.server_capabilities.documentRangeFormattingProvider = false

		vim.keymap.set("n", "<LocalLeader>O", "<cmd>:OrganizeImports<CR>")
	end,
})

lspconfig.tsserver.setup(cfg:to_lspconfig())
