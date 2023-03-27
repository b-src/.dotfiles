local M = {}

function M.format(args)
  vim.cmd("make black ARGS=" .. args)
end

vim.keymap.set(
  "n",
  "<leader>ff",
  function()
    M.format(vim.api.nvim_buf_get_name(0))
  end,
  { desc = "[F]ormat current [F]ile" }
)

return M
