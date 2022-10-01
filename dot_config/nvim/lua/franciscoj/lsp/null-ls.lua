local null_ls = require("null-ls")
local features = require("franciscoj.lsp.features")
local mason = require("franciscoj.mason")
local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics
local code_actions = null_ls.builtins.code_actions

mason.ensure_tools()

local sources = {
  code_actions.gitsigns,
  diagnostics.golangci_ci.with({ command = mason.get_path("golangci-lint") }),
  diagnostics.tsc,
  formatting.goimports.with({ command = mason.get_path("goimports") }),
  formatting.prettier,
}

if features.rubocop then
  table.insert(sources, formatting.rubocop.with({ command = "bin/rubocop" }))
  table.insert(sources, diagnostics.rubocop.with({ command = "bin/rubocop" }))
end

-- These are only relevant when editing DOTFILES
if vim.env.DOTFILES then
  if features.luacheck then
    table.insert(sources, diagnostics.luacheck)
  end

  if features.stylua then
    table.insert(sources, formatting.stylua)
  end
end

null_ls.setup({
  debug = false,
  sources = sources,
  on_attach = function(client)
    if client.resolved_capabilities.document_formatting then
      local id = vim.api.nvim_create_augroup("lsp_formatting", { clear = false })
      vim.api.nvim_clear_autocmds({ buffer = 0, group = id })
      vim.api.nvim_create_autocmd("BufWritePre", {
        buffer = 0,
        group = id,
        callback = vim.lsp.buf.formatting_sync,
      })
    end
  end,
})
