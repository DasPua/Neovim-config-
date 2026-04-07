-- return {
--   "rcarriga/nvim-notify",
--   config = function()
--     local notify = require("notify")
--     notify.setup({
--       background_colour = "#000000",
--       timeout = 3000,
--     })
--     vim.notify = notify
--   end,
-- }
return {
  "folke/noice.nvim",
  event = "VeryLazy",
  dependencies = {
    "MunifTanjim/nui.nvim",
    "nvim-lua/plenary.nvim",
  },
  config = function()
    require("noice").setup({
      presets = {
        command_palette = true,
      },
      cmdline = {
        enabled = true,
        view = "cmdline_popup",
        opts = {
          border = {
            style = "rounded",
          },
        },
      },
      messages = {
        enabled = true,
      },
      lsp = {
        progress = {
          enabled = true,
        },
        signature = {
          enabled = true,
        },
      },
    })
  end,
}
