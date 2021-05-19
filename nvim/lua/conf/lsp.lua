local nvim_lsp = require('lspconfig')

local on_attach = function(client, bufnr)
  require('lspkind').init()
  local saga = require 'lspsaga'
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  -- Initialize LSP Saga plugin
  saga.init_lsp_saga({
    code_action_prompt = {
      sign = false,
      virtual_text = true
    },
    border_style = 2
  })

  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  ---------------
  -- Mappings. --
  ---------------
  local opts = { noremap = true, silent = true }

  -- Diagnostics
  buf_set_keymap('n', '[d', ':Lspsaga diagnostic_jump_next<CR>', opts)
  buf_set_keymap('n', ']d', ':Lspsaga diagnostic_jump_prev<CR>', opts)
  buf_set_keymap('n', '<leader>e', ':Lspsaga show_line_diagnostics<CR>', opts)
  buf_set_keymap('n', '<leader>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)
  -- Moving
  buf_set_keymap('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  buf_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
  buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  buf_set_keymap('n', '<leader>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  buf_set_keymap('n', '<leader>r', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  -- Help
  buf_set_keymap('i', '<C-l>', ':Lspsaga signature_help<CR>', opts)
  buf_set_keymap('n', '<C-l>', ':Lspsaga signature_help<CR>', opts)
  buf_set_keymap('n', 'K', ':Lspsaga hover_doc<CR>', opts)
  buf_set_keymap('n', '<C-k>', ':Lspsaga preview_definition<CR>', opts)
  -- Actions
  buf_set_keymap('n', '<leader>a',":Lspsaga code_action<CR>", opts)
  buf_set_keymap('v', '<leader>a',':<C-U>Lspsaga range_code_action<CR>', opts)
  buf_set_keymap('n', '<leader>rn', ':Lspsaga rename<CR>', opts)
  -- Scroll
  buf_set_keymap('n', '<C-f>', "<cmd>lua require('lspsaga.action').smart_scroll_with_saga(1)<CR>", opts)
  buf_set_keymap('n', '<C-b>', "<cmd>lua require('lspsaga.action').smart_scroll_with_saga(-1)<CR>", opts)


  -- Format (if available)
  if client.resolved_capabilities.document_formatting then
    buf_set_keymap("n", "<space>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
  elseif client.resolved_capabilities.document_range_formatting then
    buf_set_keymap("n", "<space>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
  end
end

-- Configure specific LSPs
nvim_lsp["solargraph"].setup {
  on_attach = on_attach,
  cmd = { "./bin/solargraph", "stdio" },
  settings = {
    solargraph = {
      -- I'm still not sure I like the diagnostics signals that the LSP uses,
      -- I'll work later on to improve the styles a bit
      diagnostics = true
    }
  }
}

nvim_lsp["rust_analyzer"].setup { on_attach = on_attach }
nvim_lsp["gopls"].setup { on_attach = on_attach }
nvim_lsp["tsserver"].setup { on_attach = on_attach }

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics, {
    -- Enable underline
    underline = true,
    -- Disable virtual text completely
    virtual_text = false,
  }
)
