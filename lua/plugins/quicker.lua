return {
	"stevearc/quicker.nvim",
	ft = "qf",
	---@module "quicker"
	---@type quicker.SetupOptions
	opts = {
		type_icons = {
			E = "✘ ",
			W = "▲ ",
			I = " ",
			N = " ",
			H = " ",
		},
		highlight = {
			treesitter = true,
			lsp = true,
		},
	},
	keys = {
		{
			"<leader>qq",
			function()
				require("quicker").toggle()
			end,
			desc = "Toggle quickfix",
		},
	},
}
