local util = require("lspconfig.util")
local on_attach = require("utils.lsp").on_attach

return {
  name = "clangd",
  cmd = { "clangd", "--background-index", "--clang-tidy", "--completion-style=detailed", "--header-insertion=never" },
  root_dir = util.root_pattern(".git", "compile_commands.json", "compile_flags.txt", "Makefile") or vim.fn.getcwd(),
  on_attach = on_attach,
  capabilities = vim.lsp.protocol.make_client_capabilities(),
}

