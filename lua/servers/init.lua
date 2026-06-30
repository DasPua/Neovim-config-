local on_attach = require("utils.lsp").on_attach

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
	settings = {
		Lua = {
			diagnostics = {
				globals = { "vim" },
			},
			workspace = {
				checkThirdParty = false,
				library = {
					vim.fn.expand("$VIMRUNTIME/lua"),
					vim.fn.stdpath("config") .. "/lua",
				},
			},
			telemetry = {
				enable = false,
			},
		},
	},
}

require("servers.clangd")

vim.lsp.config.pyright = {
	cmd = { "pyright-langserver", "--stdio" },
	filetypes = { "python" },
	root_markers = {
		".git",
		"pyproject.toml",
		"setup.py",
		"requirements.txt",
	},
	on_attach = on_attach,
}

vim.lsp.enable("lua_ls")
vim.lsp.enable("clangd")
vim.lsp.enable("pyright")
