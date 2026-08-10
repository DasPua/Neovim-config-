return {
	name = "CMake Configure",
	builder = function()
		return {
			cmd = { "cmake", "-B", "build", "-S", "." },
			components = {
				{ "on_output_quickfix", open = true },
				"default",
			},
		}
	end,
	condition = {
		filetype = { "cpp" },
		callback = function()
			return vim.fn.filereadable("CMakeLists.txt") == 1
		end,
	},
}
