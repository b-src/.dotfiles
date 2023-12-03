return {
  "folke/todo-comments.nvim",
  dir = require("lazy-nix-helper").get_plugin_path("todo-comments"),
  dependencies = {
    {
      "nvim-lua/plenary.nvim",
      dir = require("lazy-nix-helper").get_plugin_path("plenary"),
    },
  },
  event = { "BufReadPre", "BufNewFile" },
  keys = {
    {
      "]t",
      function ()
        require("todo-comments").jump_next()
      end,
      desc = "Jump to next [T]ODO comment",
    },
    {
      "[t",
      function ()
        require("todo-comments").jump_prev()
      end,
      desc = "Jump to previous [T]ODO comment",
    },
  },
  opts = {},
}
