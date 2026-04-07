-- Use the new Neovim 0.11+ vim.lsp.config API
local on_attach = require("utils.lsp").on_attach

-- === lua_ls ===
vim.lsp.config.lua_ls = {
  cmd = { "lua-language-server" },
  filetypes = { "lua" },
  root_markers = { ".git", ".luarc.json", ".luacheckrc", "stylua.toml" },
  on_attach = on_attach,
  settings = {
    Lua = {
      diagnostics = { globals = { "vim" } },
      workspace = {
        checkThirdParty = false,
        library = {
          vim.fn.expand("$VIMRUNTIME/lua"),
          vim.fn.stdpath("config") .. "/lua",
        },
      },
      telemetry = { enable = false },
    },
  },
}

-- === pyright ===
vim.lsp.config.pyright = {
  cmd = { "pyright-langserver", "--stdio" },
  filetypes = { "python" },
  root_markers = { ".git", "pyproject.toml", "setup.py", "requirements.txt" },
  on_attach = on_attach,
}

-- === efm ===
local ok, efm_config = pcall(require, "servers.efm")
if ok then
  efm_config.cmd = { "efm-langserver" }
  efm_config.filetypes = efm_config.filetypes or { "lua", "python", "javascript", "typescript", "json", "markdown" }
  efm_config.root_markers = { ".git", ".efmrc", "Makefile" }
  efm_config.on_attach = on_attach
  vim.lsp.config.efm = efm_config
else
  vim.notify("Failed to load efm.lua config", vim.log.levels.ERROR)
end

-- === clangd ===
local ok, clangd_config = pcall(require, "servers.clangd")
if ok then
  clangd_config.cmd = clangd_config.cmd or { "clangd" }
  clangd_config.filetypes = clangd_config.filetypes or { "c", "cpp", "objc", "objcpp" }
  clangd_config.root_markers = clangd_config.root_markers or { ".git", "compile_commands.json", "compile_flags.txt" }
  clangd_config.on_attach = on_attach
  vim.lsp.config.clangd = clangd_config
else
  vim.notify("Failed to load clangd.lua config", vim.log.levels.ERROR)
end

-- Enable LSP servers for appropriate filetypes
vim.lsp.enable({ "lua_ls", "pyright", "efm", "clangd" })
