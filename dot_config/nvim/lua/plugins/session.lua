--# selene: allow(mixed_table)
return {
	{
		"tpope/vim-obsession",
		enabled = not vim.g.started_by_firenvim,
		keys = { { "<leader>ss", "<cmd>Obsess<cr>" } },
	},
}
