return {
	"kevinhwang91/nvim-bqf",
	ft = "qf",
	dependencies = {
		{
			"junegunn/fzf",
			build = "./install --all",
		},
		-- nvim-treesitter is likely already a dependency elsewhere in your config;
		-- only add it here if it isn't installed yet
	},
	opts = {
		preview = {
			auto_preview = true,
			border = "rounded",
			show_title = true,
			win_height = 15,
		},
		func_map = {
			tab = "t",
			split = "s",
			vsplit = "v",
		},
	},
}
