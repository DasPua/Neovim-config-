return {
	name = "C++ Debug Build",

	builder = function()
		local file = vim.fn.expand("%:p")
		local out = vim.fn.expand("%:p:r")

		return {
			cmd = {
				"g++",
				"-std=c++20",
				"-g",
				"-O0",
				"-Wall",
				"-Wextra",
				file,
				"-o",
				out,
			},

			components = {
				{ "on_output_quickfix", open = false },
				"default",
			},
		}
	end,

	condition = {
		filetype = { "cpp" },
	},
}
