return {
  "ecthelionvi/NeoColumn.nvim",
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
