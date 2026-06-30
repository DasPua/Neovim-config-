local M = {}
M.on_attach = function(client, bufnr)
	vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "rounded" })
	vim.lsp.handlers["textDocument/signatureHelp"] =
		vim.lsp.with(vim.lsp.handlers.signature_help, { border = "rounded" })

	if not client then
		vim.notify("LSP on_attach missing client", vim.log.levels.WARN)
		return
	end
	local map = function(keys, func, desc, mode)
		mode = mode or "n"
		vim.keymap.set(mode, keys, func, {
			buffer = bufnr,
			silent = true,
			desc = desc,
		})
	end
	-- LSP
	map("gd", vim.lsp.buf.definition, "Goto Definition")
	-- map("gD", vim.lsp.buf.declaration, "Goto Declaration")
	-- map("gr", vim.lsp.buf.references, "Goto References")
	map("gi", vim.lsp.buf.implementation, "Goto Implementation")
	map("K", vim.lsp.buf.hover, "Hover Documentation")
	map("<leader>ca", vim.lsp.buf.code_action, "Code Action")
	map("<leader>rn", vim.lsp.buf.rename, "Rename Symbol")
	map("<leader>cf", function()
		require("conform").format({ async = true, bufnr = bufnr })
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
				require("conform").format({ bufnr = bufnr })
			end, 100)
		end, "Organize Imports")
	end
end
return M
