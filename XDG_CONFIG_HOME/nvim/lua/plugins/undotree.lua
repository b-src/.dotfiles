return {
  "mbbill/undotree",
  dir = require("lazy-nix-helper").get_plugin_path("undotree"),
  dependencies = {
    {
      "nvim-lua/plenary.nvim",
      dir = require("lazy-nix-helper").get_plugin_path("plenary.nvim"),
    },
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
