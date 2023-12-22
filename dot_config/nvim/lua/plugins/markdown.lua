return {
	{
		"iamcco/markdown-preview.nvim",
		enabled = vim.g.started_by_firenvim ~= true,
		ft = { "markdown" },
		build = "cd app && yarn install",
	},
}
