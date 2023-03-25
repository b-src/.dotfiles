-- TODO: look into scope.nvim to scope buffers to tabs
return {
  'akinsho/bufferline.nvim',
  dependencies = {
    'nvim-tree/nvim-web-devicons',
  },
  event = "VeryLazy",
  opts = {
    options = {
      mode = "buffers",
      numbers = "id",
      --close_command = nil,
      --right_mouse_command = nil,
      --left_mouse_command = nil,
      --middle_mouse_command = nil,
      indicator = {
        style = 'underline',
      },
      buffer_close_icon = '',
      modified_icon = '●',
      close_icon = '',
      left_trunc_marker = '',
      right_trunc_marker = '',

      -- name_formatter = function(buf)
      -- max_name_length = 18,
      -- max_prefix_length = 15, -- prefix used when a buffer is de-duplicated
      -- truncate_names = true, -- whether or not tab names should be truncated
      tab_size = 18,
      diagnostics = "nvim_lsp",
      diagnostics_update_in_insert = false,
      -- The diagnostics indicator can be set to nil to keep the buffer name highlight but delete the highlighting
      diagnostics_indicator = function(count, level, diagnostics_dict, context)
        local icon = level:match("error") and " " or " "
        return " " .. icon .. count
      end,
      -- TODO: may want to use this to e.g. not show help buffers or handle output log buffers separately.
      -- There are examples in :h bufferline-filtering
      -- NOTE: this will be called a lot so don't do any heavy processing here
      -- custom_filter = function(buf_number, buf_numbers)
      -- end,

      -- TODO: only need this for vertical splits such as tree file explorers
      -- offsets = {}
      color_icons = true,
      get_element_icon = function(element)
        -- element consists of {filetype: string, path: string, extension: string, directory: string}
        -- This can be used to change how bufferline fetches the icon
        -- for an element e.g. a buffer or a tab.
        -- e.g.
        local icon, hl = require('nvim-web-devicons').get_icon_by_filetype(element.filetype, { default = false })
        return icon, hl
      end,
      show_buffer_icons = true,
      show_buffer_close_icons = true,
      show_buffer_default_icon = false, -- whether or not an unrecognised filetype should show a default icon
      show_close_icon = true,
      show_tab_indicators = true,
      show_duplicate_prefix = true,
      persist_buffer_sort = true, -- whether or not custom sorted buffers should persist
      -- can also be a table containing 2 custom separators
      -- [focused and unfocused]. eg: { '|', '|' }
      separator_style =  "slope",
      enforce_regular_tabs = false,
      always_show_bufferline = true,
      -- hover = {
      --   enabled = true,
      --   delay = 200,
      --   reveal = {'close'}
      -- },
      sort_by = "tabs",
    },
  },
}
