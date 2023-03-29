return {
  "nvim-lualine/lualine.nvim",
  event = "VeryLazy",
  config = function ()
    local function maximize_status()
      return vim.t.maximized and '   fullscreen' or ''
    end

    require("lualine").setup {
      icons_enabled = true,
      theme = 'gruvbox-material',
      sections = {
        lualine_c = { 'filename', maximize_status },
      },
    }
  end
}
