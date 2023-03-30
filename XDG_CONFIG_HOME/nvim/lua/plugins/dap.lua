local M = {
  "mfussenegger/nvim-dap",

  dependencies = {
    "theHamsta/nvim-dap-virtual-text",
    {
      "rcarriga/nvim-dap-ui",
      config = function()
        require("dapui").setup()
      end,
    },
    "nvim-telescope/telescope-dap.nvim",
    "mfussenegger/nvim-dap-python",
  },
}

function M.init()
  vim.keymap.set("n", "<leader>b", function()
    require("dap").toggle_breakpoint(nil, nil)
  end, { desc = "Debugger toggle [B]reakpoint" })

  vim.keymap.set("n", "<leader>cb", function()
    require("dap").set_breakpoint()
  end, { desc = "Debugger set [C]onditional [B]reakpoint" })

  vim.keymap.set("n", "<leader>lp", function()
    require("dap").set_breakpoint(nil, nil, vim.fn.input("Log point message: "))
  end, { desc = "Debugger [L]og [P]oint message" })

  vim.keymap.set("n", "<F5>", function()
    require("dap").continue()
  end, { desc = "Debugger continue" })

  vim.keymap.set("n", "<F7>", function()
    require("dap").step_into()
  end, { desc = "Debugger step into" })

  vim.keymap.set("n", "<F8>", function()
    require("dap").step_over()
  end, { desc = "Debugger step over" })

  vim.keymap.set("n", "<S-<F8>>", function()
    require("dap").step_out()
  end, { desc = "Debugger step out" })

  vim.keymap.set("n", "<leader>dr", function()
    require("dap").repl_open()
  end, { desc = "[D]ebugger [R]EPL" })

  vim.keymap.set("n", "<leader>dw", function()
    require("dap.ui.widgets").hover()
  end, { desc = "Debugger [W]idgets" })

  vim.keymap.set("n", "<leader>du", function()
    require("dapui").toggle({})
  end, { desc = "Toggle [D]ebugger UI" })
end

function M.config()
  local dap = require("dap")

  local function python_bin()
    local function venv_active()
      return os.getenv("VIRTUAL_ENV") ~= nil
    end

    local python_exe = nil

    if venv_active() then
      python_exe = os.getenv("VIRTUAL_ENV") .. "/bin/python"
    end

    return python_exe
  end

  local python_command = python_bin()

  dap.adapters.python = {
    type = "executable";
    -- use the relevant version of python for any project
    -- set to nil if venv is not active
    -- debugpy must be installed in the venv
    command = python_command;
    args = { "-m", "debugpy.adapter" };
  }

  dap.configurations.python = {
    {
      type = "python";
      request = "launch";
      name = "Launch file";
      program = "${file}";
      -- TODO: is this needed?
      -- pythonPath = function()
      --   return os.getenv("VIRTUAL_ENV") .. "/bin/python"
      -- end;
    }
  }

  -- local dapui = require("dapui")
  -- dap.listeners.after.event_initialized["dapui_config"] = function()
  --   dapui.open({})
  -- end
  -- dap.listeners.before.event_terminated["dapui_config"] = function()
  --   dapui.close({})
  -- end
  -- dap.listeners.before.event_exited["dapui_config"] = function()
  --   dapui.close({})
  -- end
end


return M
