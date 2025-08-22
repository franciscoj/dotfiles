--# selene: allow(mixed_table)

local strategy = function(cmd)
	vim.notify("Running test command: " .. cmd, vim.log.levels.DEBUG)
	require("toggleterm").exec(cmd, 9, 30, nil, nil, "Tests")
end

return {
	{
		"vim-test/vim-test",
		keys = {
			{ "<LocalLeader>tf", "<CMD>TestFile<CR>",    desc = "Run test file" },
			{ "<LocalLeader>tl", "<CMD>TestNearest<CR>", desc = "Run nearest test" },
			{ "<LocalLeader>tr", "<CMD>TestLast<CR>",    desc = "Repeat last test" },
		},
		dependencies = {
			"akinsho/toggleterm.nvim",
		},
		init = function()
			vim.g["test#custom_strategies"] = { franciscoj = strategy }
			vim.g["test#strategy"] = "franciscoj"

			vim.g["test#csharp#runner"] = "dotnettest"
			-- normal verbosity on dotnet test
			vim.g["test#csharp#dotnettest#options"] = "-v:n"
		end,
	},
}
