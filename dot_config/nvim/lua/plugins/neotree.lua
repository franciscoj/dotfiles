--# selene: allow(mixed_table)
return {
	{
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v3.x",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons",
			"MunifTanjim/nui.nvim",
		},
		config = function()
			require("neo-tree").setup({
				popup_border_style = "rounded",
				filesystem = {
					hijack_netrw_behavior = "disabled",
					cwd_target = {
						sidebar = "none",
						current = "none",
					},
				},
			})
		end,
	},
}
