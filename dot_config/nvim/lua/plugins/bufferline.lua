return {
	{
		"akinsho/bufferline.nvim",
		enabled = not vim.g.started_by_firenvim,
		event = "VeryLazy",
		config = function()
			local h = require("h")
			local bufferline = require("bufferline")
			bufferline.setup({
				options = {
					separator_style = "thick",
					diagnostics = "nvim_lsp",
					show_buffer_close_icons = false,
					show_close_icon = false,
					diagnostics_indicator = function(_count, _level, diagnostics, _context)
						local txt = " "

						for level, count in pairs(diagnostics) do
							local symbol = level == "error" and " " or (level == "warning" and " " or " ")

							txt = txt .. count .. symbol
						end

						return txt
					end,
				},
			})

			h.nnoremap("<leader>b", bufferline.pick_buffer)
			h.nnoremap("<leader>bd", "<cmd>BufferLinePickClose<cr>")
		end,
	},
}
