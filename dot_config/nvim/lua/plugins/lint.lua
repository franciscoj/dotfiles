return {
	{
		"mfussenegger/nvim-lint",
		dependencies = { "williamboman/mason.nvim" },
		config = function()
			local features = require("franciscoj.lsp.features")
			local mason = require("franciscoj.mason")
			local ensure = {
				{ name = "luacheck" },
			}

			if features.go then
				ensure.insert({ name = "golangci-lint", version = "v1.53.3" })
			end

			mason.ensure_tools(ensure)

			require("lint").linters.luacheck.cmd = mason.get_path("luacheck")

			if features.go then
				require("lint").linters.golangcilint.cmd = mason.get_path("golangci-lint")
			end

			require("lint").linters_by_ft = {
				eslint = { "eslint" },
				go = { "golangcilint" },
				lua = { "luacheck" },
				ruby = { "rubocop" },
			}

			vim.api.nvim_create_autocmd({ "BufWritePost" }, {
				callback = function()
					require("lint").try_lint()
				end,
			})
		end,
	},
}
