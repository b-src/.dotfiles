return {
  'numToStr/Comment.nvim',
  dir = require("lazy-nix-helper").get_plugin_path("comment.nvim"),
  event = { "BufReadPre", "BufNewFile" },
  opts = {},
}
