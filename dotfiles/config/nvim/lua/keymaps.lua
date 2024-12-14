-- [[ Basic Keymaps ]]

-- Don't repeat yourself
local map = function(keys, func, desc, mode)
	mode = mode or "n"
	vim.keymap.set(mode, keys, func, { desc = desc })
end

-- Remap escape
map("jk", "<Esc>", "Escape", "i")

-- Clear highlights on search when pressing <Esc> in normal mode
map("<Esc>", "<cmd>nohlsearch<CR>", "No highlights")

-- Insert comma and semicolon at the end of line
map("<leader>,", "m`A,<Esc>``", "Insert comma")
map("<leader>;", "m`A;<Esc>``", "Insert semicolon")

-- Better save and quit
map("<leader>w", "<cmd>w<CR>", "Write buffer")
map("<leader>q", "<cmd>q<CR>", "Quit")

-- Split window
map("<leader>sh", "<cmd>split<CR>", "Split horizontally")
map("<leader>ss", "<cmd>vsplit<CR> ", "Split vertically")

-- Keybinds to make split navigation easier.
map("<C-h>", "<C-w><C-h>", "Focus left window")
map("<C-l>", "<C-w><C-l>", "Focus right window")
map("<C-j>", "<C-w><C-j>", "Focus lower window")
map("<C-k>", "<C-w><C-k>", "Focus upper window")

-- [[ Lazy.nvim ]]
map("<leader>Li", "<cmd>Lazy<CR>", "View info")
map("<leader>Lc", "<cmd>Lazy check<CR>", "Check plugins")
map("<leader>Lu", "<cmd>Lazy update<CR>", "Update plugins")
map("<leader>Ld", "<cmd>Lazy debug<CR>", "Debug")
map("<leader>Ll", "<cmd>Lazy log<CR>", "View log")
map("<leader>Lh", "<cmd>Lazy help<CR>", "Help")
map("<leader>Lr", "<cmd>Lazy restore<CR>", "Restore")
map("<leader>Ls", "<cmd>Lazy sync<CR>", "Sync plugins")

-- [[ Rust-related ]]
map("<leader>rr", "<cmd>!cargo run<CR>", "Run (debug)")
map("<leader>rb", "<cmd>!cargo build<CR>", "Build (debug)")
map("<leader>rl", "<cmd>!cargo build --release<CR>", "Build (release)")
map("<leader>rc", "<cmd>!cargo check<CR>", "Cargo check")
map("<leader>rc", "<cmd>!cargo test<CR>", "Run test")
map("<leader>ru", "<cmd>!cargo update<CR>", "Update packages")
map("<leader>ra", function()
	local pkg = vim.fn.input("Package to add: ")
	vim.cmd("!cargo add " .. pkg)
end, "Add package")
map("<leader>rd", function()
	local pkg = vim.fn.input("Package to remove: ")
	vim.cmd("!cargo remove " .. pkg)
end, "Remove package")
