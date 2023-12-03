return {
  "nvim-neotest/neotest",
  dir = require("lazy-nix-helper").get_plugin_path("neotest"),
  dependencies = {
    {
      "nvim-lua/plenary.nvim",
      dir = require("lazy-nix-helper").get_plugin_path("plenary"),
    },
    {
      "nvim-treesitter/nvim-treesitter",
      dir = require("lazy-nix-helper").get_plugin_path("nvim-treesitter"),
    },
    {
      "antoinemadec/FixCursorHold.nvim",
      dir = require("lazy-nix-helper").get_plugin_path("FixCursorHold"),
    },
    {
      "nvim-neotest/neotest-python",
      dir = require("lazy-nix-helper").get_plugin_path("neotest-python"),
    }
  },
  config = function()
    local neotest = require("neotest")

    neotest.setup({
      adapters = {
        require("neotest-python")({
          dap = { justMyCode = false },
        }),
        -- require("neotest-plenary"),
        -- require("neotest-vim-test")({
        --   ignore_file_types = { "python", "vim", "lua" },
        -- }),
      },
    })
  end,
  keys = {
    {
      "<leader>rt",
      function()
        require("neotest").run.run()
      end,
      desc = "[R]un the nearest [T]est",
    },
    {
      "<leader>rl",
      function()
        require("neotest").run.run_last()
      end,
      desc = "[R]erun the [L]ast test",
    },
    {
      "<leader>rf",
      function()
        require("neotest").run.run(vim.fn.expand("%"))
      end,
      desc = "[R]un the current [F]ile",
    },
    {
      "<leader>dt",
      function()
        require("neotest").run.run({ strategy = "dap" })
      end,
      desc = "[D]ebug the nearest [T]est",
    },
    {
      "<leader>dl",
      function()
        require("neotest").run.run_last({ strategy = "dap" })
      end,
      desc = "[D]ebug the [L]ast test",
    },
  },
}
