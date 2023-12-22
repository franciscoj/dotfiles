return {
	{
		"lambdalisue/fern.vim",
		enabled = vim.g.started_by_firenvim ~= true,
		dependencies = {
			"lambdalisue/fern-hijack.vim",
			"lambdalisue/fern-git-status.vim",
			"lambdalisue/nerdfont.vim",
			"lambdalisue/glyph-palette.vim",
			"lambdalisue/fern-renderer-nerdfont.vim",
		},
		config = function()
			vim.g["fern#renderer"] = "nerdfont"

			local id = vim.api.nvim_create_augroup("fern-glyph-colors", { clear = false })
			vim.api.nvim_clear_autocmds({ group = id })
			vim.api.nvim_create_autocmd({ "FileType" }, {
				group = id,
				pattern = { "fern" },
				callback = "glyph_palette#apply",
			})
		end,
	},
}
