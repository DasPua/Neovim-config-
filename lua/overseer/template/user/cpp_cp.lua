return {
	name = "C++ CP Run",
	builder = function()
		local file = vim.fn.expand("%:p")
		local out = vim.fn.expand("%:p:r")
		local dir = vim.fn.expand("%:p:h")
		local input = dir .. "/input.txt"
		local output = dir .. "/output.txt"

		return {
			cmd = {
				"bash",
				"-c",
				table.concat({
					"g++",
					"-g",
					"-std=c++20",
					"-O0",
					"-Wall",
					"-Wextra",
					file,
					"-o",
					out,
					"&&",
					out,
					"<",
					input,
					">",
					output,
				}, " "),
			},

			components = {
				"default",
				{
					"on_output_quickfix",
					open = false,
					open_height = 8,
					items_only = true, -- only keep actual error/warning entries
				},
				{
					"on_complete_notify",
					statuses = { "SUCCESS", "FAILURE" },
					callback = function()
						vim.schedule(function()
							vim.cmd("checktime")
						end)
					end,
				},
			},
		}
	end,

	condition = {
		filetype = { "cpp" },
	},
}
