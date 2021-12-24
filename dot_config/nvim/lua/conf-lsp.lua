local lsp_installer = require("nvim-lsp-installer")
local h = require("h")

local on_attach = function(client, bufnr)
  h.nnoremap("gD", "<cmd>lua vim.lsp.buf.declaration()<CR>")
  h.nnoremap("gd", "<cmd>lua vim.lsp.buf.definition()<CR>")
  h.nnoremap("K", "<cmd>lua vim.lsp.buf.hover()<CR>")
  h.nnoremap("gi", "<cmd>lua vim.lsp.buf.implementation()<CR>")
  h.nnoremap("<LocalLeader>k", "<cmd>lua vim.lsp.buf.signature_help()<CR>")
  h.nnoremap("<LocalLeader>wa", "<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>")
  h.nnoremap("<LocalLeader>wr", "<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>")
  h.nnoremap("<LocalLeader>wl", "<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>")
  h.nnoremap("<LocalLeader>D", "<cmd>lua vim.lsp.buf.type_definition()<CR>")
  h.nnoremap("<LocalLeader>r", "<cmd>lua vim.lsp.buf.rename()<CR>")
  h.nnoremap("<LocalLeader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>")
  h.nnoremap("gr", "<cmd>lua vim.lsp.buf.references()<CR>")
  h.nnoremap("<LocalLeader>e", "<cmd>lua vim.diagnostic.open_float()<CR>")
  h.nnoremap("[d", "<cmd>lua vim.diagnostic.goto_prev()<CR>")
  h.nnoremap("]d", "<cmd>lua vim.diagnostic.goto_next()<CR>")
  h.nnoremap("<LocalLeader>q", "<cmd>lua vim.diagnostic.setqflist()<CR>")
  h.nnoremap("<LocalLeader>f", "<cmd>lua vim.lsp.buf.formatting()<CR>")
end

local servers = { "gopls", "sumneko_lua" }
for _, name in pairs(servers) do
  local found, server = lsp_installer.get_server(name)
  if found then
    if not server:is_installed() then
      print("Installing " .. name)
      server:install()
    end
  end
end

lsp_installer.on_server_ready(function(server)
  local common_opts = { on_attach = on_attach }

  -- -- Now we'll create a server_opts table where we'll specify our custom LSP server configuration
  local server_opts = {
    -- Provide settings that should only apply to the specific servers
    ["sumneko_lua"] = function()
      common_opts.settings = {
        Lua = {
          diagnostics = {
            globals = { "vim" },
          },
        }
      }
    end,
  }

  -- Use the server's custom settings, if they exist, otherwise default to the default options
  local opts = server_opts[server.name] and server_opts[server.name]() or common_opts
  server:setup(opts)
end)
