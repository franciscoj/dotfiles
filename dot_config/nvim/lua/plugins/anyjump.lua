--# selene: allow(mixed_table)
return {
	{
		"pechorin/any-jump.vim",
		enabled = not vim.g.started_by_firenvim,
		keys = {
			{ "<leader>j", desc = "Anyjump" },
			{ "<leader>ab", desc = "Anyjump back"  },
			{ "<leader>al", desc = "Anyjump last results" },
		},
	},
}
