return {
	{
		"pechorin/any-jump.vim",
		enabled = vim.g.started_by_firenvim ~= true,
		keys = {
			-- FIXME: (@franciscoj 15/05/2023) Mode "x" doesn't really work
			-- here, don't know why. I'll have to investigate a bit about it.
			{ "<leader>j", nil, { "n", "x" } },
			{ "<leader>ab", nil, "n" },
			{ "<leader>al", nil, "n" },
		},
	},
}
