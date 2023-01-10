local function on_attach(client, _bufnr)
	local builtin = require("telescope.builtin")
	local h = require("h")

	-- Using LSP defaults
	h.nnoremap("gD", vim.lsp.buf.declaration)
	h.nnoremap("gd", vim.lsp.buf.definition)
	h.nnoremap("<LocalLeader>t", vim.lsp.buf.type_definition)
	h.nnoremap("<LocalLeader>f", vim.lsp.buf.format)
	h.nnoremap("K", vim.lsp.buf.hover)
	h.nnoremap("<LocalLeader>k", vim.lsp.buf.signature_help)
	h.nnoremap("<LocalLeader>r", vim.lsp.buf.rename)

	-- I'm not sure why these are for
	-- h.nnoremap("<LocalLeader>wa", vim.lsp.buf.add_workspace_folder)
	-- h.nnoremap("<LocalLeader>wr", vim.lsp.buf.remove_workspace_folder)
	-- h.nnoremap("<LocalLeader>wl", function()
	-- 	print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
	-- end)

	-- Using Telescope
	h.nnoremap("<LocalLeader>o", builtin.lsp_dynamic_workspace_symbols)
	h.nnoremap("gr", builtin.lsp_references)
	h.nnoremap("gi", builtin.lsp_implementations)
	h.nnoremap("<LocalLeader>a", vim.lsp.buf.code_action)
	-- TODO: (@franciscoj 10/01/2023) this seems broken, removing it just in case
	-- h.xnoremap("<LocalLeader>a", vim.lsp.buf.range_code_action)

	-- Using trouble.nvim
	h.nnoremap("<LocalLeader>d", "<cmd>TroubleToggle document_diagnostics<CR>")
	h.nnoremap("<LocalLeader>D", "<cmd>TroubleToggle workspace_diagnostics<CR>")

	h.nnoremap("<LocalLeader>;", function()
		vim.diagnostic.open_float(nil, { focus = false, border = "rounded" })
	end)
	h.nnoremap("]d", function()
		vim.diagnostic.goto_next({ float = { focus = false, border = "rounded" } })
	end)
	h.nnoremap("[d", function()
		vim.diagnostic.goto_prev({ float = { focus = false, border = "rounded" } })
	end)

	-- Disable virtual diagnostics because they are mostly annoying
	vim.diagnostic.config({ virtual_text = false })

	-- if client.server_capabilities.codeLensProvider then
	-- 	local id = vim.api.nvim_create_augroup("lsp_code_lens_refresh", { clear = false })
	-- 	vim.api.nvim_clear_autocmds({ buffer = 0, group = id })
	-- 	vim.api.nvim_create_autocmd({ "BufEnter", "InsertLeave", "CursorHold" }, {
	-- 		buffer = 0,
	-- 		group = id,
	-- 		callback = vim.lsp.codelens.refresh,
	-- 	})
	--
	-- 	vim.api.nvim_create_autocmd("BufEnter", {
	-- 		buffer = 0,
	-- 		callback = vim.lsp.codelens.display,
	-- 		group = id,
	-- 	})
	--
	-- 	h.nnoremap("<LocalLeader>A", vim.lsp.codelens.run)
	-- end
end

local M = {}

--- Returns the default configurations that are common to all LSPs
M.defaults = function()
	local capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())

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
