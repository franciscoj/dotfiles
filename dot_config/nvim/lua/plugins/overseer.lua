return {
	{
		"stevearc/overseer.nvim",
		config = function()
			require("overseer").setup({
				strategy = "toggleterm",
			})
		end,
	},
}
