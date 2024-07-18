--# selene: allow(mixed_table)
return {
	{
		"pechorin/any-jump.vim",
		enabled = not vim.g.started_by_firenvim,
		keys = {
			{ "<leader>j" },
			{ "<leader>ab" },
			{ "<leader>al" },
		},
	},
}
