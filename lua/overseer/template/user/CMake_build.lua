return {
	name = "CMake Build",
	builder = function()
		return {
			cmd = { "cmake", "--build", "build" },
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
