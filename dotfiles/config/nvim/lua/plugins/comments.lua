return { -- Useful for toggle comment
	{
		"numToStr/Comment.nvim",
		event = "VeryLazy",
		config = function()
			require("Comment").setup({
				toggler = {
					line = "<leader>/", -- Normal mode line comment toggle
				},
				mappings = {
					basic = true, -- Enable basic mappings (gcc, gbc)
					extra = false, -- Disable extra mappings
				},
			})

			vim.keymap.del("n", "gc")
			vim.keymap.del("n", "gb")
			vim.keymap.del("n", "gcc")
			vim.keymap.del("n", "gbc")

			-- Visual mode keymap for toggling comment
			vim.keymap.set("v", "<leader>/", function()
				local api = require("Comment.api")
				local esc = vim.api.nvim_replace_termcodes("<Esc>", true, false, true)

				vim.api.nvim_feedkeys(esc, "nx", false)
				api.toggle.linewise(vim.fn.visualmode())
			end, { desc = "Toggle comment" })
		end,
	},
}
