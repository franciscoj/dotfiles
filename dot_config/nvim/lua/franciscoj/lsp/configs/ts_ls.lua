local features = require("franciscoj.lsp.features")

vim.lsp.config("ts_ls", {
	on_attach = function(client, bufnr)
		-- disable  formatting for ts_ls so that prettier handles it through
		-- null-ls
		client.server_capabilities.documentFormattingProvider = false
		client.server_capabilities.documentRangeFormattingProvider = false

		vim.api.nvim_buf_create_user_command(
			0,
			"TypeScriptOrganiseImports",
			function()
				client:exec_cmd({
					command = "_typescript.organizeImports",
					arguments = { vim.api.nvim_buf_get_name(bufnr) },
				})
			end,
			{ desc = "Organise imports" }
		)

		vim.keymap.set("n", "<LocalLeader>O", "<cmd>:TypeScriptOrganiseImports<CR>")
	end,
})

vim.lsp.enable("ts_ls", features.typescript)
