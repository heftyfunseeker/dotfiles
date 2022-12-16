local M = {}

-- Github Browsing shortcut
M.git_browse = function()
  local filename = vim.fn.expand("%")
  local line_number = vim.api.nvim_win_get_cursor(0)[1]
  local command = "!gh browse " .. filename .. ":" .. tostring(line_number)
  vim.cmd(command)
end

return M
