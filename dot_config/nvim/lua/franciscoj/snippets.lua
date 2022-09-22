-- This should load vscode snippets from friendly snippets
require("luasnip.loaders.from_vscode").load({ exclude = { "gitcommit" } })

-- Load snippets per file type
require("franciscoj.snippets.all")
require("franciscoj.snippets.gitcommit")
-- require("franciscoj.snippets.go")

-- navigate choice nodes
vim.keymap.set({ "i", "s" }, "<C-n>", function()
  ls.change_choice(1)
end)
vim.keymap.set({ "i", "s" }, "<C-p>", function()
  ls.change_choice(-1)
end)

-- show choice list
vim.keymap.set("i", "<C-j>", require("luasnip.extras.select_choice"))
