return {
  "ThePrimeagen/harpoon",
  branch = "harpoon2",
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  config = function()
    require("harpoon"):setup({
      settings = {
        save_on_toggle = true,
      },
    })
  end,
  keys = {
      {
        "<leader>a",
        function()
          require("harpoon"):list():append()
        end,
        desc = '[A]dd a file to harpoon',
      },
      {
        "<leader>h",
        function()
          require("harpoon").ui:toggle_quick_menu(require("harpoon"):list())
        end,
        desc = 'Toggle the [H]arpoon menu',
      },
      {
        "<leader>j1",
        function()
          require("harpoon"):list().select(1)
        end,
        desc = '[J]ump to the [1]st harpoon mark',
      },
      {
        "<leader>j2",
        function()
          require("harpoon"):list().select(2)
        end,
        desc = '[J]ump to the [2]nd harpoon mark',
      },
      {
        "<leader>j3",
        function()
          require("harpoon"):list().select(3)
        end,
        desc = '[J]ump to the [3]rd harpoon mark',
      },
      {
        "<leader>j4",
        function()
          require("harpoon"):list().select(4)
        end,
        desc = '[J]ump to the [4]th harpoon mark',
      },
  },
}
