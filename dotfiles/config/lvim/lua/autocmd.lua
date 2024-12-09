-- AUTOCOMMAND
-- Jump to where you left off
vim.api.nvim_create_autocmd("BufReadPost", {
  callback = function()
    local mark = vim.api.nvim_buf_get_mark(0, '"')
    local line = mark[1]
    if line > 0 and line <= vim.api.nvim_buf_line_count(0) then
      vim.api.nvim_win_set_cursor(0, { line, mark[2] })
    end
  end,
})

