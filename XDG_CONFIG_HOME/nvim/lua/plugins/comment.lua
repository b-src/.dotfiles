return {
  'numToStr/Comment.nvim',
  dir = require("lazy-nix-helper").get_plugin_path("Comment"),
  event = { "BufReadPre", "BufNewFile" },
  opts = {},
}
