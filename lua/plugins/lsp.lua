return {
  {
    "neovim/nvim-lspconfig",
    config = function()
      local lspconfig = require("lspconfig")

      lspconfig.clangd.setup({
        cmd = { "clangd", "--background-index" },
        filetypes = { "c", "cpp", "objc", "objcpp" },
        root_dir = lspconfig.util.root_pattern("compile_commands.json", ".git"),
        -- If compile_commands.json is not in the project root, specify the path
        settings = {
          clangd = {
            compilationDatabasePath = "build", 
          },
        },
      })
    end,
  },
}
