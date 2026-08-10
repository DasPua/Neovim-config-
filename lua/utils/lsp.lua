local M = {}

M.on_attach = function(client, bufnr)
	local map = function(keys, func, desc, mode)
		mode = mode or "n"
		vim.keymap.set(mode, keys, func, {
			buffer = bufnr,
			silent = true,
			desc = desc,
		})
	end

	local tb = require("telescope.builtin")

	-- LSP Navigation (Telescope)
	map("gd", tb.lsp_definitions, "Definition")
	map("gD", vim.lsp.buf.declaration, "Declaration")
	map("gi", tb.lsp_implementations, "Implementation")
	map("gt", tb.lsp_type_definitions, "Type Definition")

	map("<leader>ca", vim.lsp.buf.code_action, "Code Action")
	map("gn", vim.lsp.buf.rename, "Rename")
	map("K", function()
		vim.lsp.buf.hover()
	end, "Hover")

	-- Symbol Search
	map("<leader>ds", tb.lsp_document_symbols, "Document Symbols")
	map("<leader>ws", tb.lsp_dynamic_workspace_symbols, "Workspace Symbols")

	-- Formatting
	map("<leader>cf", function()
		require("conform").format({
			async = true,
			bufnr = bufnr,
		})
	end, "Format Buffer")

	-- Diagnostics
	map("[d", function()
		vim.diagnostic.jump({
			count = -1,
			float = true,
		})
	end, "Previous Diagnostic")

	map("]d", function()
		vim.diagnostic.jump({
			count = 1,
			float = true,
		})
	end, "Next Diagnostic")

	map("<leader>cd", vim.diagnostic.open_float, "Line Diagnostics")

	-- Organize Imports
	if client:supports_method("textDocument/codeAction") then
		map("<leader>oi", function()
			vim.lsp.buf.code_action({
				context = {
					only = { "source.organizeImports" },
					diagnostics = {},
				},
				apply = true,
			})

			vim.defer_fn(function()
				require("conform").format({
					bufnr = bufnr,
				})
			end, 100)
		end, "Organize Imports")
	end
end

return M
