return {
    {
        "mfussenegger/nvim-dap",
        dependencies = {
            "rcarriga/nvim-dap-ui",
            "williamboman/mason.nvim",
            "jay-babu/mason-nvim-dap.nvim",
            "nvim-neotest/nvim-nio",
        },
        config = function()
            local dap = require("dap")
            local dapui = require("dapui")
            -- Setup Mason DAP to automatically install adapters
            require("mason-nvim-dap").setup({
                ensure_installed = { "codelldb" }, -- Install codelldb for C++
                automatic_installation = true,
            })
            -- Setup DAP UI
            dapui.setup()
            -- Auto-open/close DAP UI
            dap.listeners.after.event_initialized["dapui_config"] = function()
                dapui.open()
            end
            -- Adapter configuration for codelldb
            dap.adapters.codelldb = {
                type = "executable",
                command = vim.fn.stdpath("data") .. "/mason/bin/codelldb",
                name = "codelldb",
            }
            -- C++-specific configuration
            dap.configurations.cpp = {
                {
                    name = "Launch C++ file",
                    type = "codelldb",
                    request = "launch",
                    program = function()
                        -- Prompt user for the executable path
                        -- local executable = vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
                        local executable = vim.fn.getcwd() .. "/bin/main"
                        if executable == "" then
                            vim.notify("No executable specified. Debugger not started.", vim.log.levels.ERROR)
                            return nil
                        end
                        return executable
                    end,
                    cwd = "${workspaceFolder}",
                    stopOnEntry = false,
                    args = function()
                        -- return vim.split(vim.fn.input("Arguments: "), "%s+")
                    end,
                },
            }
        end,
    },
}
