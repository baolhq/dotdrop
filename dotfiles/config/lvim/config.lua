-- Plugins
lvim.plugins = {
  { "rose-pine/neovim", name = "rose-pine" },
}

-- Options
lvim.colorscheme = "rose-pine"

-- Keybindings
lvim.keys.insert_mode["jk"] = "<esc>"

-- WhichKey mappings
lvim.builtin.which_key.mappings["t"] = {
  name = "+Terminal",
  f = { "<cmd>ToggleTerm<cr>", "Floating terminal" },
  v = { "<cmd>2ToggleTerm size=40 direction=vertical<cr>", "Split vertical" },
  h = { "<cmd>2ToggleTerm size=10 direction=horizontal<cr>", "Split horizontal" },
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

-- Debugging with nvim-dap
local dap = require('dap')

dap.adapters.codelldb = {
  type = 'server',
  port = "${port}",
  executable = {
    command = '/usr/bin/codelldb',
    args = { "--port", "${port}" },
  }
}

dap.configurations.rust = {
  {
    name = "Rust debug",
    type = "codelldb",
    request = "launch",
    program = function()
      return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/target/debug/', 'file')
    end,
    cwd = '${workspaceFolder}',
    stopOnEntry = false,
  },
}
