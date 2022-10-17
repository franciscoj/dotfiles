return function()
	local h = require("h")

	require("zen-mode").setup({
		window = { width = 100 },
		plugins = {
			gitsigns = { enabled = true },
		},
	})

	h.nnoremap("<leader>zz", "<cmd>ZenMode<cr>")
end
