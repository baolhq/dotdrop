return { -- Blazing fast status line for neovim
	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = {
			options = {
				component_separators = { left = "", right = "" },
				section_separators = { left = "", right = "" },
				ignore_focus = { "neo-tree" },
				globalstatus = true,
			},
			sections = {
				lualine_a = { "mode" },
				lualine_b = { {
					"branch",
					icons_enabled = true,
				}, "diff", "diagnostics" },
				lualine_c = { "filename" },
				lualine_x = { "encoding", "filetype" },
				lualine_y = { "progress" },
				lualine_z = { "location" },
			},
			inactive_sections = {
				lualine_a = {},
				lualine_b = {},
				lualine_c = { "filename" },
				lualine_x = { "location" },
				lualine_y = {},
				lualine_z = {},
			},
			tabline = {},
			winbar = {},
			inactive_winbar = {},
			extensions = { "toggleterm" },
		},
	},
}
