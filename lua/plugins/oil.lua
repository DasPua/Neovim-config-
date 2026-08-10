return {
	"stevearc/oil.nvim",
	lazy = false,

	dependencies = {
		{ "nvim-tree/nvim-web-devicons", opts = {} },
	},

	opts = {
		default_file_explorer = false,

		delete_to_trash = true,
		skip_confirm_for_simple_edits = true,
		prompt_save_on_select_new_entry = true,

		view_options = {
			show_hidden = false,
			natural_order = true,
		},

		float = {
			padding = 0,
			max_width = 60,
			-- max_height = 50,
			border = "rounded",
			win_options = {
				winblend = 0,
			},
		},

		keymaps = {
			["q"] = "actions.close",
			["<CR>"] = "actions.select",
			["<C-v>"] = "actions.select_vsplit",
			["<C-s>"] = "actions.select_split",
			["<C-t>"] = "actions.select_tab",
			["-"] = "actions.parent",
			["`"] = "actions.cd",
			["g."] = "actions.toggle_hidden",
			["<C-r>"] = "actions.refresh",
		},
	},

	config = function(_, opts)
		require("oil").setup(opts)

		local oil = require("oil")

		-- -- Open Oil in the current window
		-- vim.keymap.set("n", "-", oil.open, {
		-- 	desc = "Open Oil",
		-- })

		-- Open Oil as a floating window
		vim.keymap.set("n", "<leader>fo", function()
			oil.open_float()
		end, {
			desc = "Oil Float",
		})
	end,
}
