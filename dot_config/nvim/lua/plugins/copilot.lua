--# selene: allow(mixed_table)

-- safely load json5 and use it to parse json in case it exists.
local parse_json = function(str, opts)
	local ok, json5 = pcall(require, "json5")
	if ok then
		return json5.parse(str, opts)
	else
		return vim.json.decode(str, opts)
	end
end

local width = function()
	local cols = vim.o.columns

	if cols >= 200 then
		return 100
	end

	return 80
end

return {
	{
		"CopilotC-Nvim/CopilotChat.nvim",
		dependencies = {
			{ "nvim-lua/plenary.nvim" },
			{ "ravitemer/mcphub.nvim" },
			{
				"zbirenbaum/copilot.lua",
				cmd = "Copilot",
				event = "InsertEnter",
				opts = {
					suggestion = { enabled = false },
					panel = { enabled = false },
					filetypes = {
						markdown = true,
						help = true,
					},
				},
			},
		},
		keys = {
			{ "<leader>C", "<cmd>CopilotChatToggle<cr>", desc = "Toggle Copilot Chat" },
		},
		build = "make tiktoken",
		opts = {
			temperature = 0.3,
			window = {
				width = width(),
			},
			headers = {
				user = "👤 You: ",
				assistant = "🤖 Copilot: ",
				tool = "🔧 Tool: ",
			},
			auto_insert_mode = true,
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
			{
				"Joakker/lua-json5",
				build = "./install.sh",
			},
		},
		build = "npm install -g mcp-hub@latest",
		config = function()
			require("mcphub").setup({
				json_decode = parse_json,
				extensions = {
					copilotchat = {
						enabled = true,
						convert_tools_to_functions = true, -- Convert MCP tools to CopilotChat functions
						convert_resources_to_functions = true, -- Convert MCP resources to CopilotChat functions
						add_mcp_prefix = false, -- Add "mcp_" prefix to function names
					},
				},
			})
		end,
	},
}
