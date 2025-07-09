require("franciscoj.lsp.configs.gopls")
require("franciscoj.lsp.configs.lua_ls")
require("franciscoj.lsp.configs.rust_analyzer")
require("franciscoj.lsp.configs.sorbet")
require("franciscoj.lsp.configs.ts_ls")
require("franciscoj.lsp.configs.yamlls")

local features = require("franciscoj.lsp.features")
local fzf = require("fzf-lua")

vim.api.nvim_create_autocmd("LspAttach", {
	group = vim.api.nvim_create_augroup("franciscoj.lsp", {}),
	callback = function(args)
		local client = assert(vim.lsp.get_client_by_id(args.data.client_id))

		vim.keymap.set("n", "gD", vim.lsp.buf.declaration, { desc = "Go to declaration (LSP)" })
		vim.keymap.set("n", "gd", vim.lsp.buf.definition, { desc = "Go to definition (LSP)" })
		vim.keymap.set("n", "<LocalLeader>t", vim.lsp.buf.type_definition, { desc = "Go to type definition (LSP)" })
		vim.keymap.set(
			"n",
			"<LocalLeader>f",
			function() vim.lsp.buf.format({ timeout_ms = 5000 }) end,
			{ desc = "Format buffer (LSP)" }
		)
		-- Using fzf-lua
		vim.keymap.set("n", "<leader>fo", fzf.lsp_workspace_symbols, { desc = "Find symbol (LSP)" })
		vim.keymap.set("n", "grr", fzf.lsp_references, { desc = "Find references (LSP)" })
		vim.keymap.set("n", "gri", fzf.lsp_implementations, { desc = " Find implementations (LSP)" })

		vim.keymap.set(
			"n",
			"<LocalLeader>;",
			function() vim.diagnostic.open_float(nil, { focus = false, border = "rounded" }) end,
			{ desc = "Diagnostic detail (LSP)" }
		)
		vim.keymap.set(
			"n",
			"]d",
			function() vim.diagnostic.goto_next({ float = { focus = false, border = "rounded" } }) end,
			{ desc = "Next diagnostic (LSP)" }
		)
		vim.keymap.set(
			"n",
			"[d",
			function() vim.diagnostic.goto_prev({ float = { focus = false, border = "rounded" } }) end,
			{ desc = "Prev diagnostic (LSP)" }
		)

		if client.server_capabilities.codeLensProvider then
			local id = vim.api.nvim_create_augroup("lsp_code_lens_refresh", { clear = false })
			vim.api.nvim_clear_autocmds({ buffer = 0, group = id })
			vim.api.nvim_create_autocmd({ "BufEnter", "CursorHold", "InsertLeave" }, {
				buffer = 0,
				group = id,
				callback = function() vim.lsp.codelens.refresh({ bufnr = 0 }) end,
			})

			vim.keymap.set("n", "<LocalLeader>A", vim.lsp.codelens.run, { desc = "Run codelens (LSP)" })
		end

		-- Disable virtual diagnostics because they are mostly and enable virtual lines for the current line.
		vim.diagnostic.config({
			virtual_text = false,
			virtual_lines = { current_line = true },
		})
	end,
})

vim.lsp.config("*", {
	handlers = {
		["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "rounded" }),
		["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = "rounded" }),
	},
})

if features.elixir then
	vim.lsp.enable("elixirls")
end

if features.ruby_ls then
	vim.lsp.enable("ruby_ls")
end

if features.tailwind then
	vim.lsp.enable("tailwindcss")
end

if features.ansible then
	vim.lsp.enable("ansiblels")
end

vim.lsp.enable({ "marksman", "jsonls", "eslint", "roslyn" })
