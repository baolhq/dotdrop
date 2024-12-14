return {
	"OXY2DEV/markview.nvim",
	ft = "markdown",
	dependencies = {
		"nvim-treesitter/nvim-treesitter",
		"nvim-tree/nvim-web-devicons",
	},
	config = function()
		local map = function(keys, func, desc, mode)
			mode = mode or "n"
			vim.keymap.set(mode, keys, func, { desc = desc })
		end

		map("<leader>mt", "<cmd>Markview splitToggle<CR>", "Toggle preview")
		map("<leader>me", "<cmd>Markview enable<CR>", "Enable live preview")
		map("<leader>md", "<cmd>Markview disable<CR>", "Disable live preview")
	end,
}
