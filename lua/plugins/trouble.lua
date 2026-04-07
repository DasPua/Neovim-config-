-- ================================================================================================
-- TITLE : trouble.nvim
-- ABOUT : A pretty diagnostics, references, quickfix and location list viewer for Neovim.
-- LINKS :
--   > github : https://github.com/folke/trouble.nvim
-- ================================================================================================

return {
	"folke/trouble.nvim",
	cmd = "Trouble",
	lazy = true,
	opts = {
		auto_close = false,
		auto_preview = true,
		focus = true,
		keys = {
			["q"] = "close",
			["<esc>"] = "close",
			["<cr>"] = "jump_close",
			["o"] = "jump",
			["p"] = "toggle_preview",
			["}"] = "next",
			["{"] = "prev",
			["?"] = "help",
		},
		modes = {
			diagnostics = {
				mode = "diagnostics",
				win = {
					type = "float",
					relative = "editor",
					border = "rounded",
					title = " Diagnostics ",
					title_pos = "center",
					position = { 0.5, 0.5 },
					size = { width = 0.9, height = 0.9 },
					zindex = 200,
				},
				preview = {
					type = "float",
					relative = "win",
					border = "rounded",
					title = "Preview",
					title_pos = "center",
					position = { 0, 2 },
					size = { width = 0.5, height = 0.5 },
					zindex = 150,
				},
				-- Show filename (basename), line and column before the message
				format = "{severity_icon} {filename:basename}:{lnum}:{col} {message:md} {item.source} {item.code}",
				groups = {},
				-- Sort by severity (errors first)
				sort = { "severity", "filename", "pos" },
			},
		},
	},
	keys = {
		{
			"<leader>xx",
			"<cmd>Trouble diagnostics toggle focus=true<cr>",
			desc = "Workspace Diagnostics (Trouble)",
		},
		{
			"<leader>xw",
			"<cmd>Trouble diagnostics toggle filter.buf=0 focus=true<cr>",
			desc = "Buffer Diagnostics (Trouble)",
		},
		{
			"<leader>cs",
			"<cmd>Trouble symbols toggle<cr>",
			desc = "Symbols (Trouble)",
		},
		{
			"<leader>cl",
			"<cmd>Trouble lsp toggle<cr>",
			desc = "LSP Definitions (Trouble)",
		},
	},
}
