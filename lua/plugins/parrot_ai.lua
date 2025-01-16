return {
  "frankroeder/parrot.nvim",
  dependencies = { "ibhagwan/fzf-lua", "nvim-lua/plenary.nvim" },
  -- optionally include "rcarriga/nvim-notify" for beautiful notifications
  config = function()
    require("parrot").setup({
      -- Providers must be explicitly added to make them available.
      providers = {
        gemini = {
          api_key = os.getenv("GEMINI_API_KEY"),
        },
      },
    })
  end,
}
