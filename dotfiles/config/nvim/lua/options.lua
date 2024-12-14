-- [[ Setting options ]]
--
-- Make relative line numbers default
vim.opt.number = true
vim.opt.relativenumber = true

-- Enable mouse mode, can be useful for resizing splits for example!
vim.opt.mouse = "a"

-- Don't show the mode, since it's already in the status line
vim.opt.showmode = false

-- Tab related
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.smarttab = true

-- Setup clipboard for neovim
-- WARN: Doesn't play well with WSL
--
-- vim.schedule(function()
-- vim.opt.clipboard = "unnamedplus"
-- end)

-- Enable break indent
vim.opt.breakindent = true

-- Save undo history
vim.opt.undofile = true

-- Case-insensitive searching UNLESS \C or one or more capital letters in the search term
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Keep signcolumn on by default
vim.opt.signcolumn = "yes"

-- Decrease update time
vim.opt.updatetime = 250

-- Decrease mapped sequence wait time
-- Displays which-key popup sooner
vim.opt.timeoutlen = 300

-- Configure how new splits should be opened
vim.opt.splitright = true
vim.opt.splitbelow = true

-- Preview substitutions live, as you type!
vim.opt.inccommand = "split"

-- Show which line your cursor is on
vim.opt.cursorline = true

-- Minimal number of screen lines to keep above and below the cursor.
vim.opt.scrolloff = 20

-- Diable line wrapping
vim.opt.wrap = false

-- Disable netrw to use neo-tree instead
vim.g.loaded_netrwPlugin = 1
vim.g.loaded_netrw = 1
