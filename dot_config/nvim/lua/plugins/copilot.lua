--# selene: allow(mixed_table)
return {
	{
		"yetone/avante.nvim",
		build = "make",
		event = "VeryLazy",
		version = false, -- Never set this value to "*"! Never!
		---@module 'avante'
		---@type avante.Config
		opts = {
			-- add any opts here
			-- for example
			provider = "copilot",
			auto_suggestions_provider = "copilot",
			suggestion = {
				debounce = 1800,
			},
			-- system_prompt as function ensures LLM always has latest MCP server state
			-- This is evaluated for every message, even in existing chats
			system_prompt = function()
				local hub = require("mcphub").get_hub_instance()
				return hub and hub:get_active_servers_prompt() or ""
			end,
			-- Using function prevents requiring mcphub before it's loaded
			custom_tools = function()
				return {
					require("mcphub.extensions.avante").mcp_tool(),
				}
			end,
		},
		dependencies = {
			"nvim-lua/plenary.nvim",
			"MunifTanjim/nui.nvim",
			"hrsh7th/nvim-cmp",   -- autocompletion for avante commands and mentions
			"ibhagwan/fzf-lua",   -- for file_selector provider fzf
			"stevearc/dressing.nvim", -- for input provider dressing
			"folke/snacks.nvim",  -- for input provider snacks
			"nvim-tree/nvim-web-devicons", -- or echasnovski/mini.icons
			"zbirenbaum/copilot.lua", -- for providers='copilot'
			{
				-- Make sure to set this up properly if you have lazy=true
				"MeanderingProgrammer/render-markdown.nvim",
				opts = {
					file_types = { "markdown", "Avante" },
				},
				ft = { "markdown", "Avante" },
			},
			{
				"ravitemer/mcphub.nvim",
				dependencies = {
					"nvim-lua/plenary.nvim",
				},
				build = "npm install -g mcp-hub@latest",
				opts = {
					extensions = {
						avante = {
							make_slash_commands = true, -- make /slash commands from MCP server prompts
						},
					},
				},
			},
		},
	},
}
