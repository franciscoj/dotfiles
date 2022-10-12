return function()
	local h = require("h")
	local bufferline = require("bufferline")
	bufferline.setup({
		options = {
			diagnostics = "nvim_lsp",
			show_buffer_close_icons = false,
			show_close_icon = false,
			diagnostics_indicator = function(_count, _level, diagnostics_dict, _context)
				local diagnostics = " "

				for level, count in pairs(diagnostics_dict) do
					local symbol = level == "error" and " " or (level == "warning" and " " or " ")

					diagnostics = diagnostics .. count .. symbol
				end

				return diagnostics
			end,
		},
	})

	h.nnoremap("<leader>b", bufferline.pick_buffer)
	h.nnoremap("<leader>bd", "<cmd>:bdelete<cr>")
end
