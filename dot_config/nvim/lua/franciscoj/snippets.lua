local ls = require("luasnip")
ls.setup({ store_selection_keys = "<Tab>" })

-- This should load vscode snippets from friendly snippets
require("luasnip.loaders.from_vscode").load({ include = {
	"eelixir",
	"elixir",
	"go",
	"lua",
	"ruby",
} })

-- Load snippets per file type
require("franciscoj.snippets.all")
require("franciscoj.snippets.gitcommit")
require("franciscoj.snippets.go")
require("franciscoj.snippets.ruby")

--- Returns a function that changes the coice of a choice node when called.
-- @param direction 1 for next, -1 for prev
-- @return a function that changes the choice
local choose = function(direction)
	return function()
		if ls.choice_active() then
			ls.change_choice(direction)
		end
	end
end

-- Navigate choice nodes
vim.keymap.set({ "i", "s" }, "<C-n>", choose(1))
vim.keymap.set({ "i", "s" }, "<C-p>", choose(-1))

-- show choice list
vim.keymap.set("i", "<C-j>", require("luasnip.extras.select_choice"))
