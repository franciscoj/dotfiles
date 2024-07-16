local ls = require("luasnip")
local s = ls.snippet
-- local sn = ls.snippet_node
-- local isn = ls.indent_snippet_node
local t = ls.text_node
local i = ls.insert_node
-- local f = ls.function_node
local c = ls.choice_node
local d = ls.dynamic_node
-- local r = ls.restore_node
-- local l = require("luasnip.extras").lambda
-- local rep = require("luasnip.extras").rep
-- local p = require("luasnip.extras").partial
-- local m = require("luasnip.extras").match
-- local n = require("luasnip.extras").nonempty
-- local dl = require("luasnip.extras").dynamic_lambda
local fmt = require("luasnip.extras.fmt").fmt
-- local fmta = require("luasnip.extras.fmt").fmta
-- local types = require("luasnip.util.types")
-- local conds = require("luasnip.extras.expand_conditions")
local utils = require("franciscoj.snippets.utils")

return {
	s("=", fmt([[<%= {txt} %>]], { txt = i(1, "txt") })),
	s(
		"a=",
		fmt([[{attr}={val}]], {
			attr = i(1, "class"),
			val = c(2, {
				{ t([["]]), i(1, "val"), t([["]]) },
				{ t([[{]]), i(1, "val"), t([[}]]) },
			}),
		})
	),
	s(
		"=dg",
		fmt([[<%= dgettext("{domain}", "{message}") %>]], {
			domain = i(1, "domain"),
			message = d(2, utils.selection_or("message")),
		})
	),
}
