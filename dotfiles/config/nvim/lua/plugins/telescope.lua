return { -- Fuzzy finder (files, lsp, etc)
	{
		"nvim-telescope/telescope.nvim",
		event = "VeryLazy",
		branch = "0.1.x",
		dependencies = {
			"nvim-lua/plenary.nvim",
			{
				"nvim-telescope/telescope-fzf-native.nvim",
				build = "make",
				cond = function()
					return vim.fn.executable("make") == 1
				end,
			},
			{ "nvim-telescope/telescope-ui-select.nvim" },
			{ "nvim-tree/nvim-web-devicons", enabled = vim.g.have_nerd_font },
		},
		config = function()
			-- See `:help telescope.actions`
			local actions = require("telescope.actions")

			require("telescope").setup({
				defaults = {
					mappings = {
						i = {
							["<Esc>"] = actions.close,
						},
					},
				},
				pickers = {
					command_history = {
						theme = "dropdown",
						previewer = false,
					},
				},
				extensions = {
					["ui-select"] = {
						require("telescope.themes").get_dropdown(),
					},
				},
			})

			-- Make telescope respect global theme, see `:hi TelescopeBorder`
			local colors = require("rose-pine") -- Adjust this if your colors are in a specific module.
			vim.api.nvim_set_hl(0, "TelescopeBorder", { fg = colors.border, bg = colors.background })
			vim.api.nvim_set_hl(0, "TelescopePromptBorder", { fg = colors.border, bg = colors.background })
			vim.api.nvim_set_hl(0, "TelescopeResultsBorder", { fg = colors.border, bg = colors.background })
			vim.api.nvim_set_hl(0, "TelescopePreviewBorder", { fg = colors.border, bg = colors.background })

			-- Enable Telescope extensions if they are installed
			pcall(require("telescope").load_extension, "fzf")
			pcall(require("telescope").load_extension, "ui-select")

			-- See `:help telescope.builtin`
			local builtin = require("telescope.builtin")
			vim.keymap.set("n", "<leader>sc", builtin.command_history, { desc = "Command history" })
			vim.keymap.set("n", "<leader>sh", builtin.help_tags, { desc = "Help" })
			vim.keymap.set("n", "<leader>sk", builtin.keymaps, { desc = "Keymaps" })
			vim.keymap.set("n", "<leader>sf", builtin.find_files, { desc = "Files" })
			vim.keymap.set("n", "<leader>sr", builtin.resume, { desc = "Recent" })
			vim.keymap.set("n", "<leader>sg", builtin.live_grep, { desc = "Live grep" })
			vim.keymap.set("n", "<leader>sj", builtin.buffers, { desc = "Jump to" })
			vim.keymap.set("n", "<leader>sd", builtin.diagnostics, { desc = "Diagnostics" })
			vim.keymap.set("n", "<leader>sb", builtin.current_buffer_fuzzy_find, { desc = "Current buffer" })
		end,
	},
}
