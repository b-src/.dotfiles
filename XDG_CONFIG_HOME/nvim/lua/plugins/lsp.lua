return {
  { -- LSP Configuration & Plugins
    'neovim/nvim-lspconfig',
    event = "BufEnter",
    dependencies = {
      -- Automatically install LSPs to stdpath for neovim
      'williamboman/mason.nvim',
      'williamboman/mason-lspconfig.nvim',

      -- Useful status updates for LSP
      'j-hui/fidget.nvim',

      -- Additional lua configuration, makes nvim stuff amazing
      'folke/neodev.nvim', -- TODO: require not explicitly called, is that fine?
    },
    -- TODO: do all these vim.lsp... functions need to be called with ()?
    keys = {
      {
        "<leader>rn",
        vim.lsp.buf.rename,
        desc = '[R]e[N]ame',
      },
      {
        "<leader>ca",
        vim.lsp.buf.code_action,
        desc = '[C]ode [A]ction',
      },
      {
        "<leader>fs",
        vim.lsp.buf.signature_help,
        desc = '[F]unction [S]ignature help',
      },
      {
        "gd",
        vim.lsp.buf.definition,
        desc = '[G]oto [D]efinition',
      },
      {
        "gr",
        function()
          require('telescope.builtin').lsp_references()
        end,
        desc = '[G]oto [R]eferences',
      },
      {
        "gI",
        vim.lsp.buf.implementation,
        desc = '[G]oto [I]mplementation',
      },
      {
        "<leader>D",
        vim.lsp.buf.type_definition,
        desc = 'Type [D]efinition',
      },
      {
        "<leader>ds",
        function()
          require('telescope.builtin').lsp_document_symbols()
        end,
        desc = '[D]ocument [S]ymbols',
      },
      {
        "<leader>ws",
        function()
          require('telescope.builtin').lsp_dynamic_workspace_symbols()
        end,
        desc = '[W]orkspace [S]ymbols',
      },
      {
        "<leader>K",
        vim.lsp.buf.hover,
        desc = 'Hover Documentation',
      },
      {
        "<C-k>",
        vim.lsp.buf.signature_help,
        desc = 'Signature Documentation',
      },
      {
        "gD",
        vim.lsp.buf.declaration,
        desc = '[G]oto [D]eclaration',
      },
      {
        "<leader>wa",
        vim.lsp.buf.add_workspace_folder,
        desc = '[W]orkspace [A]dd Folder',
      },
      {
        "<leader>wr",
        vim.lsp.buf.remove_workspace_folder,
        desc = '[W]orkspace [R]emove Folder',
      },
      {
        "<leader>wl",
        function()
          print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
        end,
        desc = '[W]orkspace [S]ymbols',
      },
    },
  },

  { -- Autocompletion
    'hrsh7th/nvim-cmp',
    dependencies = { 'hrsh7th/cmp-nvim-lsp', 'L3MON4D3/LuaSnip', 'saadparwaiz1/cmp_luasnip' },
    config = function()
      -- nvim-cmp setup
      local cmp = require 'cmp'
      local luasnip = require 'luasnip'

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
      }
    end,
  },

  {
    'j-hui/fidget.nvim',
    opts = {}
  },
}