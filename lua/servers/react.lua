local on_attach = require("utils.lsp").on_attach

local capabilities = require("blink.cmp").get_lsp_capabilities()

vim.lsp.config.vtsls = {
	cmd = { "vtsls", "--stdio" },

	filetypes = {
		"javascript",
		"javascriptreact",
		"typescript",
		"typescriptreact",
	},

	root_markers = {
		"package.json",
		"tsconfig.json",
		"jsconfig.json",
		".git",
	},

	on_attach = on_attach,
	capabilities = capabilities,
}
