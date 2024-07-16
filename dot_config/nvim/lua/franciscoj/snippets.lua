local ls = require("luasnip")
ls.setup({
	-- This uses the currently selected test as the value for an insert node
	store_selection_keys = "<Tab>",
})
ls.filetype_extend("elixir", { "heex" })

-- This should load vscode snippets from friendly snippets
require("luasnip.loaders.from_vscode").load({
	include = {
		"eelixir",
		"elixir",
		"go",
		"html",
		"javascript",
		"lua",
		"ruby",
		"typescript",
	},
})

require("luasnip.loaders.from_lua").load({
	fs_event_providers = { libuv = true },
})

--- Returns a function that changes the option of a choice node when called.
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
