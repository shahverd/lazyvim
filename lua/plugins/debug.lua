return {
	{
		"mfussenegger/nvim-dap",
		dependencies = {
			"rcarriga/nvim-dap-ui", -- UI for dap
			"williamboman/mason.nvim",
			"jay-babu/mason-nvim-dap.nvim",
			"nvim-neotest/nvim-nio",
		},
		config = function()
			local dap = require("dap")
			local dapui = require("dapui")

			-- Setup dap-ui
			dapui.setup()

			-- Open/close UI automatically
			dap.listeners.after.event_initialized["dapui_config"] = function()
				dapui.open()
			end
			dap.listeners.before.event_terminated["dapui_config"] = function()
				dapui.close()
			end
			dap.listeners.before.event_exited["dapui_config"] = function()
				dapui.close()
			end

			dap.adapters.cppdbg = {
				id = "cppdbg",
				type = "executable",
				command = vim.fn.stdpath("data") .. "/mason/packages/cpptools/extension/debugAdapters/bin/OpenDebugAD7",
			}

			dap.configurations.cpp = {
				{
					name = "Launch C++ file",
					type = "codelldb",
					request = "launch",
					program = function()
						-- Path to your executable (adjust as needed)
						local exe = vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/main", "file")

						-- Run make synchronously so we know if it failed
						local result = vim.fn.system("make")

						if vim.v.shell_error ~= 0 then
							-- Show errors in a scratch buffer
							vim.cmd("new")
							vim.api.nvim_buf_set_lines(0, 0, -1, false, vim.split(result, "\n"))
							vim.notify("Build failed. Debugger not started.", vim.log.levels.ERROR)
							return nil -- 🚫 returning nil cancels debug start
						end

						return exe
					end,
					cwd = "${workspaceFolder}",
					stopOnEntry = false,
				},
			}

			dap.configurations.c = dap.configurations.cpp
			dap.configurations.rust = dap.configurations.cpp
		end,
	},
}
