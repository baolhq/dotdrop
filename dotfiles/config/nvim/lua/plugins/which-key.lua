return { -- Useful plugin to show you pending keybinds.
	"folke/which-key.nvim",
	event = "VeryLazy",
	config = function()
		local wk = require("which-key")
		wk.setup({
			-- Disable which-key icons
			icons = {
				mappings = false,
			},

			-- Document existing key chains
			spec = {
				{ "<leader>b", group = "Buffer" },
				{ "<leader>d", group = "Debug" },
				{ "<leader>s", group = "Search" },
				{ "<leader>m", group = "Markview" },
				{ "<leader>l", group = "LSP" },
				{ "<leader>L", group = "Lazy" },
				{ "<leader>r", group = "Rust" },
				{ "<leader>t", group = "Terminal" },
				{ "<leader>/", group = "Toggle comment" },
				{ "<leader>;", hidden = true },
				{ "<leader>,", hidden = true },
			},
		})
	end,
}
