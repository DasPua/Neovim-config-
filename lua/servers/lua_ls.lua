return {
  settings = {
    Lua = {
      runtime = {
        version = "LuaJIT", -- Neovim uses LuaJIT
      },
      diagnostics = {
        globals = { "vim" }, -- tells LSP that 'vim' is a global
      },
      workspace = {
        library = vim.api.nvim_get_runtime_file("", true), -- more reliable than manual paths
        checkThirdParty = false, -- removes annoying prompt
      },
      telemetry = { enable = false },
    },
  },
}

