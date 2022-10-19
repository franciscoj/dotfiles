local ls = require("luasnip")
local s = ls.snippet
local sn = ls.snippet_node
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

local selection_or = function(txt)
	return function(_args, snip)
		local env = snip.env
		local content = env.TM_SELECTED_TEXT[1] or txt

		return sn(nil, { i(1, content) })
	end
end

ls.add_snippets("ruby", {
	s("ty", {
		t("# typed: "),
		c(1, { t("true"), t("false"), t("strict") }),
	}),
	s("tsig", { t("extend T::Sig") }),
	s("tnil", fmt("T.nilable({type})", { type = d(1, selection_or("Type")) })),
	s("tary", fmt("T::Array[{type}]", { type = d(1, selection_or("Type")) })),
	s("thash", fmt("T::Hash[{key}, {val}]", { key = i(1, "Type"), val = i(2, "Type") })),
	s("tlet", fmt("T.let({val}, {type})", { val = d(1, selection_or("val")), type = i(2, "Type") })),
	s("tcast", fmt("T.cast({val}, {type})", { val = d(1, selection_or("val")), type = i(2, "Type") })),
	s("tmust", fmt("T.must({val})", { val = d(1, selection_or("val")) })),
})
