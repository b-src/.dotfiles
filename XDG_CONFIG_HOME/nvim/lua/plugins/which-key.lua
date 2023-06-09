return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  keys = {
    {
      "<leader>v",
      "<cmd>WhichKey<cr>",
      desc = "[V]iew keymaps with which-key",
    },
  },
  config = function()
    vim.o.timeout = true
    vim.o.timeoutlen = 300
    require("which-key").setup()
  end,
}
