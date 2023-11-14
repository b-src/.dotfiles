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
        -- needed to show @recording messages in statusline with noice
        -- if those are shown as notifications, there's no confirmation when
        -- recording is turned off.
        -- lualine_x = {
        --   {
        --     require("noice").api.statusline.mode.get,
        --     cond = require("noice").api.statusline.mode.has,
        --     -- TODO: link this to theme or at least make it consistent
        --     color = { fg = "#ff9e64" },
        --   }
        -- },
      },
    }
  end
}
