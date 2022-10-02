local capabilities = require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol.make_client_capabilities())
local builtin = require("telescope.builtin")
local themes = require("telescope.themes")

local function on_attach(client, _bufnr)
	-- Using LSP defaults
	vim.keymap.set("n", "gD", vim.lsp.buf.declaration)
	vim.keymap.set("n", "gd", vim.lsp.buf.definition)
	vim.keymap.set("n", "<LocalLeader>t", vim.lsp.buf.type_definition)
	vim.keymap.set("n", "<LocalLeader>f", vim.lsp.buf.format)
	vim.keymap.set("n", "K", vim.lsp.buf.hover)
	vim.keymap.set("n", "<LocalLeader>k", vim.lsp.buf.signature_help)
	vim.keymap.set("n", "<LocalLeader>r", vim.lsp.buf.rename)
	vim.keymap.set("n", "<LocalLeader>;", function()
		vim.diagnostic.open_float(nil, { focus = false, border = "rounded" })
	end)

	-- I'm not sure why these are for
	-- vim.keymap.set("n", "<LocalLeader>wa", vim.lsp.buf.add_workspace_folder)
	-- vim.keymap.set("n", "<LocalLeader>wr", vim.lsp.buf.remove_workspace_folder)
	-- vim.keymap.set("n", "<LocalLeader>wl", function()
	-- 	print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
	-- end)

	-- Using Telescope
	vim.keymap.set("n", "<LocalLeader>o", builtin.lsp_dynamic_workspace_symbols)
	vim.keymap.set("n", "gr", builtin.lsp_references)
	vim.keymap.set("n", "gi", builtin.lsp_implementations)
	vim.keymap.set("n", "<LocalLeader>a", vim.lsp.buf.code_action)
	vim.keymap.set("x", "<LocalLeader>a", vim.lsp.buf.range_code_action)

	-- Using trouble.nvim
	vim.keymap.set("n", "<LocalLeader>d", "<cmd>Trouble document_diagnostics<CR>")
	vim.keymap.set("n", "<LocalLeader>D", "<cmd>Trouble workspace_diagnostics<CR>")

	-- Disable virtual diagnostics because they are mostly annoying
	vim.diagnostic.config({ virtual_text = false })

	if client.server_capabilities.codeLensProvider then
		local id = vim.api.nvim_create_augroup("lsp_code_lens_refresh", { clear = false })
		vim.api.nvim_clear_autocmds({ buffer = 0, group = id })
		vim.api.nvim_create_autocmd({ "BufEnter", "InsertLeave", "CursorHold" }, {
			buffer = 0,
			group = id,
			callback = vim.lsp.codelens.refresh,
		})

		vim.api.nvim_create_autocmd("BufEnter", {
			buffer = 0,
			callback = vim.lsp.codelens.display,
			group = id,
		})

		vim.keymap.set("n", "<LocalLeader>A", vim.lsp.codelens.run)
	end
end

local M = {}

--- Returns the default configurations that are common to all LSPs
M.defaults = function()
	return {
		capabilities = capabilities,
		handlers = {
			["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "rounded" }),
			["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = "rounded" }),
		},
		on_attach = on_attach,
	}
end
M.on_attach = on_attach

return M
