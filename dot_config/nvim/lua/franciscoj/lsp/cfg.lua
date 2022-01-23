local capabilities = require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol.make_client_capabilities())
local h = require("h")

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

	-- Disable virtual diagnostics because they are mostly annoying
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
