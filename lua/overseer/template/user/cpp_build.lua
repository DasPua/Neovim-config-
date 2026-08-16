return {
	name = "C++ Build & Run",

	builder = function()
		local file = vim.fn.expand("%:p")
		local filename = vim.fn.expand("%:t")
		local out = vim.fn.expand("%:p:r")

		return {
			name = "Build & Run " .. filename,

			cmd = {
				"bash",
				"-c",
				table.concat({
					"g++",
					"-std=c++20",
					"-O2",
					"-Wall",
					"-Wextra",
					file,
					"-o",
					out,
					"&&",
					out,
				}, " "),
			},

			components = {
				{
					"on_output_quickfix",
					open = false,
				},
				"default",
			},
		}
	end,

	condition = {
		filetype = { "cpp" },
	},
}
