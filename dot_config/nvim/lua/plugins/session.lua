return {
	{
		"tpope/vim-obsession",
		enabled = not vim.g.started_by_firenvim,
		config = function()
			vim.keymap.set("n", "<leader>ss", "<cmd>Obsess<cr>")
		end,
	},
}
