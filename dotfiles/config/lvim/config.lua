-- Plugins
lvim.plugins = {
  { "rose-pine/neovim", name = "rose-pine" }
}

-- Options
lvim.colorscheme = "rose-pine"

-- Keybindings
lvim.keys.insert_mode["jk"] = "<esc>"

-- WhichKey mappings
lvim.builtin.which_key.mappings["t"] = {
  name = "+Terminal",
  f = { "<cmd>ToggleTerm<cr>", "Floating terminal" },
  v = { "<cmd>2ToggleTerm size=30 direction=vertical<cr>", "Split vertical" },
  h = { "<cmd>2ToggleTerm size=10 direction=horizontal<cr>", "Split horizontal" },
}
