return {
	{
		"stevearc/overseer.nvim",
		keys = {
			{ "<leader>T" },
			{ "<leader>O" },
		},
		config = function()
			local h = require("h")

			h.nnoremap("<leader>T", "<CMD>OverseerRun<CR>")
			h.nnoremap("<leader>O", "<CMD>OverseerToggle<CR>")
			require("overseer").setup({
				strategy = "toggleterm",
			})
		end,
	},
}
