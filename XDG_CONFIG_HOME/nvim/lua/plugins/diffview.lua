return {
  "sindrets/diffview.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
  },
  opts = {
    enhanced_diff_hl = true,
    keymaps = {
      view = {
        ["\\"] = "<cmd>DiffviewFocusFiles<cr>",
        ["q"] = "<cmd>DiffviewClose<cr>"
      },
      file_history_panel = {
        ["\\"] = "<cmd>DiffviewToggleFiles<cr>",
        ["q"] = "<cmd>DiffviewClose<cr>"
      },
      file_panel = {
        ["\\"] = "<cmd>DiffviewFocusFiles<cr>",
        ["q"] = "<cmd>DiffviewClose<cr>"
      },
    },
  },
  keys = {
    {
      "<leader>dd",
      "<cmd>DiffviewOpen<cr>",
      desc = "Open [D]iffview",
    },
    {
      "<leader>df",
      "<cmd>DiffviewFileHistory %<cr>",
      desc = "[D]iffview [F]ile history",
    },
    {
      "<leader>dh",
      "<cmd>DiffviewFileHistory %<cr>",
      desc = "[D]iffview repo [H]istory",
    },
    {
      "<leader>ds",
      ":DiffviewFileHistory<cr>",
      desc = "[D]iffview [S]election history",
    },
  },
}
