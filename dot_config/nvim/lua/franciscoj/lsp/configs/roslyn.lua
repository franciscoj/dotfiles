local Config = require("franciscoj.lsp.config")
local cfg = Config:new({})

vim.lsp.config("roslyn", cfg:to_lspconfig())
