return {
  "snacks.nvim",
  opts = {

    dashboard = {
      preset = {
        header = [[
███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗
████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║
██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║
██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║
██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║
╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝]],
      },
      formats = {
        key = function(item)
          return { { "[", hl = "special" }, { item.key, hl = "key" }, { "]", hl = "special" } }
        end,
      },
      sections = {
        { section = "header" },
        -- { section = "keys", padding = 1, indent = 2, title = "Bookmarks" },
        { section = "projects", padding = 1, indent = 2, title = "Recebt Projects" },
        --
        --        { section = "terminal", pane = 2, cmd = "fortune -s | cowsay", hl = "header", padding = 1, indent = 8 },
        { section = "recent_files", pane = 2, limit = 8, padding = 1, indent = 2, title = "Recent Files" },
      },
    },
  },
}
