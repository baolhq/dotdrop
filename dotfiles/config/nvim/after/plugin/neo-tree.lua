-- after/plugin/neo-tree.lua
--
-- Toggle neo-tree, I don't use :Neotree toggle
-- because it doesn't follow current file
vim.keymap.set("n", "<leader>e", function()
	local manager = require("neo-tree.sources.manager")
	local renderer = require("neo-tree.ui.renderer")

	local state = manager.get_state("filesystem")
	local neo_tree_open = renderer.window_exists(state)

	-- Toggle Neo-tree
	if neo_tree_open then
		vim.cmd("Neotree close")
	else
		vim.cmd("Neotree reveal")
	end
end, { desc = "Toggle neotree" })
