local M = {}

function M.format()
  local filename = vim.api.nvim_buf_get_name(0)
  vim.cmd("make black ARGS=" .. filename)
end

vim.keymap.set("n", "<leader>ff", M.format, { desc = "[F]ormat file" })

return M
