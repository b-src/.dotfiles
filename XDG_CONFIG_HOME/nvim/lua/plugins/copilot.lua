return {
  "zbirenbaum/copilot.lua",
  dir = require("lazy-nix-helper").get_plugin_path("copilot"),
  cond = os.getenv("ENABLE_COPILOT") == "TRUE",
  cmd = "Copilot",
  build = ":Copilot auth",
  opts = {
    suggestion = { enabled = false },
    panel = { enabled = false },
    filetypes = {
      markdown = true,
      help = true,
    },
  },
}
