local M = {}

local diagnostic_signs = {
	Error = " ",
	Warn = " ",
	Hint = "",
	Info = "",
}

M.setup = function()
	vim.diagnostic.config({
		signs = {
			text = {
				[vim.diagnostic.severity.ERROR] = diagnostic_signs.Error,
				[vim.diagnostic.severity.WARN] = diagnostic_signs.Warn,
				[vim.diagnostic.severity.INFO] = diagnostic_signs.Info,
				[vim.diagnostic.severity.HINT] = diagnostic_signs.Hint,
			},
		},
		float = { -- <-- add this block
			border = "rounded",
			source = "if_many",
			header = { " Diagnostics ", "DiagnosticHeader" },
			prefix = "",
		},
		underline = true,
		update_in_insert = true,
		severity_sort = true,
	})
end

return M
