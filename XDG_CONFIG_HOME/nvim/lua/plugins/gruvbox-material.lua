return {
  'sainnhe/gruvbox-material',
  dir = require("lazy-nix-helper").get_plugin_path("gruvbox-material"),
  lazy = false,
  priority = 1000,
  config = function()
    vim.cmd([[colorscheme gruvbox-material]])
  end,
}
