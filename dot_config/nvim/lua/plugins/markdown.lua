--# selene: allow(mixed_table)
local features = require("franciscoj.lsp.features")

return {
	{
		"iamcco/markdown-preview.nvim",
		cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
		enabled = not features.codespaces,
		build = "cd app && yarn install",
		init = function() vim.g.mkdp_filetypes = { "markdown" } end,
		ft = { "markdown" },
	},
}
