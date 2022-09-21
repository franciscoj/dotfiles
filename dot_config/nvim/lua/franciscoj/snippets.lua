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
    sn(1, {
      t "(",
      i(1, ""),
      t ")"
    }),
    t(": "),
    i(2, "")
  })
end

ls.add_snippets("gitcommit", {
  conventionalCommit("feat"),
  conventionalCommit("docs"),
  conventionalCommit("refactor"),
  conventionalCommit("fix"),
  conventionalCommit("wip")
})
-- snippet wi "wip: commit message"
-- wip${1:($2)}: $0
-- endsnippet

-- snippet fi "fix: commit message"
-- fix${1:($2)}: $0
-- endsnippet

-- snippet fe "feat: commit message"
-- feat${1:($2)}: $0
-- endsnippet

-- snippet ch "chore: commit message"
-- chore${1:($2)}: $0
-- endsnippet

-- snippet do "docs: commit message"
-- docs${1:($2)}: $0
-- endsnippet

-- snippet re "refactor: commit message"
-- refactor${1:($2)}: $0
-- endsnippet

-- TODO: (@franciscoj) make this with lua
vim.cmd [[
imap <expr> <C-n> luasnip#choice_active() ? '<Plug>luasnip-next-choice' : '<C-n>'
smap <expr> <C-n> luasnip#choice_active() ? '<Plug>luasnip-next-choice' : '<C-n>'
imap <expr> <C-p> luasnip#choice_active() ? '<Plug>luasnip-prev-choice' : '<C-p>'
smap <expr> <C-p> luasnip#choice_active() ? '<Plug>luasnip-prev-choice' : '<C-p>'
inoremap <C-j> <cmd>lua require("luasnip.extras.select_choice")()<cr>
]]
