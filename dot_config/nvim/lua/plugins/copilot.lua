--# selene: allow(mixed_table)
return {
	{
		"zbirenbaum/copilot.lua",
		cmd = "Copilot",
		event = "InsertEnter",
		opts = {
			suggestion = { enabled = false },
			panel = { enabled = false },
		},
	},
	{
		"CopilotC-Nvim/CopilotChat.nvim",
		dependencies = {
			{ "zbirenbaum/copilot.lua" },
			{ "nvim-lua/plenary.nvim" },
			{ "ibhagwan/fzf-lua" },
		},
		build = "make tiktoken",
		opts = {
			highlight_headers = false,
			separator = "---",
			error_header = "> [!ERROR] Error",

		},
	},
	{
		"MeanderingProgrammer/render-markdown.nvim",
		dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-tree/nvim-web-devicons" },
		---@module 'render-markdown'
		---@type render.md.UserConfig
		opts = {
			file_types = { "markdown", "copilot-chat" },
		},
	},
}
