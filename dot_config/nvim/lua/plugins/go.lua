return {
	{
		"olexsmir/gopher.nvim",
		enabled = not vim.g.started_by_firenvim,
		ft = "go",
		config = function()
			local h = require("h")
			local gopher = require("gopher")
			local mason = require("franciscoj.mason")

			mason.ensure_tools({
				{ name = "gomodifytags" },
				{ name = "impl" },
				{ name = "iferr" },
			})

			gopher.setup({
				commands = {
					gomodifytags = mason.get_path("gomodifytags"),
					impl = mason.get_path("impl"),
					iferr = mason.get_path("iferr"),
				},
			})

			h.nnoremap("<LocalLeader>ie", ":GoIfErr<CR>")
			vim.keymap.set("n", "<LocalLeader>ii", ":GoImpl ")
			vim.keymap.set("n", "<LocalLeader>ta", ":GoTagAdd ")
		end,
	},
}
