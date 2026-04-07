-- lua/plugins/telescope-nvim.lua

return {
  "nvim-telescope/telescope.nvim",
  branch = "master",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make", cond = function() return vim.fn.executable("make") == 1 end },
  },
  cmd = "Telescope",
  config = function()
    local telescope = require("telescope")
    local actions = require("telescope.actions") -- Make sure to require actions

    telescope.setup{
      defaults = {
        file_ignore_patterns = { "node_modules", ".git/" },
        mappings = {
          -- Mappings for Insert Mode
          i = {
            ["<esc>"] = actions.close,
            ["<C-j>"] = actions.move_selection_next,
            ["<C-k>"] = actions.move_selection_previous,
            ["<C-n>"] = actions.move_selection_next,
            ["<C-p>"] = actions.move_selection_previous,
          },
          -- Mappings for Normal Mode
          n = {
            ["j"] = actions.move_selection_next,
            ["k"] = actions.move_selection_previous,
          }
        },
      },
    }
    pcall(telescope.load_extension, "fzf")
  end,
}
