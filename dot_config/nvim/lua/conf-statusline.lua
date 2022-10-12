return function()
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

	-- Config
	local config = {
		options = {
			-- Disable sections and component separators
			component_separators = "",
			section_separators = "",
			theme = {
				-- We are going to use lualine_c an lualine_x as left and
				-- right section. Both are highlighted by c theme .  So we
				-- are just setting default looks o statusline
				normal = { c = { fg = colors.fg, bg = colors.bg } },
				inactive = { c = { fg = colors.fg, bg = colors.bg } },
			},
		},
		sections = {
			-- these are to remove the defaults
			lualine_a = {},
			lualine_b = {},
			lualine_y = {},
			lualine_z = {},
			-- These will be filled later
			lualine_c = {},
			lualine_x = {},
		},
		inactive_sections = {
			-- these are to remove the defaults
			lualine_a = {},
			lualine_b = {},
			lualine_y = {},
			lualine_z = {},
			lualine_c = {},
			lualine_x = {},
		},
	}

	-- Inserts a component in lualine_c at left section
	local function ins_left(component)
		table.insert(config.sections.lualine_c, component)
	end

	-- Inserts a component in lualine_x ot right section
	local function ins_right(component)
		table.insert(config.sections.lualine_x, component)
	end

	ins_left({
		-- mode component
		function()
			-- auto change color according to neovims mode
			local mode_cfg = {
				-- Normal
				n = { color = colors.green, abbr = "N" }, -- normal modes
				no = { color = colors.green, abbr = "N" },
				nov = { color = colors.green, abbr = "N" },
				noV = { color = colors.green, abbr = "N" },
				["no"] = { color = colors.green, abbr = "N" },
				niI = { color = colors.green, abbr = "N" },
				niR = { color = colors.green, abbr = "N" },
				niV = { color = colors.green, abbr = "N" },
				nt = { color = colors.green, abbr = "" }, -- terminal emulator

				-- Visual
				v = { color = colors.blue, abbr = "v" },
				vs = { color = colors.blue, abbr = "v" },
				V = { color = colors.blue, abbr = "V" },
				Vs = { color = colors.blue, abbr = "V" },
				[""] = { color = colors.blue, abbr = "" },
				["s"] = { color = colors.blue, abbr = "" },
				s = { color = colors.orange, abbr = "s" },
				S = { color = colors.orange, abbr = "S" },
				[""] = { color = colors.orange, abbr = "" },

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
		end,
		color = "LualineMode",
		padding = { right = 1, left = 1 },
	})

	ins_left({
		"filename",
		cond = conditions.buffer_not_empty,
		color = { fg = colors.magenta, gui = "bold" },
	})

	ins_left({
		"diagnostics",
		sources = { "nvim_diagnostic" },
		symbols = { error = " ", warn = " ", info = " " },
		diagnostics_color = {
			color_error = { fg = colors.red },
			color_warn = { fg = colors.yellow },
			color_info = { fg = colors.blue },
		},
	})

	ins_left({
		"branch",
		icon = "",
		color = { fg = colors.purple, gui = "bold" },
	})

	ins_left({
		"diff",
		-- Is it me or the symbol for modified is really weird
		symbols = { added = "+", modified = "~", removed = "-" },
		diff_color = {
			added = { fg = colors.green },
			modified = { fg = colors.orange },
			removed = { fg = colors.red },
		},
	})

	-- Insert mid section. You can make any number of sections in neovim :)
	-- for lualine it's any number greater then 2
	ins_left({
		function()
			return "%="
		end,
	})

	ins_left({
		"filetype",
		cond = conditions.buffer_not_empty,
		padding = { right = 0 },
	})

	ins_left({
		-- Lsp servers names .
		function()
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
		end,
		icon = "",
		cond = conditions.hide_in_width,
		color = { fg = colors.fg, gui = "bold" },
		padding = { left = 0 },
	})

	-- Add components to right sections
	ins_right({
		"o:encoding", -- option component same as &encoding in viml
		cond = conditions.hide_in_width,
		color = { fg = colors.green, gui = "bold" },
	})

	ins_right({
		"fileformat",
		fmt = string.upper,
		color = { fg = colors.blue },
	})

	ins_right({ "location", color = { fg = colors.fg, gui = "bold" } })
	ins_right({ "progress", color = { fg = colors.fg, gui = "bold" } })

	-- ins_right({
	-- 	function()
	-- 		return "▊"
	-- 	end,
	-- 	color = { fg = colors.blue },
	-- 	padding = { left = 1 },
	-- })
	--
	-- Now don't forget to initialize lualine
	line.setup(config)
end
