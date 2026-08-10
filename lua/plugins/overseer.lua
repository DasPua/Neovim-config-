return {
	"stevearc/overseer.nvim",
	---@module "overseer"
	opts = {
		task_list = {
			render = function(task)
				return require("overseer.render").format_standard(task)
			end,
		},
		task_win = {
			border = "rounded",
			width = 0.8,
			height = 0.8,
		},
	},
	config = function(_, opts)
		local overseer = require("overseer")
		overseer.setup(opts)

		-- inject quickfix output into any task generated from the make module
		overseer.add_template_hook({
			module = "^make$",
		}, function(task_defn, util)
			util.add_component(task_defn, { "on_output_quickfix", open = true })
		end)
		overseer.add_template_hook({
			module = "^cmake$",
		}, function(task_defn, util)
			util.add_component(task_defn, { "on_output_quickfix", open = true })
		end)
	end,

	keys = {
		{ "<leader>rt", "<cmd>OverseerToggle<CR>", desc = "Toggle Overseer Tasks" },
		{ "<leader>rr", "<cmd>OverseerRun<CR>", desc = "Run Task" },

		{
			"<leader>ra",
			function()
				local overseer = require("overseer")
				local tasks = overseer.list_tasks()

				if vim.tbl_isempty(tasks) then
					vim.notify("No Overseer tasks", vim.log.levels.WARN)
					return
				end

				local icons = {
					SUCCESS = " ",
					FAILURE = " ",
					RUNNING = "󰑮 ",
					CANCELED = "󰜺 ",
					DISPATCHED = "󰑓 ",
				}

				vim.ui.select(tasks, {
					prompt = "Task Actions",
					format_item = function(task)
						local icon = icons[task.status] or "󰈔"
						return string.format("%s  %s", icon, task.name)
					end,
				}, function(task)
					if task then
						overseer.run_action(task)
					end
				end)
			end,
			desc = "Task Actions",
		},
	},
}
