local installer = require("nvim-lsp-installer")
local saga = require("lspsaga")
local h = require("h")
local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())

saga.setup({
 border_style = "round"
})

---@diagnostic disable-next-line: unused-local
local on_attach = function(client, _bufnr)
  -- Using LSP defaults
  h.nnoremap("gD", "<cmd>lua vim.lsp.buf.declaration()<CR>")
  h.nnoremap("gd", "<cmd>lua vim.lsp.buf.definition()<CR>")
  h.nnoremap("<LocalLeader>wa", "<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>")
  h.nnoremap("<LocalLeader>wr", "<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>")
  h.nnoremap("<LocalLeader>wl", "<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>")
  h.nnoremap("<LocalLeader>t", "<cmd>lua vim.lsp.buf.type_definition()<CR>")
  h.nnoremap("<LocalLeader>f", "<cmd>lua vim.lsp.buf.formatting()<CR>")

  -- Using Lspsaga
  h.nnoremap("K", "<cmd>Lspsaga hover_doc<CR>")
  h.nnoremap("<LocalLeader>k", "<cmd>Lspsaga signature_help<CR>")
  h.nnoremap("<LocalLeader>r", "<cmd>Lspsaga rename<CR>")
  h.nnoremap("<LocalLeader>a", "<cmd>Lspsaga code_action<CR>")
  h.xnoremap("<LocalLeader>a", ":<c-u>Lspsaga range_code_action<cr>")
  h.nnoremap("[d", "<cmd>Lspsaga diagnostic_jump_prev<CR>")
  h.nnoremap("]d", "<cmd>Lspsaga diagnostic_jump_next<CR>")
  h.nnoremap("<LocalLeader>l", "<cmd>Lspsaga show_line_diagnostics<cr>")

  -- Using Telescope
  h.nnoremap("<LocalLeader>o", "<cmd>Telescope lsp_dynamic_workspace_symbols<CR>")
  h.nnoremap("gr", ":Telescope lsp_references<CR>")
  h.nnoremap("gi", ":Telescope lsp_implementations<CR>")
  h.nnoremap("<LocalLeader>d", "<cmd>Telescope diagnostics bufnr=0<CR>")
  h.nnoremap("<LocalLeader>D", "<cmd>Telescope diagnostics<CR>")

  -- Disable global diagnostics because they are mostly annoying
  vim.diagnostic.config({virtual_text = false})

  if client.resolved_capabilities.code_lens then
    vim.api.nvim_exec([[
      augroup lsp_code_lens_refresh
        autocmd! * <buffer>

        autocmd BufEnter,InsertLeave,CursorHold <buffer> lua vim.lsp.codelens.refresh()
        autocmd BufEnter <buffer> lua vim.lsp.codelens.display()
      augroup END
    ]], false)

    h.nnoremap("<LocalLeader>A", "<cmd>lua vim.lsp.codelens.run()<cr>")
  end
end

local servers = { "gopls", "sumneko_lua" }
for _, name in pairs(servers) do
  local found, server = installer.get_server(name)
  if found then
    if not server:is_installed() then
      print("Installing " .. name)
      server:install()
    end
  end
end

installer.on_server_ready(function(server)
  local common_opts = {
    on_attach = on_attach,
    capabilities = capabilities
  }

  -- -- Now we'll create a server_opts table where we'll specify our custom LSP server configuration
  local server_opts = {
    -- Provide settings that should only apply to the specific servers
    ["sumneko_lua"] = function()
      common_opts.settings = {
        Lua = {
          diagnostics = {
            globals = { "vim", "hs" },
          },
        }
      }
    end,
  }

  -- Use the server's custom settings, if they exist, otherwise default to the default options
  local opts = server_opts[server.name] and server_opts[server.name]() or common_opts
  server:setup(opts)
end)
