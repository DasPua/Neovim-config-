local on_attach = require("utils.lsp").on_attach

-- Feed blink's capabilities directly into clangd
local capabilities = require("blink.cmp").get_lsp_capabilities()

vim.lsp.config.clangd = {
	cmd = { "clangd", "--background-index", "--clang-tidy", "--completion-style=detailed", "--header-insertion=never" },
	filetypes = { "c", "cpp", "objc", "objcpp" },
	root_markers = { ".git", "compile_commands.json", "compile_flags.txt", "Makefile" },
	on_attach = on_attach,
	capabilities = capabilities,
}
