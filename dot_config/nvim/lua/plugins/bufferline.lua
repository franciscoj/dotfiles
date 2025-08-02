--# selene: allow(mixed_table)
return {
	{
		"akinsho/bufferline.nvim",
		event = "VeryLazy",
		config = function()
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

			vim.keymap.set("n", "<leader>b", "<cmd>BufferLinePick<cr>", { desc = "Buffer pick" })
			vim.keymap.set("n", "<leader>bd", "<cmd>BufferLinePickClose<cr>", { desc = "Buffer delete" })
			vim.keymap.set("n", "]b", "<cmd>BufferLineCycleNext<cr>", { desc = "Buffer next" })
			vim.keymap.set("n", "[b", "<cmd>BufferLineCyclePrev<cr>", { desc = "Buffer prev" })
		end,
	},
}
