--# selene: allow(mixed_table)
return {
	"saghen/blink.cmp",
	dependencies = {
		{
			"L3MON4D3/LuaSnip",
			version = "v2.*",
			submodules = false,
			dependencies = {
				"rafamadriz/friendly-snippets",
			},
			init = function() require("franciscoj.snippets") end,
		},
		{
			"folke/lazydev.nvim",
			cmd = { "LazyDev" },
			ft = "lua",
		},
		"fang2hou/blink-copilot",
	},
	version = "1.*",

	---@module 'blink.cmp'
	---@type blink.cmp.Config
	opts = {
		keymap = {
			["<C-l>"] = { "snippet_forward", "fallback" },
			["<C-h>"] = { "snippet_backward", "fallback" },
			["<C-b>"] = { function(cmp) cmp.scroll_documentation_up(4) end, "fallback" },
			["<C-f>"] = { function(cmp) cmp.scroll_documentation_down(4) end, "fallback" },
		},
		completion = {
			documentation = { auto_show = true, auto_show_delay_ms = 500 },
			ghost_text = { enabled = true },
			accept = { auto_brackets = { enabled = false } },
			list = { selection = { preselect = false, auto_insert = true } },
			menu = { auto_show = false },
		},
		snippets = {
			preset = "luasnip",
		},
		sources = {
			default = { "copilot", "lsp", "path", "snippets", "buffer" },
			per_filetype = {
				lua = { inherit_defaults = true, "lazydev" },
			},
			providers = {
				snippets = { score_offset = 120 },
				dadbod = {
					score_offset = 110,
					module = "vim_dadbod_completion.blink",
					name = "Dadbod",
				},
				lazydev = {
					name = "LazyDev",
					module = "lazydev.integrations.blink",
					-- make lazydev completions top priority (see `:h blink.cmp`)
					score_offset = 100,
				},
				lsp = { score_offset = 90 },
				copilot = {
					name = "copilot",
					module = "blink-copilot",
					async = true,
				},
			},
		},
		signature = { enabled = true },
	},
}
