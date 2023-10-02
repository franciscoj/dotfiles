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

local date = function()
	return os.date("%d/%m/%Y")
end

-- Returns a snippet that introduces a TODO formatted with my username and a
-- date so that I can easily track them.
local comment = function(trigger, opts)
	return s(trigger, {
		c(1, opts),
		t("(franciscoj): [On "),
		f(date, {}),
		t("] "),
	})
end

ls.add_snippets("all", {
	comment("fix", { t("FIXME"), t("NOTE"), t("TODO") }),
	comment("note", { t("NOTE"), t("TODO"), t("FIXME") }),
	comment("todo", { t("TODO"), t("NOTE"), t("FIXME") }),
})
