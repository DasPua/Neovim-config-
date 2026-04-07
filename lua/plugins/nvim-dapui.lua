return {
  "rcarriga/nvim-dap-ui",
  dependencies = {
    "nvim-neotest/nvim-nio",
    {
      "mfussenegger/nvim-dap",
      config = function()
        local dap, dapui = require("dap"), require("dapui")

        dap.listeners.before.attach.dapui_config = function()
          dapui.open()
        end
        dap.listeners.before.launch.dapui_config = function()
          dapui.open()
        end
        dap.listeners.before.event_terminated.dapui_config = function()
          dapui.close()
        end
        dap.listeners.before.event_exited.dapui_config = function()
          dapui.close()
        end

        -- === C/C++ DAP configuration ===
        local mason_path = vim.fn.stdpath("data") .. "/mason"
        local codelldb_path = mason_path .. "/packages/codelldb/extension/adapter/codelldb"

        dap.adapters.codelldb = {
          type = "server",
          port = "${port}",
          executable = {
            command = codelldb_path,
            args = { "--port", "${port}" },
          },
        }

        dap.configurations.cpp = {
          {
            name = "Launch file",
            type = "codelldb",
            request = "launch",
            program = function()
              return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
            end,
            cwd = "${workspaceFolder}",
            stopOnEntry = false,
          },
        }

        dap.configurations.c = dap.configurations.cpp
      end,
    },
  },
  config = function()
    require("dapui").setup()
  end,
}

