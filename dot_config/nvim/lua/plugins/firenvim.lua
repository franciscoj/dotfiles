local features = require("franciscoj.lsp.features")

return {
	{
		"glacambre/firenvim",
		enabled = not features.codespaces,
		config = function()
			vim.g.firenvim_config = {
				localSettings = {
					[".*"] = {
						takeover = "never",
					},
				},
			}
		end,
		-- Lazy load firenvim
		-- Explanation: https://github.com/folke/lazy.nvim/discussions/463#discussioncomment-4819297
		-- lazy = not vim.g.started_by_firenvim,
		build = function()
			vim.fn["firenvim#install"](0)
		end,
	},
}
