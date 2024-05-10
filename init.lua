-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")
vim.cmd([[colorscheme tokyonight-day]])
vim.keymap.set("n", "<F9>", "<Cmd>Neotree toggle<CR>")
vim.cmd([[cd ~]])
