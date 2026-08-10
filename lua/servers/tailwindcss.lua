local on_attach = require("utils.lsp").on_attach

local capabilities = require("blink.cmp").get_lsp_capabilities()

vim.lsp.config.tailwindcss = {
	on_attach = on_attach,
	capabilities = capabilities,

	settings = {
		tailwindCSS = {
			validate = true,
		},
	},
}
