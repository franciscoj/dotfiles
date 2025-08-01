--# selene: allow(mixed_table)
return {
	{
		"stevearc/overseer.nvim",
		keys = {
			{ "<leader>T", "<CMD>OverseerRun<CR>",    desc = "Run Task" },
			{ "<leader>O", "<CMD>OverseerToggle<CR>", desc = "Toggle Overseer" },
		},
		dependencies = {
			"akinsho/toggleterm.nvim",
			"ibhagwan/fzf-lua",
		},
		opts = {
			strategy = { "toggleterm" },
		},
	},
}
