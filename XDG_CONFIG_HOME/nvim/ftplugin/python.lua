local M = {}

function M.format(args)
  vim.cmd("make black ARGS=" .. args)
end

vim.keymap.set(
  "n",
  "<leader>ff",
  function()
    local filename = vim.api.nvim_buf_get_name(0)
    M.format(filename)
  end,
  { desc = "[F]ormat current [F]ile" }
)

vim.keymap.set(
  "n",
  "<leader>fa",
  function()
    M.format(".")
  end,
  { desc = "[F]ormat [A]ll files" }
)

return M
