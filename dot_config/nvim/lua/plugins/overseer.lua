return {
	{
		"stevearc/overseer.nvim",
		keys = {
			{ "<leader>T" },
		},
		config = function()
			local h = require("h")

			h.nnoremap("<leader>T", "<CMD>OverseerRun<CR>")
			require("overseer").setup({
				strategy = "toggleterm",
			})
		end,
	},
}
