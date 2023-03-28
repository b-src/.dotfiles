return {
  {
    "mfussenegger/nvim-dap",
    event = "BufReadPre",
    dependenciess = {
      "theHamsta/nvim-dap-virtual-text",
      "rcarriga/nvim-dap-ui",
      "nvim-telescope/telescope-dap.nvim",
      "mfussenegger/nvim-dap-python",
    },
    config = function()
      require("dap").setup()
    end,
  },
  {
    'rcarriga/nvim-dap-ui',
    opts = {},
  },
  {
    'theHamsta/nvim-dap-virtual-text',
    opts = {},
  },
  {
    'nvim-telescope/telescope-dap.nvim',
    opts = {},
  },
  {
    "mfussenegger/nvim-dap-python",
    opts = {},
  },
}
