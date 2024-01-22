return {
	{
		"phaazon/hop.nvim",
		branch = "v2",
		enabled = not vim.g.started_by_firenvim,
		config = function()
			local hop = require("hop")
			hop.setup({})
			local directions = require("hop.hint").HintDirection
			vim.keymap.set("", "f", function()
				hop.hint_char1({ direction = directions.AFTER_CURSOR, current_line_only = true })
			end, { remap = true, silent = true })
			vim.keymap.set("", "F", function()
				hop.hint_char1({ direction = directions.BEFORE_CURSOR, current_line_only = true })
			end, { remap = true, silent = true })
			vim.keymap.set("", "t", function()
				hop.hint_char1({ direction = directions.AFTER_CURSOR, current_line_only = true, hint_offset = -1 })
			end, { remap = true, silent = true })
			vim.keymap.set("", "T", function()
				hop.hint_char1({ direction = directions.BEFORE_CURSOR, current_line_only = true, hint_offset = 1 })
			end, { remap = true, silent = true })
			vim.keymap.set("n", "<LocalLeader><LocalLeader>", function()
				hop.hint_words()
			end, { silent = true })
		end,
	},
}
