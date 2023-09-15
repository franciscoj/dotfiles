return {
	{
		"mfussenegger/nvim-lint",
		dependencies = { "williamboman/mason.nvim" },
		config = function()
			local mason = require("franciscoj.mason")
			mason.ensure_tools({
				{ name = "golangci-lint", version = "v1.53.3" },
				{ name = "luacheck" },
			})

			require("lint").linters.luacheck.cmd = mason.get_path("luacheck")
			require("lint").linters_by_ft = {
				lua = { "luacheck" },
			}

			vim.api.nvim_create_autocmd({ "BufWritePost" }, {
				callback = function()
					require("lint").try_lint()
				end,
			})
		end,
	},
}
