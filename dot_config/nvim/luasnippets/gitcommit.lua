local ls = require("luasnip")
local s = ls.snippet
-- local sn = ls.snippet_node
local t = ls.text_node
local i = ls.insert_node
-- local f = ls.function_node
local c = ls.choice_node
-- local d = ls.dynamic_node
-- local r = ls.restore_node
-- local l = require("luasnip.extras").lambda
-- local rep = require("luasnip.extras").rep
-- local p = require("luasnip.extras").partial
-- local m = require("luasnip.extras").match
-- local n = require("luasnip.extras").nonempty
-- local dl = require("luasnip.extras").dynamic_lambda
-- local fmt = require("luasnip.extras.fmt").fmt
-- local fmta = require("luasnip.extras.fmt").fmta
-- local types = require("luasnip.util.types")
-- local conds = require("luasnip.extras.expand_conditions")

-- Returns a snippet for a conventional commit with the given trigger.
local conventional_commit = function(trigger)
	return s(trigger, {
		t(trigger),
		c(1, {
			{ t("("), i(1, ""), t("): ") },
			t(": "),
		}),
		i(2, "message"),
	})
end

return {
	conventional_commit("chore"),
	conventional_commit("docs"),
	conventional_commit("experiment"),
	conventional_commit("feat"),
	conventional_commit("fix"),
	conventional_commit("refactor"),
	conventional_commit("test"),
	conventional_commit("wip"),
}
