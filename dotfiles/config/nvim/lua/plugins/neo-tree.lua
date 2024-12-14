return { -- Neo-tree is a Neovim plugin to browse the file system
	"nvim-neo-tree/neo-tree.nvim",
	version = "*",
	lazy = true,
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
		"MunifTanjim/nui.nvim",
	},
	cmd = "Neotree",
	opts = {
		close_if_last_window = true,
		follow_current_file = {
			enabled = true,
			leave_dirs_open = true,
		},
		sources = { "filesystem", "buffers", "git_status", "document_symbols" },
		sort_case_insensitive = true,
		filesystem = {
			filtered_items = {
				hide_dotfiles = false,
				hide_gitignored = false,
				hijack_netrw_behavior = "open_current",
			},
			window = {
				width = 30,
				mappings = {
					["h"] = function(state)
						local node = state.tree:get_node()
						if node.type == "directory" and node:is_expanded() then
							-- Collapse the directory if it's expaned
							require("neo-tree.sources.filesystem").toggle_directory(state, node)
						else
							-- Otherwise navigate to the parent directory
							local parent_id = node:get_parent_id()
							require("neo-tree.ui.renderer").focus_node(state, parent_id)
						end
					end,
					["l"] = "open",
				},
			},
		},
	},
}
