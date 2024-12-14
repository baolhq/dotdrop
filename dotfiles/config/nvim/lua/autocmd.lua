-- autocmd.lua

-- Open neotree instead of netrw
vim.api.nvim_create_autocmd("VimEnter", {
	callback = function(data)
		-- Check if the argument is a directory
		local isdir = vim.fn.isdirectory(data.file) == 1

		if isdir then
			-- Change to the directory
			vim.cmd.cd(data.file)

			-- Open Neo-tree
			vim.cmd("Neotree filesystem")
		end
	end,
})

-- When open a recently closed file, jump back to
-- the last cursor position
vim.api.nvim_create_autocmd("BufReadPost", {
	callback = function()
		local last_pos = vim.fn.line([['"]])
		if last_pos > 0 and last_pos <= vim.fn.line("$") then
			vim.cmd('normal! g`"')
		end
	end,
})

-- Highlight when yanking (copying) text
vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking (copying) text",
	group = vim.api.nvim_create_augroup("highlight-yank", { clear = true }),
	callback = function()
		vim.highlight.on_yank({ timeout = 100 })
	end,
})
