return { -- A snazzy buffer line (with tabpage integration)
	"akinsho/bufferline.nvim",
	version = "*",
	dependencies = "nvim-tree/nvim-web-devicons",
	config = function()
		local bufferline = require("bufferline")
		local map = function(keys, func, desc, mode)
			mode = mode or "n"
			vim.keymap.set(mode, keys, func, { desc = desc })
		end

		map("<leader>bb", "<cmd>bprev<CR>", "Previous")
		map("<leader>bn", "<cmd>bnext<CR>", "Next")
		map("<leader>bc", "<cmd>bd<CR>", "Close")
		map("<leader>bj", "<cmd>BufferLinePick<CR>", "Jump to")
		map("<leader>bp", "<cmd>BufferLineTogglePin<CR>", "Toggle pin")
		map("<leader>bx", "<cmd>BufferLineCloseOthers<CR>", "Close others")
		map("<leader>bs", "<cmd>Telescope scope buffers<CR>", "Find buffer")

		bufferline.setup({
			options = {
				-- mode = "tabs",
				diagnostics = "nvim_lsp",
				tab_size = 24,
				offsets = {
					{
						filetype = "neo-tree",
						text = "Explorer",
						highlight = "Directory",
						text_align = "left",
					},
				},
			},
		})
	end,
}
