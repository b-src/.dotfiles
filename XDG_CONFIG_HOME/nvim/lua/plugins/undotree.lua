return {
  "mbbill/undotree",
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  keys = {
    {
      "<leader>ut",
      vim.cmd.UndotreeToggle,
      desc = "View [U]ndo[T]ree",
    },
  },
  config = function()
  end,
}
