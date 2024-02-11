return {
	{
		"nvim-lualine/lualine.nvim",
		enabled = not vim.g.started_by_firenvim,
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
			local WIDTH_LIMIT = 90

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

			-- centers any component that comes after it
			local center = function()
				return "%="
			end

			-- shows the LSP clients that are connected in the current buffer
			local lsp = function()
				local none = "(no LSP)"
				local buf_ft = vim.api.nvim_buf_get_option(0, "filetype")
				local clients = vim.lsp.get_active_clients()
				if next(clients) == nil then
					return none
				end

				local names = {}
				for i, client in ipairs(clients) do
					local filetypes = client.config.filetypes
					if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
						names[i] = client.name
					end
				end

				if #names == 0 then
					return none
				end

				return "(" .. table.concat(names, ", ") .. ")"
			end

			local conditions = {
				buffer_not_empty = function()
					return vim.fn.empty(vim.fn.expand("%:t")) ~= 1
				end,
				hide_in_width = function()
					return vim.fn.winwidth(0) > WIDTH_LIMIT
				end,
				check_git_workspace = function()
					local filepath = vim.fn.expand("%:p:h")
					local gitdir = vim.fn.finddir(".git", filepath .. ";")
					return gitdir and #gitdir > 0 and #gitdir < #filepath
				end,
			}

			line.setup({
				extensions = {
					"fern",
					"fugitive",
					"man",
					"mason",
					"mundo",
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
						{
							"diagnostics",
							sources = { "nvim_diagnostic" },
							symbols = { error = " ", warn = " ", info = " " },
							always_visible = true,
						},
						{ "branch", icon = "" },
						"diff",
						center,
						{
							"filetype",
							cond = conditions.buffer_not_empty,
							padding = { right = 1 },
						},
						{ lsp, padding = { left = 0 } },
					},
					lualine_x = { "searchcount", "enconding", "fileformat", "location", "progress" },
					lualine_y = {},
					lualine_z = {},
				},
				inactive_sections = {
					-- these are to remove the defaults, I use global winbar, so these
					-- are always empty.
					lualine_a = {},
					lualine_b = {},
					lualine_c = {},
					lualine_x = {},
					lualine_y = {},
					lualine_z = {},
				},
				winbar = {
					lualine_a = {},
					lualine_b = {},
					lualine_c = {
						{ "filename", path = 1 },
						{ "diff", symbols = { added = "+", modified = "~", removed = "-" } },
					},
				},
				inactive_winbar = {
					lualine_a = {},
					lualine_b = {},
					lualine_c = {
						{ "filename", path = 1 },
						{ "diff", symbols = { added = "+", modified = "~", removed = "-" } },
					},
				},
			})
		end,
	},
}
