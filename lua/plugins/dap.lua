return {
  {
    "mfussenegger/nvim-dap",
    dependencies = {
      "nvim-neotest/nvim-nio", -- bu yangi qo‘shildi
      "rcarriga/nvim-dap-ui",
      "mfussenegger/nvim-dap-python",
    },
    config = function()
      local dap = require("dap")
      local dapui = require("dapui")
      dapui.setup()

      -- Event hooks
      dap.listeners.after.event_initialized["dapui_config"] = function()
        dapui.open()
      end
      dap.listeners.before.event_terminated["dapui_config"] = function()
        dapui.close()
      end
      dap.listeners.before.event_exited["dapui_config"] = function()
        dapui.close()
      end

      -- Python DAP
      dap.adapters.docker = {
        type = "server",
        host = "127.0.0.1",
        port = 5678,
      }
      dap.configurations.python = {
        {
          type = "docker",
          request = "attach",
          name = "Attach to Docker",
          connect = {
            host = "127.0.0.1",
            port = 5679,
          },
          pathMappings = {
            {
              localRoot = vim.fn.getcwd(), -- hostdagi loyiha root
              remoteRoot = "/code", -- containerdagi loyiha root
            },
          },
        },
      }
      -- require("dap-python").setup(vim.fn.exepath("python"))
      require("dap-python").setup("python")

      -- Keymaps
      vim.keymap.set("n", "<F5>", dap.continue, { desc = "Start/Continue debug" })
      vim.keymap.set("n", "<F10>", dap.step_over, { desc = "Step over" })
      vim.keymap.set("n", "<F11>", dap.step_into, { desc = "Step into" })
      vim.keymap.set("n", "<F12>", dap.step_out, { desc = "Step out" })
      vim.keymap.set("n", "<leader>db", dap.toggle_breakpoint, { desc = "Toggle breakpoint" })
      vim.keymap.set("n", "<leader>dw", function()
        local var = vim.fn.input("Watch expression: ")
        dapui.elements.watches.add(var)
      end, { desc = "Add variable watch" })
    end,
  },
}
