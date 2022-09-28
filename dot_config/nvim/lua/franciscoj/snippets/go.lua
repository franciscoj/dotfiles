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

ls.add_snippets("go", {
  s({ trig = "wire", desc = "wire build tags" }, {
    t({
      "//go:build wireinject",
      "// +build wireinject",
    }),
  }),
  s({ trig = "wireg", desc = "wire generate" }, { t("//go:generate wire") }),
  s({ trig = "tshort", desc = "skip integration test" }, {
    t({ "if testing.Short() {", "\t" }),
    t({ [[t.Skip("skipping integration test")]], "}" }),
  }),
  s({ trig = "require", desc = "testify require" }, {
    t({ "require := require.New(t)" })
  }),

  -- //go:generate mockery --name DeliveryTracker --inpackage --filename mock_deliverytracking.go --structname DeliveryTrackerMock
  s({ trig = "mock", desc = "go:generate mockery ..." }, {
    t("//go:generate mockery"),
    t(" --name "), i(1, "Interface"),
    t(" --structname "), i(2, "InterfaceMock"),
    t(" --filename mock_"), i(3, "interface"), t(".go"),
    t(" --inpackage"),
  })
})
