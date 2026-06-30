return {
	{
		"mfussenegger/nvim-dap",

		dependencies = {
			"rcarriga/nvim-dap-ui",
			"nvim-neotest/nvim-nio",
		},

		config = function()
			local dap = require("dap")
			local dapui = require("dapui")

			-- =========================================================================
			-- DAP UI
			-- =========================================================================

			dapui.setup({
				layouts = {
					{
						elements = {
							{ id = "scopes", size = 0.25 },
							{ id = "breakpoints", size = 0.25 },
							{ id = "stacks", size = 0.25 },
							{ id = "watches", size = 0.25 },
						},
						size = 40,
						position = "left",
					},

					{
						elements = {
							"repl",
							"console",
						},
						size = 10,
						position = "bottom",
					},
				},
			})

			-- =========================================================================
			-- UI Auto Open / Close
			-- =========================================================================

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

			-- =========================================================================
			-- Signs
			-- =========================================================================

			vim.fn.sign_define("DapBreakpoint", {
				text = "",
				texthl = "DiagnosticError",
			})

			vim.fn.sign_define("DapStopped", {
				text = "",
				texthl = "DiagnosticWarn",
			})

			-- =========================================================================
			-- Codelldb Adapter
			-- =========================================================================

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

			-- =========================================================================
			-- C / C++ / Rust Configurations
			-- =========================================================================

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
			dap.configurations.rust = dap.configurations.cpp

			-- =========================================================================
			-- Keymaps
			-- =========================================================================

			vim.keymap.set("n", "<F5>", dap.continue, {
				desc = "DAP Continue",
			})

			vim.keymap.set("n", "<F10>", dap.step_over, {
				desc = "DAP Step Over",
			})

			vim.keymap.set("n", "<F11>", dap.step_into, {
				desc = "DAP Step Into",
			})

			vim.keymap.set("n", "<F12>", dap.step_out, {
				desc = "DAP Step Out",
			})

			vim.keymap.set("n", "<leader>db", dap.toggle_breakpoint, {
				desc = "DAP Toggle Breakpoint",
			})

			vim.keymap.set("n", "<leader>dB", function()
				dap.set_breakpoint(vim.fn.input("Breakpoint condition: "))
			end, {
				desc = "DAP Conditional Breakpoint",
			})

			vim.keymap.set("n", "<leader>dr", dap.repl.open, {
				desc = "DAP Open REPL",
			})

			vim.keymap.set("n", "<leader>du", dapui.toggle, {
				desc = "DAP Toggle UI",
			})

			vim.keymap.set("n", "<leader>dx", dap.terminate, {
				desc = "DAP Terminate",
			})
		end,
	},
}
