-- This is currently broken and unused, all config is in the top level init.lua
return {
  -- colorscheme must be available when starting Neovim
  {
    'sainnhe/gruvbox-material', -- Theme
    lazy = false, -- make sure we load this during startup
    priority = 1000, -- make sure we load this before all other start plugins
    config = function()
      vim.cmd [[colorscheme gruvbox-material]]
    end,
  },

  {
    'nvim-lualine/lualine.nvim', -- Fancier statusline
    opts = {
      options = {
        icons_enabled = false,
        theme = 'gruvbox-material',
        component_separators = '|',
        section_separators = '',
      },
    },
  },

  { -- LSP Configuration & Plugins
    'neovim/nvim-lspconfig',
    dependencies = {
      -- Automatically install LSPs to stdpath for neovim
      {
        'williamboman/mason.nvim',
        opts = {
          local capabilities = vim.lsp.protocol.make_client_capabilities(),
          capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities),

          -- Ensure the servers above are installed
          local mason_lspconfig = require 'mason-lspconfig',

          mason_lspconfig.setup {
            ensure_installed = vim.tbl_keys(servers),
          },

          mason_lspconfig.setup_handlers {
            function(server_name)
              require('lspconfig')[server_name].setup {
                capabilities = capabilities,
                on_attach = on_attach,
                settings = servers[server_name],
              }
            end,
          },
        },
      },
    },
      'williamboman/mason-lspconfig.nvim',

      -- Useful status updates for LSP
      { 'j-hui/fidget.nvim', opts = {} },

      -- Additional lua configuration, makes nvim stuff amazing
      { 'folke/neodev.nvim', opts = {} },
    },
  },


