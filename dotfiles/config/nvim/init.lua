-- Set <space> as the leader key
vim.g.mapleader = " "

-- Nerd font is required
vim.g.have_nerd_font = true

-- Sourcing other configs
require("options")
require("keymaps")
require("lazy-bootstrap")
require("lazy-plugins")
require("autocmd")
