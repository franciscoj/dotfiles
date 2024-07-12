local ls = require("luasnip")
local s = ls.snippet
local sn = ls.snippet_node
local isn = ls.indent_snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local c = ls.choice_node
local d = ls.dynamic_node
local r = ls.restore_node
local l = require("luasnip.extras").lambda
local rep = require("luasnip.extras").rep
local p = require("luasnip.extras").partial
local m = require("luasnip.extras").match
local n = require("luasnip.extras").nonempty
local dl = require("luasnip.extras").dynamic_lambda
local fmt = require("luasnip.extras.fmt").fmt
local fmta = require("luasnip.extras.fmt").fmta
local types = require("luasnip.util.types")
local conds = require("luasnip.extras.expand_conditions")

local selection_or = function(default)
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

ls.add_snippets("elixir", {
	s(
		"=dg",
		fmt([[<%= dgettext("{domain}", "{message}") %>]], {
			domain = i(1, "domain"),
			message = d(2, selection_or("message")),
		})
	),
	s(
		"dg",
		fmt([[dgettext("{domain}", "{message}")]], {
			domain = i(1, "domain"),
			message = d(2, selection_or("message")),
		})
	),
})
