return {
	"folke/tokyonight.nvim",
	lazy = false,
	priority = 1000,
	config = function()
		require("tokyonight").setup({
			style = "storm", -- this is the variant
			transparent = false,
			styles = {
				sidebars = "dark",
				floats = "dark",
			},
		})

		vim.cmd.colorscheme("tokyonight")
	end,
}
