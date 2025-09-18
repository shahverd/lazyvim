-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
--
-- Debugging keymaps
local dap = require("dap")

-- Start/continue
vim.keymap.set("n", "<leader>dc", dap.continue, { desc = "Continue/Start Debugging" })]
vim.keymap.set("n", "<leader>dx", function()
    dap.terminate()
    dapui.close()
end, { desc = "Debug: Terminate" })

-- Step controls
vim.keymap.set("n", "<leader>do", dap.step_over, { desc = "Step Over" })
vim.keymap.set("n", "<leader>di", dap.step_into, { desc = "Step Into" })
vim.keymap.set("n", "<leader>du", dap.step_out, { desc = "Step Out" })

-- Breakpoints
vim.keymap.set("n", "<leader>db", dap.toggle_breakpoint, { desc = "Toggle Breakpoint" })
vim.keymap.set("n", "<leader>dB", function()
    dap.set_breakpoint(vim.fn.input("Breakpoint condition: "))
end, { desc = "Set Conditional Breakpoint" })

-- Debug UI (dap-ui)
vim.keymap.set("n", "<leader>dd", function()
    require("dapui").toggle()
end, { desc = "Toggle Debugger UI" })

-- REPL
vim.keymap.set("n", "<leader>dr", dap.repl.open, { desc = "Open REPL" })
