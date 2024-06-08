local capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())
local Config = {
	["__on_attach"] = function(client, _bufnr)
		local h = require("h")
		local fzf = require("fzf-lua")

		-- Using LSP defaults
		h.nnoremap("gD", vim.lsp.buf.declaration)
		h.nnoremap("gd", vim.lsp.buf.definition)
		h.nnoremap("<LocalLeader>t", vim.lsp.buf.type_definition)
		h.nnoremap("<LocalLeader>f", function()
			vim.lsp.buf.format({ timeout_ms = 5000 })
		end)
		h.nnoremap("K", vim.lsp.buf.hover)
		h.nnoremap("<LocalLeader>k", vim.lsp.buf.signature_help)
		h.nnoremap("<LocalLeader>r", vim.lsp.buf.rename)
		h.nnoremap("<LocalLeader>a", vim.lsp.buf.code_action)

		-- Using fzf-lua
		h.nnoremap("<leader>fo", fzf.lsp_workspace_symbols)
		h.nnoremap("gr", fzf.lsp_references)
		h.nnoremap("gi", fzf.lsp_implementations)

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

		if client.server_capabilities.codeLensProvider then
			local id = vim.api.nvim_create_augroup("lsp_code_lens_refresh", { clear = false })
			vim.api.nvim_clear_autocmds({ buffer = 0, group = id })
			vim.api.nvim_create_autocmd({ "BufEnter", "CursorHold", "InsertLeave" }, {
				buffer = 0,
				group = id,
				callback = function()
					vim.lsp.codelens.refresh({ burnr = 0 })
				end,
			})

			h.nnoremap("<LocalLeader>A", vim.lsp.codelens.run)
		end
	end,
	["__handlers"] = {
		["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "rounded" }),
		["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = "rounded" }),
	},
}

function Config:to_lspconfig()
	return self.config
end

-- Receives a single argument table that allows to customize the configuration
-- on each on of the lsps arguments. For `on_attach` and `handlers` they add on
-- to the defualts, everything else is passed through to the lspconfig
function Config:new(args)
	local lsp = setmetatable({}, self)
	self.__index = self

	local config = {
		capabilities = capabilities,
		handlers = {},
	}

	config.on_attach = function(client, bufnr)
		if args.on_attach ~= nil then
			args.on_attach(client, bufnr)
		end

		self.__on_attach(client, bufnr)
	end

	-- copy the default handlers
	for k, v in pairs(self.__handlers) do
		config.handlers[k] = v
	end

	-- add any extra handler
	if args.handlers ~= nil then
		for k, v in pairs(args.handlers) do
			config.handlers[k] = v
		end
	end

	for k, v in pairs(args) do
		if k ~= "on_attach" and k ~= "handlers" then
			config[k] = v
		end
	end

	lsp.config = config

	return lsp
end

return Config
