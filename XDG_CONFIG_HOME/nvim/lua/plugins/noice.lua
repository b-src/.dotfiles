return {
  "folke/noice.nvim",
  dir = require("lazy-nix-helper").get_plugin_path("noice"),
  enabled = false,
  event = "VeryLazy",
  dependencies = {
    {
      "MunifTanjim/nui.nvim",
      dir = require("lazy-nix-helper").get_plugin_path("nui"),
    },
    {
      "rcarriga/nvim-notify",
      dir = require("lazy-nix-helper").get_plugin_path("nvim-notify"),
    }
  },
  opts = {
    lsp = {
      progress = { enabled = true },
      override = {
        ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
        ["vim.lsp.util.stylize_markdown"] = true,
        ["cmp.entry.get_documentation"] = true,
      },
    },
    routes = {
      {
        filter = {
          event = "msg_show",
          any = {
            { find = "%d+L, %d+B" },
            { find = "; after #%d+" },
            { find = "; before #%d+" },
          },
        },
        view = "mini",
      },
    },
    presets = {
      bottom_search = true,
      command_palette = true,
      long_message_to_split = true,
      inc_rename = true,
    },
    views = {
      cmdline_popup = {
        position = {
          row = "50%",
          col = "50%",
        },
        size = {
          width = 60,
          height = "auto",
        },
      },
    },
  },
  -- stylua: ignore
  keys = {
    { "<S-Enter>", function() require("noice").redirect(vim.fn.getcmdline()) end, mode = "c", desc = "Redirect Cmdline" },
    { "<leader>ml", function() require("noice").cmd("last") end, desc = "Noice Last Message" },
    { "<leader>mh", function() require("noice").cmd("history") end, desc = "Noice History" },
    { "<leader>ma", function() require("noice").cmd("all") end, desc = "Noice All" },
    { "<leader>md", function() require("noice").cmd("dismiss") end, desc = "Dismiss All" },
    { "<c-f>", function() if not require("noice.lsp").scroll(4) then return "<c-f>" end end, silent = true, expr = true, desc = "Scroll forward", mode = { "i", "n", "s" } },
    { "<c-b>", function() if not require("noice.lsp").scroll(-4) then return "<c-b>" end end, silent = true, expr = true, desc = "Scroll backward", mode = { "i", "n", "s" } },
  },
}
