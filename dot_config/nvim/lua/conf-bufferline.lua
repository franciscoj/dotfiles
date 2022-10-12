return function()
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
			custom_filter = function(bufnr)
				local filetype = vim.bo[bufnr].filetype

				-- Hide both neoterm and netrw. For some reason filetype for netrw is empty.
				if filetype == "neoterm" or filetype == "" or filetype == "fugitive" then
					return false
				end

				return true
			end,
		},
	})

	vim.keymap.set("n", "<leader>b", bufferline.pick_buffer)
	vim.keymap.set("n", "<leader>bd", "<cmd>:bdelete<cr>")
end
