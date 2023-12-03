return {
  'tpope/vim-sleuth',
  dir = require("lazy-nix-helper").get_plugin_path("vim-sleuth"),
  lazy = false,
  -- can't lazy load, no lua setup function to call. have to do config this way I think
  config = function()
  end,
}
