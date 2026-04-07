return {
  "goolord/alpha-nvim",
  event = "VimEnter",
  enabled = true,
  init = false,
  opts = function()
    local dashboard = require("alpha.themes.dashboard")
    local logo = [[
          ██╗     █████╗ ███████╗██╗   ██╗██╗   ██╗██╗███╗   ███╗       Z
          ██║     ██╔══██╗╚══███╔╝╚██╗ ██╔╝██║   ██║██║████╗ ████║     Z   
          ██║     ███████║  ███╔╝  ╚████╔╝ ██║   ██║██║██╔████╔██║   z     
          ██║     ██╔══██║ ███╔╝    ╚██╔╝  ╚██╗ ██╔╝██║██║╚██╔╝██║ z       
          ███████╗██║  ██║███████╗   ██║    ╚████╔╝ ██║██║ ╚═╝ ██║
          ╚══════╝╚═╝  ╚═╝╚══════╝   ╚═╝     ╚═══╝  ╚═╝╚═╝     ╚═╝
    ]]

    dashboard.section.header.val = vim.split(logo, "\n")
    -- stylua: ignore
    dashboard.section.buttons.val = {
      dashboard.button("f", " " .. " Find file",     "<cmd>lua require('telescope.builtin').find_files()<cr>"),
      dashboard.button("n", " " .. " New file",       [==[<cmd> ene <BAR> startinsert <cr>]==]),
      dashboard.button("r", " " .. " Recent files",   "<cmd>lua require('telescope.builtin').oldfiles()<cr>"),
      dashboard.button("g", " " .. " Find text",      "<cmd>lua require('telescope.builtin').live_grep()<cr>"),
      dashboard.button("c", " " .. " Config",         "<cmd>lua require('telescope.builtin').find_files({ cwd = vim.fn.stdpath('config') })<cr>"),
      dashboard.button("s", " " .. " Restore Session", [==[<cmd> lua require("persistence").load() <cr>]==]),
      dashboard.button("l", "󰒲 " .. " Lazy",           "<cmd> Lazy <cr>"),
      dashboard.button("q", " " .. " Quit",           "<cmd> qa <cr>"),
    }
    for _, button in ipairs(dashboard.section.buttons.val) do
      button.opts.hl = "AlphaButtons"
      button.opts.hl_shortcut = "AlphaShortcut"
    end
    dashboard.section.header.opts.hl = "AlphaHeader"
    dashboard.section.buttons.opts.hl = "AlphaButtons"
    dashboard.section.footer.opts.hl = "AlphaFooter"
    dashboard.opts.layout[1].val = 8
    return dashboard
  end,
  config = function(_, dashboard)
    require("alpha").setup(dashboard.opts)

    vim.api.nvim_create_autocmd("User", {
      once = true,
      pattern = "LazyDone",
      callback = function()
        local stats = require("lazy").stats()
        local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
        dashboard.section.footer.val = "⚡ Neovim loaded "
          .. stats.loaded
          .. "/"
          .. stats.count
          .. " plugins in "
          .. ms
          .. "ms"
        pcall(vim.cmd.AlphaRedraw)
      end,
    })
  end,
}