-- nvim-cmp supports additional completion capabilities, so broadcast that to servers




  { -- Autocompletion
    'hrsh7th/nvim-cmp',

    dependencies = {
      'hrsh7th/cmp-nvim-lsp',
      'L3MON4D3/LuaSnip',
      'saadparwaiz1/cmp_luasnip' },
    opts = {
      local cmp = require 'cmp',
      local luasnip = require 'luasnip',

      cmp.setup {
        snippet = {
          expand = function(args)
            luasnip.lsp_expand(args.body)
          end,
        },
        mapping = cmp.mapping.preset.insert {
          ['<C-d>'] = cmp.mapping.scroll_docs(-4),
          ['<C-f>'] = cmp.mapping.scroll_docs(4),
          ['<C-Space>'] = cmp.mapping.complete(),
          ['<CR>'] = cmp.mapping.confirm {
            behavior = cmp.ConfirmBehavior.Replace,
            select = true,
          },
          ['<Tab>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_next_item()
            elseif luasnip.expand_or_jumpable() then
              luasnip.expand_or_jump()
            else
              fallback()
            end
          end, { 'i', 's' }),
          ['<S-Tab>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_prev_item()
            elseif luasnip.jumpable(-1) then
              luasnip.jump(-1)
            else
              fallback()
            end
          end, { 'i', 's' }),
        },
        sources = {
          { name = 'nvim_lsp' },
          { name = 'luasnip' },
        },
      },
    },
  },

  { -- Highlight, edit, and navigate code
    'nvim-treesitter/nvim-treesitter',
    lazy = false,
    config = function()
      require('nvim-treesitter.configs').setup {
        -- Add languages to be installed here that you want installed for treesitter
        ensure_installed = { 'bash', 'c', 'cpp', 'css', 'dockerfile', 'go', 'html', 'ini', 'json', 'latex', 'lua', 'make', 'markdown', 'nix', 'python', 'rust', 'toml', 'typescript', 'yaml', 'zig', 'help', 'vim' },

        highlight = { enable = true, additional_vim_regex_highlighting = false },
        indent = { enable = true, disable = { 'python' } },
        incremental_selection = {
          enable = true,
          keymaps = {
            init_selection = '<c-space>',
            node_incremental = '<c-space>',
            scope_incremental = '<c-s>',
            node_decremental = '<c-backspace>',
          },
        },
        textobjects = {
          select = {
            enable = true,
            lookahead = true, -- Automatically jump forward to textobj, similar to targets.vim
            keymaps = {
              -- You can use the capture groups defined in textobjects.scm
              ['aa'] = '@parameter.outer',
              ['ia'] = '@parameter.inner',
              ['af'] = '@function.outer',
              ['if'] = '@function.inner',
              ['ac'] = '@class.outer',
              ['ic'] = '@class.inner',
            },
          },
          move = {
            enable = true,
            set_jumps = true, -- whether to set jumps in the jumplist
            goto_next_start = {
              [']m'] = '@function.outer',
              [']]'] = '@class.outer',
            },
            goto_next_end = {
              [']M'] = '@function.outer',
              [']['] = '@class.outer',
            },
            goto_previous_start = {
              ['[m'] = '@function.outer',
              ['[['] = '@class.outer',
            },
            goto_previous_end = {
              ['[M'] = '@function.outer',
              ['[]'] = '@class.outer',
            },
          },
          swap = {
            enable = true,
            swap_next = {
              ['<leader>a'] = '@parameter.inner',
            },
            swap_previous = {
              ['<leader>A'] = '@parameter.inner',
            },
          },
        },
      }
    end,
    build = function()
      pcall(require('nvim-treesitter.install').update { with_sync = true })
    end,
    -- Additional text objects via treesitter
    dependencies = {
      'nvim-treesitter/nvim-treesitter-textobjects',
    },
  },

  -- Git related plugins
  'tpope/vim-fugitive',
  'tpope/vim-rhubarb',

  {
    'lewis6991/gitsigns.nvim',
    opts = {
      signs = {
        add = { text = '+' },
        change = { text = '~' },
        delete = { text = '_' },
        topdelete = { text = '‾' },
        changedelete = { text = '~' },
      },
    },
  },

  -- UI related plugins
  -- Fancier buffer/tabline
  {
    'akinsho/bufferline.nvim',
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
    dependencies = {
      'nvim-tree/nvim-web-devicons'
    },
  },

  'tpope/vim-sleuth', -- Detect tabstop and shiftwidth automatically


  -- Keybind related plugins
  { 'numToStr/Comment.nvim', opts = {} }, -- "gc" to comment visual regions/lines

  -- Fuzzy Finder (files, lsp, etc)
  -- [[ Configure Telescope ]]
  -- See `:help telescope` and `:help, additional_vim_regex_highlighting = false telescope.setup()`
  {
    'nvim-telescope/telescope.nvim',
    dependencies = {
      'nvim-lua/plenary.nvim',
      -- Fuzzy Finder Algorithm which requires local dependencies to be built. Only load if `make` is available
      { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make', cond = vim.fn.executable 'make' == 1 },
    },
    branch = '0.1.x',
    opts = {
      defaults = {
        mappings = {
          i = {
            ['<C-u>'] = false,
            ['<C-d>'] = false,
          },
          n = {
            ['<leader>?'] = require('telescope.builtin').oldfiles, { desc = '[?] Find recently opened files' },
            ['<leader><space>'] = require('telescope.builtin').buffers, { desc = '[ ] Find existing buffers' },
            ['<leader>/'] = function()
              require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
                winblend = 10,
                previewer = false,
              })
            end, { desc = '[/] Fuzzily search in current buffer]' },
            ['<leader>sf'] = require('telescope.builtin').find_files, { desc = '[S]earch [F]iles' },
            ['<leader>sr'] = require('telescope.builtin').git_files, { desc = '[S]earch files in git [R]epo' },
            ['<leader>sh'] = require('telescope.builtin').help_tags, { desc = '[S]earch [H]elp' },
            ['<leader>sw'] = require('telescope.builtin').grep_string, { desc = '[S]earch current [W]ord' },
            ['<leader>sg'] = require('telescope.builtin').live_grep, { desc = '[S]earch by [G]rep' },
            ['<leader>sd'] =  require('telescope.builtin').diagnostics, { desc = '[S]earch [D]iagnostics' },
            ['<leader>key'] = require('telescope.builtin').keymaps, { desc = 'Show [KEY]map info' },
          },
        },
      },
    },
  },








  -- Make treesitter AST available with :TSPlaygroundToggle
  { 'nvim-treesitter/playground' },

  -- Debugging related plugins
  'mfussenegger/nvim-dap',
  'rcarriga/nvim-dap-ui',
  'theHamsta/nvim-dap-virtual-text',
  'nvim-telescope/telescope-dap.nvim',

  -- Use mind.nvim for notetaking
  {
    'phaazon/mind.nvim',
    branch = 'v2.2',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function ()
      require'mind'.setup()
    end
  },
}
