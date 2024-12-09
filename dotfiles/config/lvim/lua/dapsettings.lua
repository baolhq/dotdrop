-- DEBUGGING
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
      local current_dir = vim.fn.getcwd()
      -- Extracts the directory name after the final '/'
      local dir_name = current_dir:match("[^/]+$")
      return current_dir .. "/target/debug/" .. dir_name
    end,
    cwd = '${workspaceFolder}',
    stopOnEntry = false,
  },
}
