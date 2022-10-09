return function()
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

	h.nnoremap("<LocalLeader>ii", ":GoImpl ")
	h.nnoremap("<LocalLeader>ie", ":GoIfErr<CR>")
	h.nnoremap("<LocalLeader>ta", ":GoTagAdd ")
end
