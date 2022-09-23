local ls = require("luasnip")

-- This should load vscode snippets from friendly snippets
require("luasnip.loaders.from_vscode").load({ exclude = { "gitcommit" } })

-- Load snippets per file type
require("franciscoj.snippets.all")
require("franciscoj.snippets.gitcommit")
require("franciscoj.snippets.go")

--- Returns a function that changes the coice of a choice node when called.
-- @param direction 1 for next, -1 for prev
-- @return a function that changes the choice
local choose = function(direction)
  return function()
    ls.change_choice(direction)
  end
end

-- Navigate choice nodes
vim.keymap.set({ "i", "s" }, "<C-n>", choose(1))
vim.keymap.set({ "i", "s" }, "<C-p>", choose(-1))

-- show choice list
vim.keymap.set("i", "<C-j>", require("luasnip.extras.select_choice"))
