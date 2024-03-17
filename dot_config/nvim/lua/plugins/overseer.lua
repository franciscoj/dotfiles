return {
	{
		"stevearc/overseer.nvim",
		enabled = not vim.g.started_by_firenvim,
		keys = {
			{ "<leader>T", "<CMD>OverseerRun<CR>" },
			{ "<leader>O", "<CMD>OverseerToggle<CR>" },
		},
		dependencies = {
			"akinsho/toggleterm.nvim",
		},
		config = function()
			require("overseer").setup({ strategy = "toggleterm" })
		end,
	},
}
