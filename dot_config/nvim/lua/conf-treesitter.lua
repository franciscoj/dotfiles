require("nvim-treesitter.configs").setup({
	ensure_installed = {
		"bash",
		"comment",
		"dockerfile",
		"go",
		"html",
		"javascript",
		"jsonc",
		"lua",
		"make",
		"ruby",
		"rust",
		"scss",
		"toml",
		"tsx",
		"typescript",
		"yaml",
	},
	highlight = { enable = true },
	indent = { enable = true },
	incremental_selection = { enable = true },
	textobjects = {
		enable = true,
		swap = {
			enable = true,
			swap_next = {
				["<localleader>L"] = "@parameter.inner",
				["<localleader>J"] = "@function.outer",
			},
			swap_previous = {
				["<localleader>H"] = "@parameter.inner",
				["<localleader>K"] = "@function.outer",
			},
		},
		move = {
			enable = true,
			set_jumps = true, -- whether to set jumps in the jumplist
			goto_next_start = {
				["<localleader>l"] = "@parameter.inner",
				["]m"] = "@function.outer",
				["]]"] = "@class.outer",
			},
			goto_next_end = {
				["<localleader><localleader>l"] = "@parameter.inner",
				["]M"] = "@function.outer",
				["]["] = "@class.outer",
			},
			goto_previous_start = {
				["<localleader>h"] = "@parameter.inner",
				["[m"] = "@function.outer",
				["[["] = "@class.outer",
			},
			goto_previous_end = {
				["<localleader><localleader>h"] = "@parameter.inner",
				["[M"] = "@function.outer",
				["[]"] = "@class.outer",
			},
		},
	},
})
