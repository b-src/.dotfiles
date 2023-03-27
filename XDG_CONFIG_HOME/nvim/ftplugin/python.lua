local M = {}

function M.format(args)
  vim.cmd("make black BLACK_ARGS=" .. args)
end

function M.lint(args)
  local errorformat="%f:%l:%c:\\ %t%n\\ %m"
  vim.cmd("setlocal errorformat=" .. errorformat)
  vim.cmd("make flake FLAKE_ARGS=" .. args)
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

-- vim.keymap.set(
--   "n",
--   "<leader>fl",
--   function()
--     M.lint("lint")
--   end,
--   { desc = "[L]int all files" }
-- )

return M
