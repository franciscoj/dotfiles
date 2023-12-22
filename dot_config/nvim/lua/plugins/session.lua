return {
	{
		"tpope/vim-obsession",
		enabled = vim.g.started_by_firenvim ~= true,
		config = function()
			vim.keymap.set("n", "<leader>ss", "<cmd>Obsess<cr>")
		end,
	},
}
