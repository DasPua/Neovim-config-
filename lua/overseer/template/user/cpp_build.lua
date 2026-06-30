return {
	name = "g++ build and run",
	builder = function()
		local file = vim.fn.expand("%:p")
		local out = vim.fn.expand("%:p:r")
		return {
			cmd = { "sh", "-c", "g++ " .. file .. " -o " .. out .. " && " .. out },
			components = { { "on_output_quickfix", open = false }, "default" },
		}
	end,
	condition = {
		filetype = { "cpp" },
	},
}
