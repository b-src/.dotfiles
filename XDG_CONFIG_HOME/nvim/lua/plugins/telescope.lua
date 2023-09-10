return {
  {
    "nvim-telescope/telescope.nvim",
    branch = '0.1.x',
    dependencies = {
      "nvim-lua/plenary.nvim",
      "debugloop/telescope-undo.nvim",
    },
    cmd = "Telescope",
    opts = {
      defaults = {
        layout_strategy = "horizontal",
        sorting_strategy = "ascending",
        layout_config = {
          prompt_position = "top",
        },
      },
      mappings = {
        i = {
          ['<C-u>'] = false,
          ['<C-d>'] = false,
        },
      },
      extensions = {
        undo = {
          -- use defaults
        },
      },
    },
    config = function(_, opts)
      require("telescope").setup(opts)
      require("telescope").load_extension("fzf")
      require("telescope").load_extension("harpoon")
      require("telescope").load_extension("todo-comments")
      require("telescope").load_extension("undo")
    end,
    keys = {
      {
        "<leader>?",
        function()
          require('telescope.builtin').oldfiles()
        end,
        desc = '[?] Find recently opened files',
      },
      {
        "<leader><space>",
        function()
          require('telescope.builtin').buffers()
        end,
        desc = '[ ] Find existing buffers',
      },
      {
        "<leader>/",
        function()
          require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
            winblend = 10,
            previewer = false,
          })
        end,
        desc = '[/] Fuzzily search in current buffer]',
      },
      {
        "<leader>sf",
        function()
          require('telescope.builtin').find_files()
        end,
        desc = '[S]earch [F]iles',
      },
      {
        "<leader>sr",
        function()
          require('telescope.builtin').git_files()
        end,
        desc = '[S]earch files in git [R]epo',
      },
      {
        "<leader>sh",
        function()
          require('telescope.builtin').help_tags()
        end,
        desc = '[S]earch [H]elp',
      },
      {
        "<leader>sw",
        function()
          require('telescope.builtin').grep_string()
        end,
        desc = '[S]earch current [W]ord',
      },
      {
        "<leader>sg",
        function()
          require('telescope.builtin').live_grep()
        end,
        desc = '[S]earch by [G]rep',
      },
      {
        "<leader>sd",
        function()
          require('telescope.builtin').diagnostics()
        end,
        desc = '[S]earch [D]iagnostics',
      },
      -- TODO: fix function call
      {
        "<leader>sm",
        function()
          require('telescope').load_extension('harpoon').marks()
        end,
        desc = '[S]earch harpoon [M]ark',
      },
      {
        "<leader>tt",
        "<cmd>TodoTelescope<cr>",
        desc = "Search [T]ODOs with [T]elescope",
      },
      {
        "<leader>su",
        "<cmd>Telescope undo<cr>",
        desc = "[S]earch [U]ndos with telescope",
      },
      {
        "<C-q>",
        function()
          require('telescope.actions').send_selected_to_qflist()
        end,
        desc = 'Send selection to [Q]uickfix list',
      },
      {
        "<leader>key",
        function()
          require('telescope.builtin').keymaps()
        end,
        desc = 'Show [KEY]map info',
      },
    },
  },
  {
    'nvim-telescope/telescope-fzf-native.nvim',
    build = 'make',
    cond = vim.fn.executable 'make' == 1
  },
}
