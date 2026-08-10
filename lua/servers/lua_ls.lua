local on_attach = require("utils.lsp").on_attach
local capabilities = require("blink.cmp").get_lsp_capabilities()

vim.lsp.config.lua_ls = {
	cmd = { "lua-language-server" },

	filetypes = { "lua" },

	root_markers = {
		".git",
		".luarc.json",
		".luacheckrc",
		"stylua.toml",
	},

	on_attach = on_attach,
	capabilities = capabilities,

	settings = {
		Lua = {
			runtime = {
				version = "LuaJIT",
			},

			diagnostics = {
				globals = { "vim" },
			},

			workspace = {
				library = vim.api.nvim_get_runtime_file("", true),
				checkThirdParty = false,
			},

			telemetry = {
				enable = false,
			},
		},
	},
}
