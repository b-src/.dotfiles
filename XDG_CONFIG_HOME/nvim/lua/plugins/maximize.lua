return {
  'declancm/maximize.nvim',
  dir = require("lazy-nix-helper").get_plugin_path("maximize"),
  -- not packaged in nix
  enabled = false,
  keys = {
    {
      "<leader>z",
      function()
        require('maximize').toggle()
      end,
      desc = 'maximize current window',
    },
  },
  opts = {
    settings = {
      -- Note: using the default keymap, but configuring it through lazy to lazy-load the plugin
      default_keymaps = false,
    }
  },
}
