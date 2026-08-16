return {
	{
		"mfussenegger/nvim-dap",
		dependencies = {
			"nvim-neotest/nvim-nio",
			"rcarriga/nvim-dap-ui",
			"theHamsta/nvim-dap-virtual-text",
		},
		config = function()
			local dap = require("dap")
			local dapui = require("dapui")

			require("nvim-dap-virtual-text").setup({
				commented = true,
			})

			dapui.setup()

			------------------------------------------------------------------------
			-- UI
			------------------------------------------------------------------------

			dap.listeners.before.attach.dapui = function()
				dapui.open()
			end

			dap.listeners.before.launch.dapui = function()
				dapui.open()
			end

			dap.listeners.before.event_terminated.dapui = function()
				dapui.close()
			end

			dap.listeners.after.event_exited.dapui = function()
				dapui.close()
			end

			dap.listeners.after.event_terminated.dapui = function()
				dapui.close()
			end

			------------------------------------------------------------------------
			-- Signs
			------------------------------------------------------------------------

			vim.fn.sign_define("DapBreakpoint", {
				text = "B",
				texthl = "DiagnosticError",
			})

			vim.fn.sign_define("DapStopped", {
				text = "▶",
				texthl = "DiagnosticWarn",
			})

			vim.fn.sign_define("DapBreakpointRejected", {
				text = "",
				texthl = "DiagnosticError",
			})

			------------------------------------------------------------------------
			-- CodeLLDB
			------------------------------------------------------------------------

			local extension_path = vim.fn.stdpath("data") .. "/mason/packages/codelldb/extension"

			dap.adapters.codelldb = {
				type = "server",
				port = "${port}",
				executable = {
					command = extension_path .. "/adapter/codelldb",
					args = { "--port", "${port}" },
				},
			}

			------------------------------------------------------------------------
			-- C / C++ / Rust
			------------------------------------------------------------------------

			dap.configurations.cpp = {
				{
					name = "Launch current file",

					type = "codelldb",

					request = "launch",

					program = function()
						return vim.fn.expand("%:p:r")
					end,

					cwd = vim.fn.expand("%:p:h"),

					stopOnEntry = false,

					-- runInTerminal = false,

					args = {},
					showDisassembly = "never",
					stdio = function()
						local dir = vim.fn.expand("%:p:h")

						local input = dir .. "/input.txt"
						local output = dir .. "/output.txt"

						if vim.fn.filereadable(input) == 1 then
							return {
								input,
								output,
								nil,
							}
						end

						return nil
					end,
				},
			}

			dap.configurations.c = dap.configurations.cpp
			dap.configurations.rust = dap.configurations.cpp

			------------------------------------------------------------------------
			-- Keymaps
			------------------------------------------------------------------------

			vim.keymap.set("n", "<F5>", dap.continue, { desc = "Debug Continue" })

			vim.keymap.set("n", "<F10>", dap.step_over, { desc = "Debug Step Over" })
			vim.keymap.set("n", "<F11>", dap.step_into, { desc = "Debug Step Into" })
			vim.keymap.set("n", "<F12>", dap.step_out, { desc = "Debug Step Out" })

			vim.keymap.set("n", "<leader>db", dap.toggle_breakpoint, { desc = "Toggle Breakpoint" })

			vim.keymap.set("n", "<leader>dB", function()
				dap.set_breakpoint(vim.fn.input("Condition: "))
			end, { desc = "Conditional Breakpoint" })

			vim.keymap.set("n", "<leader>dl", function()
				dap.set_breakpoint(nil, nil, vim.fn.input("Log message: "))
			end, { desc = "Log Breakpoint" })

			vim.keymap.set("n", "<leader>dr", dap.repl.open, { desc = "Open REPL" })
			vim.keymap.set("n", "<leader>du", dapui.toggle, { desc = "Toggle DAP UI" })
			vim.keymap.set("n", "<leader>dx", dap.terminate, { desc = "Terminate Debugger" })
			vim.keymap.set("n", "<leader>dc", dap.run_to_cursor, { desc = "Run to Cursor" })
			vim.keymap.set("n", "<leader>dR", function()
				dap.terminate()
				vim.schedule(function()
					dap.continue()
				end)
			end, { desc = "Restart Debug" })
			vim.keymap.set("n", "<F6>", dap.down, { desc = "Frame Down" })
			vim.keymap.set("n", "<F7>", dap.up, { desc = "Frame Up" })
		end,
	},
}
