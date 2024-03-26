return {
  "epwalsh/obsidian.nvim",
  version = "*",
  lazy = true,
  ft = "markdown",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "hrsh7th/nvim-cmp",
  },
  opts = {
    workspaces = {
      {
        name = "personal",
        path = "~/vaults/personal",
      },
    },
  },
  completion = {
    nvim_cmp = true,
    min_chars = 2,
  },
  picker = {
    name = "telescope.nvim"
  },
}
