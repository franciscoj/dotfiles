--# selene: allow(mixed_table)
return {
	{
		"stevearc/overseer.nvim",
		keys = {
			{ "<leader>T", "<CMD>OverseerRun<CR>", desc = "Run Task" },
			{ "<leader>O", "<CMD>OverseerToggle<CR>", desc = "Toggle Overseer" },
		},
		dependencies = {
			"akinsho/toggleterm.nvim",
			"nvim-telescope/telescope.nvim",
		},
		config = function()
			require("overseer").setup({ strategy = {
				"toggleterm",
				direction = "tab",
			} })
		end,
	},
}
