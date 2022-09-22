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


-- This should load vscode snippets from friendly snippets
require("luasnip.loaders.from_vscode").load({ exclude = { "gitcommit" } })

local date = function()
  return os.date("%d/%m/%Y")
end

ls.add_snippets("all", {
  s("todo", {
    c(1, { t("TODO"), t("NOTE"), t("FIXME"), }),
    t(": (@franciscoj "),
    f(date, {}),
    t(") "),
  })
})

local conventionalCommit = function(trigger)
  return s(trigger, {
    t(trigger),
    sn(1, { t("("), i(1, ""), t(")") }),
    t(": "),
    i(2, "message"),
  })
end

ls.add_snippets("gitcommit", {
  conventionalCommit("chore"),
  conventionalCommit("docs"),
  conventionalCommit("feat"),
  conventionalCommit("fix"),
  conventionalCommit("refactor"),
  conventionalCommit("wip")
})

-- navigate choice nodes
vim.keymap.set({ "i", "s" }, "<C-n>", function()
  ls.change_choice(1)
end)
vim.keymap.set({ "i", "s" }, "<C-p>", function()
  ls.change_choice(-1)
end)

-- show choice list
vim.keymap.set("i", "<C-j>", require("luasnip.extras.select_choice"))
