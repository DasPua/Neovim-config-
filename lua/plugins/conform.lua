return {
	"stevearc/conform.nvim",
	event = { "BufWritePre" },
	opts = {
		formatters_by_ft = {
			c = { "clang_format" },
			cpp = { "clang_format" },
			lua = { "stylua" },
			python = { "black" },
			javascript = { "prettier" },
			javascriptreact = { "prettier" },

			typescript = { "prettier" },
			typescriptreact = { "prettier" },

			css = { "prettier" },
			scss = { "prettier" },
			html = { "prettier" },
			json = { "prettier" },
			yaml = { "prettier" },
			markdown = { "prettier" },
		},
		format_on_save = {
			timeout_ms = 500,
			lsp_format = "never",
		},
	},
}
