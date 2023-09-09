return {
  "zbirenbaum/copilot-cmp",
  dependencies = "zbirenbaum/copilot.lua",
  cond = os.getenv("ENABLE_COPILOT") == "TRUE",
  opts = {},
  config = function(_, opts)
    local copilot_cmp = require("copilot_cmp")
    copilot_cmp.setup(opts)
    vim.api.nvim_create_autocmd("LspAttach", {
      callback = function(args)
        local client = vim.lsp.get_client_by_id(args.data.client_id)
        if client.name == "copilot" then
          copilot_cmp._on_insert_enter({})
        end
      end,
    })
  end,
}
