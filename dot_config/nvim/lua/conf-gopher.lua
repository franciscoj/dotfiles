return function()
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
end
