return {
	{
		"iamcco/markdown-preview.nvim",
		enabled = not vim.g.started_by_firenvim,
		ft = { "markdown" },
		build = "cd app && yarn install",
	},
}
