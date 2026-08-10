return {
	"nvim-treesitter/nvim-treesitter",

	branch = "main",

	build = ":TSUpdate",

	event = { "BufReadPost", "BufNewFile" },

	config = function()
		local ts = require("nvim-treesitter")

		ts.install({
			"bash",
			"c",
			"cpp",
			"go",
			"lua",
			"markdown",
			"python",
			"rust",
			"vim",
			"vimdoc",
			"query",
			"javascript",
			"typescript",
			"tsx",
			"html",
			"css",
		})

		vim.api.nvim_create_autocmd("FileType", {
			callback = function(args)
				pcall(vim.treesitter.start, args.buf)

				vim.bo[args.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
			end,
		})
	end,
}
