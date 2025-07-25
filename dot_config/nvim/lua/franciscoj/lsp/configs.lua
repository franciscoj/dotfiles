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
		vim.keymap.set("n", "gO", fzf.lsp_document_symbols, { desc = "Find symbol in document (LSP)" })
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
			function() vim.diagnostic.jump({ count = 1, float = { focus = false, border = "rounded" } }) end,
			{ desc = "Next diagnostic (LSP)" }
		)
		vim.keymap.set(
			"n",
			"[d",
			function() vim.diagnostic.jump({ count = -1, float = { focus = false, border = "rounded" } }) end,
			{ desc = "Prev diagnostic (LSP)" }
		)

		if client:supports_method("textDocument/codeLens") then
			local id = vim.api.nvim_create_augroup("lsp_code_lens_refresh", { clear = true })
			vim.api.nvim_create_autocmd({ "BufEnter", "CursorHold", "InsertLeave" }, {
				buffer = args.buf,
				group = id,
				callback = function() vim.lsp.codelens.refresh({ bufnr = args.buf }) end,
			})

			vim.keymap.set(
				"n",
				"<localLeader><localLeader>A",
				function() vim.lsp.codelens.refresh({ bufnr = args.buf }) end,
				{ desc = "Refresh codelens (LSP)", buffer = args.buf }
			)

			vim.keymap.set(
				"n",
				"<LocalLeader>A",
				vim.lsp.codelens.run,
				{ desc = "Run codelens (LSP)", buffer = args.buf }
			)
		end

		-- Disable virtual diagnostics because they are mostly annoying and enable virtual lines for the current line.
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

vim.lsp.enable("elixirls", features.elixir)
vim.lsp.enable("ruby_ls", features.ruby_ls)
vim.lsp.enable("tailwindcss", features.tailwind)
vim.lsp.enable("ansiblels", features.ansible)
vim.lsp.enable("eslint", features.typescript)
vim.lsp.enable("roslyn", features.roslyn)
vim.lsp.enable({ "marksman", "jsonls" })
