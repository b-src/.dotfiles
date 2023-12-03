return {
  'phaazon/mind.nvim',
  dir = require("lazy-nix-helper").get_plugin_path("mind"),
  branch = 'v2.2',
  dependencies = {
    {
      'nvim-lua/plenary.nvim',
      dir = require("lazy-nix-helper").get_plugin_path("plenary"),
    },
  },
  config = true
}
