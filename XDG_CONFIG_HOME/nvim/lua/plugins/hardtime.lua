return {
  "m4xshen/hardtime.nvim",
  dir = require("lazy-nix-helper").get_plugin_path("hardtime.nvim"),
  -- not packaged in nix
  enabled = false,
  dependencies = {
    {
      "MunifTanjim/nui.nvim",
      dir = require("lazy-nix-helper").get_plugin_path("nui.nvim"),
    },
    {
      "nvim-lua/plenary.nvim",
      dir = require("lazy-nix-helper").get_plugin_path("plenary.nvim"),
    },
  },
  opts = {
    enabled = true,
    -- bump this to account for 'jk' -> <Esc> mapping
    max_count = 3,
  },
  event = "VeryLazy",
  keys = {
    {
      "<leader>th",
      function()
        require('hardtime').toggle()
      end,
      desc = '[T]oggle [H]ardtime',
    },
  },
}
