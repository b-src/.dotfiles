return {
  'akinsho/toggleterm.nvim',
  dir = require("lazy-nix-helper").get_plugin_path("toggleterm.nvim"),
  version = "v2.*",
  opts = {
    open_mapping = [[<c-\>]],
    size = 20,
    hide_humbers = true,
    direction = "horizontal",
    close_on_exit = true,
    auto_scroll = true,
  },
}
