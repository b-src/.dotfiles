return {
  "folke/todo-comments.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim"
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
