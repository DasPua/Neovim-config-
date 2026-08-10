return {
	"folke/noice.nvim",
	event = "VeryLazy",
	dependencies = {
		"MunifTanjim/nui.nvim",
		"nvim-lua/plenary.nvim",
		"rcarriga/nvim-notify",
	},
	config = function()
		require("notify").setup({
			background_colour = "NormalFloat",
			render = "compact",
			timeout = 3000,
			top_down = false,
		})

		require("noice").setup({
			presets = {
				command_palette = true,
				long_message_to_split = true,
				lsp_doc_border = true,
			},
			cmdline = {
				enabled = true,
				view = "cmdline_popup",
				opts = {
					border = {
						style = "rounded",
					},
				},
			},
			messages = {
				enabled = true,
			},
			views = {
				notify = {
					replace = true,
				},
			},
			lsp = {
				progress = {
					enabled = true,
					format = "lsp_progress",
					format_done = "lsp_progress_done",
					view = "notify",
				},
				signature = {
					enabled = false,
				},
				hover = {
					enabled = true,
				},
			},
			routes = {
				{
					filter = { event = "msg_show", kind = "", find = "written" },
					opts = { skip = true },
				},
			},
		})
	end,
}
