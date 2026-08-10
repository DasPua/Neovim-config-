-- lua/plugins/telescope-nvim.lua
return {
	"nvim-telescope/telescope.nvim",
	branch = "master",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons",
		{
			"nvim-telescope/telescope-fzf-native.nvim",
			build = "make",
			cond = function()
				return vim.fn.executable("make") == 1
			end,
		},
	},
	cmd = "Telescope",
	config = function()
		local telescope = require("telescope")
		local actions = require("telescope.actions") -- Make sure to require actions
		telescope.setup({
			defaults = {
				winblend = 0,
				border = true,
				file_ignore_patterns = { "node_modules", ".git/" },
				sorting_strategy = "ascending",
				layout_strategy = "flex",
				layout_config = {
					prompt_position = "top",
					flex = {
						flip_columns = 120, -- Switch from horizontal to vertical at this width
					},
					horizontal = {
						preview_cutoff = 40, -- Keep preview visible down to 40 columns
						preview_width = 0.5,
					},
					vertical = {
						preview_cutoff = 10, -- Keep preview visible down to 10 rows
						preview_height = 0.5,
					},
				},
				mappings = {
					-- Mappings for Insert Mode
					i = {
						["<esc>"] = actions.close,
						["<C-j>"] = actions.move_selection_next,
						["<C-k>"] = actions.move_selection_previous,
						["<C-n>"] = actions.move_selection_next,
						["<C-p>"] = actions.move_selection_previous,
					},
					-- Mappings for Normal Mode
					n = {
						["j"] = actions.move_selection_next,
						["k"] = actions.move_selection_previous,
					},
				},
			},
		})
		pcall(telescope.load_extension, "fzf")
	end,
}
