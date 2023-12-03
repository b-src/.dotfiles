return {
  "ThePrimeagen/harpoon",
  dir = require("lazy-nix-helper").get_plugin_path("harpoon"),
  dependencies = {
    {
      "nvim-lua/plenary.nvim",
      dir = require("lazy-nix-helper").get_plugin_path("plenary.nvim"),
    },
  },
  keys = {
      {
        "<leader>a",
        function()
          require("harpoon.mark").add_file()
        end,
        desc = '[A]dd a file to harpoon',
      },
      {
        "<leader>h",
        function()
          require("harpoon.ui").toggle_quick_menu()
        end,
        desc = '[A]dd a file to harpoon',
      },
      {
        "<leader>j1",
        function()
          require("harpoon.ui").nav_file(1)
        end,
        desc = '[J]ump to the [1]st harpoon mark',
      },
      {
        "<leader>j2",
        function()
          require("harpoon.ui").nav_file(2)
        end,
        desc = '[J]ump to the [2]nd harpoon mark',
      },
      {
        "<leader>j3",
        function()
          require("harpoon.ui").nav_file(3)
        end,
        desc = '[J]ump to the [3]rd harpoon mark',
      },
      {
        "<leader>j4",
        function()
          require("harpoon.ui").nav_file(4)
        end,
        desc = '[J]ump to the [4]th harpoon mark',
      },
  },
}
