--# selene: allow(mixed_table)
return {
	{
		"nvim-pack/nvim-spectre",
		enabled = not vim.g.started_by_firenvim,
		keys = {
			{ "<leader>R", function() require("spectre").toggle() end },
		},
	},
}
