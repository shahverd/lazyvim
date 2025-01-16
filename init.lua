-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")
vim.cmd([[colorscheme tokyonight-day]])
vim.cmd([[let $http_proxy='socks://localhost:1234']])
vim.cmd([[let $https_proxy='socks://localhost:1234']])
