-- WHICHKEY MAPPINGS

-- Disable default LunarVim mappings
lvim.builtin.which_key.mappings["p"] = {}
lvim.builtin.which_key.mappings["L"] = {}
lvim.builtin.which_key.mappings["T"] = {}

lvim.builtin.which_key.mappings["t"] = {
  name = "+Terminal",
  f = { "<cmd>ToggleTerm<cr>", "Floating terminal" },
  v = { "<cmd>2ToggleTerm size=40 direction=vertical<cr>", "Split vertical" },
  h = { "<cmd>2ToggleTerm size=10 direction=horizontal<cr>", "Split horizontal" },
}

-- Fix LunarVim find files not showing preview
lvim.builtin.which_key.mappings["f"] = {
  "<cmd>:Telescope find_files<CR>", "Find file"
}

-- Fix NvimTree not closing on quit
lvim.builtin.which_key.mappings["q"] = {
  "<cmd>:qa<CR>", "Quit"
}

lvim.builtin.which_key.mappings["r"] = {
  name = "+Rust",
  r = { "<cmd>:!cargo run<CR>", "Run (Debug)" },
  b = { "<cmd>:!cargo build<CR>", "Build (Debug)" },
  l = { "<cmd>:!cargo build<CR>", "Build (Release)" },
  c = { "<cmd>:!cargo check<CR>", "Cargo Check" },
  u = { "<cmd>:!cargo update<CR>", "Update Packages" },
  a = {
    function()
      local pkg = vim.fn.input('Package to add: ')
      vim.cmd(":!cargo add " .. pkg)
    end,
    "Add Package"
  },
  m = {
    function()
      local pkg = vim.fn.input('Package to remove: ')
      vim.cmd(":!cargo remove " .. pkg)
    end,
    "Remove Package"
  },
}
