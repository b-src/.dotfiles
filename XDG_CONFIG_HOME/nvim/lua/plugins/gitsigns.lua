return {
  'lewis6991/gitsigns.nvim',
  dir = require("lazy-nix-helper").get_plugin_path("gitsigns.nvim"),
  lazy = "true",
  opts = {
    signs = {
      add = { text = '+' },
      change = { text = '~' },
      delete = { text = '_' },
      topdelete = { text = '‾' },
      changedelete = { text = '~' },
    },
  },
}
