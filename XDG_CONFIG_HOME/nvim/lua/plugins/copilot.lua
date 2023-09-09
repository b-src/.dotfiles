return {
  "zbirenbaum/copilot.lua",
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
