--# selene: allow(mixed_table)
return {
	{
		"nvim-lualine/lualine.nvim",
		event = { "BufRead", "BufNewFile", "VimEnter" },
		dependencies = {
			"catppuccin",
		},
		config = function()
			local line = require("lualine")
			local theme_colors = require("catppuccin.palettes").get_palette()
			-- Colors are extracted from the catppuccin theme API
			local colors = {
				fg = theme_colors.subtext1,
				bg = theme_colors.surface0,
				blue = theme_colors.sky,
				green = theme_colors.green,
				orange = theme_colors.peach,
				pink = theme_colors.pink,
				purple = theme_colors.lavender,
				red = theme_colors.red,
				yellow = theme_colors.yellow,
			}
			-- component for abbreviated mode.
			local mode = function()
				-- auto change color according to neovims mode
				local mode_cfg = {
					-- Normal
					n = { color = colors.green, abbr = "N" }, -- normal modes
					no = { color = colors.green, abbr = "N" },
					nov = { color = colors.green, abbr = "N" },
					noV = { color = colors.green, abbr = "N" },
					niI = { color = colors.green, abbr = "N" },
					niR = { color = colors.green, abbr = "N" },
					niV = { color = colors.green, abbr = "N" },
					nt = { color = colors.green, abbr = "" }, -- terminal emulator

					-- Visual
					v = { color = colors.blue, abbr = "v" },
					vs = { color = colors.blue, abbr = "v" },
					V = { color = colors.blue, abbr = "V" },
					Vs = { color = colors.blue, abbr = "V" },
					s = { color = colors.orange, abbr = "s" },
					S = { color = colors.orange, abbr = "S" },

					-- Insert
					i = { color = colors.red, abbr = "I" },
					ic = { color = colors.yellow, abbr = "I" },
					ix = { color = colors.yellow, abbr = "I" },

					-- Replace
					R = { color = colors.purple, abbr = "R" },
					Rv = { color = colors.purple, abbr = "R" },
					Rc = { color = colors.purple, abbr = "R" },
					Rx = { color = colors.purple, abbr = "R" },
					Rvc = { color = colors.purple, abbr = "R" },
					Rvx = { color = colors.purple, abbr = "R" },

					-- Other modes
					c = { color = colors.pink, abbr = "c" },
					cv = { color = colors.red, abbr = "cv" },
					r = { color = colors.blue, abbr = "r" },
					rm = { color = colors.blue, abbr = "rm" },
					["r?"] = { color = colors.blue, abbr = "r?" },
					["!"] = { color = colors.red, abbr = "!" },
					[""] = { color = colors.red, abbr = "C" }, -- Command mode
					t = { color = colors.red, abbr = "" }, -- terminal mode
				}
				local cfg = mode_cfg[vim.fn.mode()]
				vim.api.nvim_command("hi! LualineMode guifg=" .. cfg.color .. " guibg=" .. colors.bg .. " gui=bold")
				return cfg.abbr
			end

			line.setup({
				extensions = {
					"fugitive",
					"fzf",
					"lazy",
					"man",
					"mason",
					"mundo",
					"neo-tree",
					"oil",
					"overseer",
					"quickfix",
					"toggleterm",
					"trouble",
				},
				options = {
					-- Disable sections and component separators
					component_separators = "",
					section_separators = "",
					theme = "catppuccin",
					global_status = true,
				},
				sections = {
					-- these are to remove the defaults
					lualine_a = {
						{ mode, color = "LualineMode", padding = { right = 1, left = 1 } },
					},
					lualine_b = {},
					lualine_c = {
						{ "branch", icon = "" },
						{ "diff", symbols = { added = "+", modified = "~", removed = "-" } },
						{
							"diagnostics",
							sources = { "nvim_diagnostic" },
						},
						{ "filename", path = 1 },
						{ "filetype", icon_only = true },
					},
					lualine_x = {
						{ "lsp_status", ignore_lsp = { "copilot" } },
						"encoding",
						"fileformat",
						"location",
						"progress",
					},
					lualine_y = {},
					lualine_z = {},
				},
			})
		end,
	},
}
