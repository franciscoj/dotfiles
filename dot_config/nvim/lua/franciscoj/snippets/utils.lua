local ls = require("luasnip")
local sn = ls.snippet_node
local i = ls.insert_node
local isn = ls.indent_snippet_node
local t = ls.text_node

local U = {}

function U.selection_or(default)
	return function(_args, snip)
		local env = snip.env
		local selected = env.TM_SELECTED_TEXT

		-- If the selection is empty, return the default text instead
		if #selected == 0 then
			return sn(nil, { i(1, default) })
		end

		-- If the selection has a single line as as the default of a new insert
		-- node so that it can be edited or changed
		if #selected == 1 then
			return sn(nil, { i(1, selected[1]) })
		end

		-- If there's a multi line selection, then just add everything.
		return isn(nil, t(selected), "$PARENT_INDENT  ")
	end
end

function U.value_on(args, _snip)
	return sn(nil, { i(1, args[1][1]) })
end

return U
