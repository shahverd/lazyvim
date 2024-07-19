-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")
vim.cmd([[colorscheme tokyonight]])
vim.keymap.set("n", "<F9>", "<Cmd>Neotree toggle<CR>")

require("neotest").setup({
  adapters = {
    require("neotest-python"),
  },
})
