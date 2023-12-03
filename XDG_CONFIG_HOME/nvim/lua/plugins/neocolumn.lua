return {
  "ecthelionvi/NeoColumn.nvim",
  dir = require("lazy-nix-helper").get_plugin_path("NeoColumn"),
  -- not packaged in nix
  enabled = false,
  event = { "BufReadPre", "BufNewFile" },
  opts = {
    NeoColumn = "120",
    always_on = true,
  },
  keys = {
    {
      "<leader>cc", "<cmd>ToggleNeoColumn<cr>", desc = "Toggle [C]olor [C]olumn"
    },
  }
}
