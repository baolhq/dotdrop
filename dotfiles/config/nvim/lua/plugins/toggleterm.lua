return { -- Toggle multiple terminals during an editing session
	"akinsho/toggleterm.nvim",
	event = "VeryLazy",
	version = "*",
	config = function()
		local tt = require("toggleterm")
		local map = function(keys, func, desc, mode)
			mode = mode or "n"
			vim.keymap.set(mode, keys, func, { desc = desc })
		end

		-- ToggleTerm keymaps
		map("<leader>th", "<cmd>ToggleTerm<CR>", "Toggle horizontal")
		map("<leader>tv", "<cmd>ToggleTerm direction=vertical<CR>", "Toggle vertical")
		map("<leader>tf", "<cmd>ToggleTerm direction=float<CR>", "Open float")
		map("<leader>ta", "<cmd>ToggleTermToggleAll<CR>", "Toggle all")
		map("<Esc>", "<C-\\><C-n>", "Exit terminal mode", "t")

		tt.setup({
			size = function(term)
				if term.direction == "horizontal" then
					return 12
				elseif term.direction == "vertical" then
					return vim.o.columns * 0.25
				end
			end,
			float_opts = {
				border = "curved",
				winblend = 1,
			},
			shade_terminals = false,
		})
	end,
}
