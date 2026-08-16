return {
	"folke/snacks.nvim",
	priority = 1000,
	lazy = false,
	opts = {
		-- Picker
		picker = {
			enabled = true,
			layout = {
				preset = "dropdown",
			},
		},
		-- File explorer (replaces nvim-tree)
		explorer = {
			enabled = true,
			replace_netrw = true,
		},
		-- Dashboard (replaces alpha)
		dashboard = {
			enabled = true,
			sections = {
				{ section = "header" },
				{ section = "keys", gap = 1 },
				{ section = "startup" },
			},
		},
		-- Buffer deletion (replaces mini.bufremove)
		bufdelete = { enabled = true },
		-- Better notifications (works alongside noice)
		notifier = { enabled = true },
		-- Nice UI for inputs
		input = { enabled = true },
		-- Scrollbar
		scroll = { enabled = true },
		-- Highlight word under cursor (replaces mini.cursorword)
		words = { enabled = true },
	},
	keys = {
		-- File explorer (matching your old nvim-tree keymaps)
		{
			"<leader>e",
			function()
				Snacks.explorer()
			end,
			desc = "Toggle File Explorer",
		},
		{
			"<leader>m",
			function()
				Snacks.explorer({ focus = true })
			end,
			desc = "Focus File Explorer",
		},
		-- Buffer deletion
		{
			"<leader>bd",
			function()
				Snacks.bufdelete()
			end,
			desc = "Delete Buffer",
		},
		-- Notification history (replaces your old notify keymap)
		{
			"<leader>on",
			function()
				Snacks.notifier.show_history()
			end,
			desc = "Notification History",
		},
	},
}
