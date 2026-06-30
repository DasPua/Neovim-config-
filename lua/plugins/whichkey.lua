-- ===============================================================================================-- ================================================================================================
-- TITLE : which-key
-- ABOUT : WhichKey helps you remember your Neovim keymaps, by showing keybindings as you type.
-- LINKS :
--   > github : https://github.com/folke/which-key.nvim
-- ================================================================================================
return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	dependencies = {
		"nvim-tree/nvim-web-devicons", -- for file icons
	},
	keys = {
		{
			"<leader>?",
			function()
				require("which-key").show({ global = false })
			end,
			desc = "Buffer Local Keymaps (which-key)",
		},
	},
	opts = {
		preset = "helix", -- second layout (classic / modern / helix)
		delay = function(ctx)
			return ctx.plugin and 0 or 200
		end,
		win = {
			border = "single",
			no_overlap = true,
			padding = { 1, 1 },
			title = true,
			title_pos = "center",
			zindex = 1000,
		},
		layout = {
			width = { min = 20 },
			spacing = 3,
		},
		icons = {
			breadcrumb = "»",
			separator = "➜",
			group = "+",
			ellipsis = "…",
			mappings = true, -- enable icons from nvim-web-devicons / mini.icons
			colors = true,
			rules = {},
		},
	},
}
