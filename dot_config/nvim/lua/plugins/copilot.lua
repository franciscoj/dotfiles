--# selene: allow(mixed_table)
return {
	{
		"CopilotC-Nvim/CopilotChat.nvim",
		dependencies = {
			{ "nvim-lua/plenary.nvim" },
			{ "ravitemer/mcphub.nvim" },
			{ "zbirenbaum/copilot.lua" },
		},
		keys = {
			{ "<leader>C", "<cmd>CopilotChatToggle<cr>", desc = "Toggle Copilot Chat" },
		},
		build = "make tiktoken",
		opts = {
			temperature = 0.3,
			window = {
				width = 100,
				height = 30,
			},
			headers = {
				user = "👤 You: ",
				assistant = "🤖 Copilot: ",
				tool = "🔧 Tool: ",
			},
			auto_insert_mode = true,
			selection = function(source)
				return require("CopilotChat.select").visual(source) or require("CopilotChat.select").line(source)
			end,
		},
		init = function()
			vim.api.nvim_create_autocmd("BufEnter", {
				pattern = "copilot-*",
				callback = function()
					vim.opt_local.relativenumber = false
					vim.opt_local.number = false
					vim.opt_local.conceallevel = 0
				end,
			})
		end,
	},
	{
		"ravitemer/mcphub.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
		build = "npm install -g mcp-hub@latest",
		opts = {
			extensions = {
				copilotchat = {
					enabled = true,
					convert_tools_to_functions = true, -- Convert MCP tools to CopilotChat functions
					convert_resources_to_functions = true, -- Convert MCP resources to CopilotChat functions
					add_mcp_prefix = false, -- Add "mcp_" prefix to function names
				},
			},
		},
	},
}
