local on_attach = require("utils.lsp").on_attach
local capabilities = require("blink.cmp").get_lsp_capabilities()

vim.lsp.config.jsonls = {
	cmd = { "vscode-json-language-server", "--stdio" },

	filetypes = {
		"json",
		"jsonc",
	},

	root_markers = {
		".git",
	},

	on_attach = on_attach,
	capabilities = capabilities,

	settings = {
		json = {
			validate = {
				enable = true,
			},
		},
	},
}
