return {
	"neovim/nvim-lspconfig",
	dependencies = {
		{
			"mason-org/mason.nvim",
			opts = {},
		},
		{
			"mason-org/mason-lspconfig.nvim",
			opts = {
				automatic_enable = false, -- stop auto-enabling every installed server
			},
		},
		-- {
		-- 	"j-hui/fidget.nvim",
		-- 	opts = {
		-- 		notification = {
		-- 			window = {
		-- 				avoid = { "NvimTree" },
		-- 			},
		-- 		},
		-- 	},
		-- },
	},
	config = function()
		require("utils.diagnostics").setup()
		require("mason").setup()
		require("mason-lspconfig").setup({
			ensure_installed = {
				"lua_ls",
				"clangd",
				"pyright",
			},
			automatic_enable = false, -- also here to be safe
		})
		require("servers")
	end,
}
