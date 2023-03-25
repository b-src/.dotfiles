return {
  -- lspconfig
  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      --{ "folke/neoconf.nvim", cmd = "Neoconf", config = true },
      { "folke/neodev.nvim", }, --opts = { experimental = { pathStrict = true } } },
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      "j-hui/fidget.nvim",
      "hrsh7th/cmp-nvim-lsp",
    },
    ---@class PluginLspOpts
    opts = {
      -- options for vim.diagnostic.config()
      diagnostics = {
        underline = true,
        update_in_insert = false,
        virtual_text = { spacing = 4, prefix = "●" },
        severity_sort = true,
      },
      -- LSP Server Settings
      ---@type lspconfig.options
      servers = {
	pyright = {},
	rust_analyzer = {},
        lua_ls = {
          settings = {
            Lua = {
              workspace = {
                checkThirdParty = false,
              },
              completion = {
                callSnippet = "Replace",
              },
            },
          },
        },
      },
      setup = {}
    },
    ---@param opts PluginLspOpts
    config = function(_, opts)
      -- setup autoformat
      -- require("lazyvim.plugins.lsp.format").autoformat = opts.autoformat
      -- setup formatting and keymaps
      -- require("lazyvim.util").on_attach(function(client, buffer)
        -- require("lazyvim.plugins.lsp.format").on_attach(client, buffer)
        -- require("lazyvim.plugins.lsp.keymaps").on_attach(client, buffer)
      -- end)

      -- diagnostics
      --for name, icon in pairs(require("lazyvim.config").icons.diagnostics) do
        --name = "DiagnosticSign" .. name
        --vim.fn.sign_define(name, { text = icon, texthl = name, numhl = "" })
      --end
      vim.diagnostic.config(opts.diagnostics)

      local servers = opts.servers
      local capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())

      local function setup(server)
        local server_opts = vim.tbl_deep_extend("force", {
          capabilities = vim.deepcopy(capabilities),
        }, servers[server] or {})

        if opts.setup[server] then
          if opts.setup[server](server, server_opts) then
            return
          end
        elseif opts.setup["*"] then
          if opts.setup["*"](server, server_opts) then
            return
          end
        end
        require("lspconfig")[server].setup(server_opts)
      end

      -- get all the servers that are available thourgh mason-lspconfig
      local have_mason, mlsp = pcall(require, "mason-lspconfig")
      local all_mslp_servers = {}
      if have_mason then
        all_mslp_servers = vim.tbl_keys(require("mason-lspconfig.mappings.server").lspconfig_to_package)
      end

      local ensure_installed = {} ---@type string[]
      for server, server_opts in pairs(servers) do
        if server_opts then
          server_opts = server_opts == true and {} or server_opts
          -- run manual setup if mason=false or if this is a server that cannot be installed with mason-lspconfig
          if server_opts.mason == false or not vim.tbl_contains(all_mslp_servers, server) then
            setup(server)
          else
            ensure_installed[#ensure_installed + 1] = server
          end
        end
      end

      if have_mason then
        mlsp.setup({ ensure_installed = ensure_installed })
        mlsp.setup_handlers({ setup })
      end
    end,
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

  -- cmdline tools and lsp servers
  {
    "williamboman/mason.nvim",
    cmd = "Mason",
    opts = {},
  },

  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "L3M0N4D3/LuaSnip",
      "saadparwaiz1/cmp_luasnip",
    },
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
}
