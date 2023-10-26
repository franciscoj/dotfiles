return {
	{
		"tpope/vim-obsession",
		config = function()
			vim.keymap.set("n", "<leader>ss", "<cmd>Obsess<cr>")
		end,
	},
}
