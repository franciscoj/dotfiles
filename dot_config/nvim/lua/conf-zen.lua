return function()
	require("zen-mode").setup({
		window = { width = 100 },
		plugins = {
			gitsigns = { enabled = true },
		},
	})
end
