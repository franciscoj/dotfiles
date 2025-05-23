--# selene: allow(mixed_table)
return {
	{
		"nvim-treesitter/nvim-treesitter",
		event = { "VeryLazy" },
		dependencies = {
			"nvim-treesitter/nvim-treesitter-textobjects",
			"andymass/vim-matchup",
		},
		build = ":TSUpdateSync",
		config = function()
			require("nvim-treesitter.configs").setup({
				ensure_installed = {
					"bash",
					"c_sharp",
					"comment",
					"dockerfile",
					"eex",
					"elixir",
					"glimmer",
					"go",
					"gotmpl",
					"graphql",
					"heex",
					"html",
					"javascript",
					"jsonc",
					"lua",
					"make",
					"markdown",
					"markdown_inline",
					"query",
					"regex",
					"ruby",
					"rust",
					"scss",
					"terraform",
					"toml",
					"tsx",
					"typescript",
					"vimdoc",
					"yaml",
				},
				highlight = { enable = true },
				indent = { enable = false },
				incremental_selection = {
					enable = true,
					keymaps = {
						init_selection = "<M-CR>",
						scope_incremental = "<CR>",
						node_incremental = "<M-TAB>",
						node_decremental = "<S-TAB>",
					},
				},
				matchup = { enable = true },
				textobjects = {
					enable = true,
					swap = {
						enable = true,
						swap_next = {
							["<localleader>L"] = "@parameter.inner",
							["<localleader>J"] = "@function.outer",
							["<localleader>I"] = "@block.outer",
						},
						swap_previous = {
							["<localleader>H"] = "@parameter.inner",
							["<localleader>K"] = "@function.outer",
							["<localleader>U"] = "@block.outer",
						},
					},
					move = {
						enable = true,
						set_jumps = true, -- whether to set jumps in the jumplist
						goto_next_start = {
							["<localleader>l"] = "@parameter.inner",
							["]f"] = "@function.outer",
							-- ["]b"] = "@block.outer",
							["]]"] = "@class.outer",
						},
						goto_next_end = {
							["<localleader><localleader>l"] = "@parameter.inner",
							["]F"] = "@function.outer",
							-- ["]B"] = "@block.outer",
							["]["] = "@class.outer",
						},
						goto_previous_start = {
							["<localleader>h"] = "@parameter.inner",
							["[f"] = "@function.outer",
							-- ["[b"] = "@block.outer",
							["[["] = "@class.outer",
						},
						goto_previous_end = {
							["<localleader><localleader>h"] = "@parameter.inner",
							["[F"] = "@function.outer",
							-- ["[B"] = "@block.outer",
							["[]"] = "@class.outer",
						},
					},
				},
			})

			-- Use treesitter's folding module
			vim.opt.foldlevel = 5
			vim.opt.foldmethod = "expr"
			vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
		end,
	},
}
