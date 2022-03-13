vim.g.projectionist_heuristics = {
	["go.mod"] = {
		["internal/*.go"] = {
			alternate = "internal/{}_test.go",
			type = "source",
		},
		["internal/*_test.go"] = {
			alternate = "internal/{}.go",
			type = "test",
		},
	},
}
