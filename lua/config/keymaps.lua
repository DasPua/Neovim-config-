-- -- ================================================================================================
-- -- TITLE: NeoVim keymaps
-- -- ABOUT: sets some quality-of-life keymaps
-- -- ================================================================================================
--
-- -- Center screen when jumping
-- vim.keymap.set("n", "n", "nzzzv", { desc = "Next search result (centered)" })
-- vim.keymap.set("n", "N", "Nzzzv", { desc = "Previous search result (centered)" })
-- vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = "Half page down (centered)" })
-- vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = "Half page up (centered)" })
--
-- -- Buffer navigation
-- vim.keymap.set("n", "<leader>bn", "<Cmd>bnext<CR>", { desc = "Next buffer" })
-- vim.keymap.set("n", "<leader>bp", "<Cmd>bprevious<CR>", { desc = "Previous buffer" })
--
-- -- Better window navigation
-- vim.keymap.set("n", "<C-h>", "<C-w>h", { desc = "Move to left window" })
-- vim.keymap.set("n", "<C-j>", "<C-w>j", { desc = "Move to bottom window" })
-- vim.keymap.set("n", "<C-k>", "<C-w>k", { desc = "Move to top window" })
-- vim.keymap.set("n", "<C-l>", "<C-w>l", { desc = "Move to right window" })
--
-- -- Splitting & Resizing
-- vim.keymap.set("n", "<leader>sv", "<Cmd>vsplit<CR>", { desc = "Split window vertically" })
-- vim.keymap.set("n", "<leader>sh", "<Cmd>split<CR>", { desc = "Split window horizontally" })
-- vim.keymap.set("n", "<C-Up>", "<Cmd>resize +2<CR>", { desc = "Increase window height" })
-- vim.keymap.set("n", "<C-Down>", "<Cmd>resize -2<CR>", { desc = "Decrease window height" })
-- vim.keymap.set("n", "<C-Left>", "<Cmd>vertical resize -2<CR>", { desc = "Decrease window width" })
-- vim.keymap.set("n", "<C-Right>", "<Cmd>vertical resize +2<CR>", { desc = "Increase window width" })
--
-- -- Better indenting in visual mode
-- vim.keymap.set("v", "<", "<gv", { desc = "Indent left and reselect" })
-- vim.keymap.set("v", ">", ">gv", { desc = "Indent right and reselect" })
--
-- -- Better J behavior
-- vim.keymap.set("n", "J", "mzJ`z", { desc = "Join lines and keep cursor position" })
--
-- -- Quick config editing
-- vim.keymap.set("n", "<leader>rc", "<Cmd>e ~/.config/nvim/init.lua<CR>", { desc = "Edit config" })
--
-- -- File Explorer
-- vim.keymap.set("n", "<leader>m", "<Cmd>NvimTreeFocus<CR>", { desc = "Focus on File Explorer" })
-- vim.keymap.set("n", "<leader>e", "<Cmd>NvimTreeToggle<CR>", { desc = "Toggle File Explorer" })
--
-- -- ================================================================================================
-- -- Run current file (global, works for C/C++/Python/Rust/Lua)
-- -- ================================================================================================
-- local run_opts = { noremap = true, silent = true }
-- vim.keymap.set("n", "<leader>rr", function()
--   local file = vim.fn.expand("%:p")
--   local ext = vim.fn.expand("%:e")
--
--   local cmd
--   if ext == "c" then
--     cmd = string.format("clang %s -o /tmp/a.out && /tmp/a.out", file)
--   elseif ext == "cpp" then
--     cmd = string.format("clang++ %s -o /tmp/a.out && /tmp/a.out", file)
--   elseif ext == "py" then
--     cmd = string.format("python3 %s", file)
--   elseif ext == "rs" then
--     cmd = "cargo run"
--   elseif ext == "lua" then
--     cmd = string.format("lua %s", file)
--   else
--     vim.notify("No run command defined for ." .. ext, vim.log.levels.WARN)
--     return
--   end
--
--   vim.cmd("split | terminal " .. cmd)
-- end,{desc = "Run file"}, run_opts)
--

vim.keymap.set("n", "n", "nzzzv", { desc = "Next search result (centered)" })
vim.keymap.set("n", "N", "Nzzzv", { desc = "Previous search result (centered)" })
vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = "Half page down (centered)" })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = "Half page up (centered)" })

-- Buffer navigation is handled by Telescope (mapped to <leader>tb)
-- vim.keymap.set("n", "<leader>bn", "<Cmd>bnext<CR>", { desc = "Next buffer" })
-- vim.keymap.set("n", "<leader>bp", "<Cmd>bprevious<CR>", { desc = "Previous buffer" })

vim.keymap.set("n", "<C-h>", "<C-w>h", { desc = "Move to left window" })
vim.keymap.set("n", "<C-j>", "<C-w>j", { desc = "Move to bottom window" })
vim.keymap.set("n", "<C-k>", "<C-w>k", { desc = "Move to top window" })
vim.keymap.set("n", "<C-l>", "<C-w>l", { desc = "Move to right window" })

vim.keymap.set("n", "<leader>sv", "<Cmd>vsplit<CR>", { desc = "Split window vertically" })
vim.keymap.set("n", "<leader>sh", "<Cmd>split<CR>", { desc = "Split window horizontally" })

vim.keymap.set("n", "<C-Up>", "<Cmd>resize +2<CR>", { desc = "Increase window height" })
vim.keymap.set("n", "<C-Down>", "<Cmd>resize -2<CR>", { desc = "Decrease window height" })
vim.keymap.set("n", "<C-Left>", "<Cmd>vertical resize -2<CR>", { desc = "Decrease window width" })
vim.keymap.set("n", "<C-Right>", "<Cmd>vertical resize +2<CR>", { desc = "Increase window width" })

vim.keymap.set("v", "<", "<gv", { desc = "Indent left and reselect" })
vim.keymap.set("v", ">", ">gv", { desc = "Indent right and reselect" })

vim.keymap.set("n", "J", "mzJ`z", { desc = "Join lines and keep cursor position" })

vim.keymap.set("n", "<leader>rc", "<Cmd>e ~/.config/nvim/init.lua<CR>", { desc = "Edit config" })
vim.keymap.set("n", "<leader>m", "<Cmd>NvimTreeFocus<CR>", { desc = "Focus on File Explorer" })
vim.keymap.set("n", "<leader>e", "<Cmd>NvimTreeToggle<CR>", { desc = "Toggle File Explorer" })

local run_opts = { noremap = true, silent = true }
vim.keymap.set("n", "<leader>rr", function()
	local file = vim.fn.expand("%:p")
	local ext = vim.fn.expand("%:e")
	local cmd
	if ext == "c" then
		cmd = string.format("clang %s -o /tmp/a.out && /tmp/a.out", file)
	elseif ext == "cpp" then
		cmd = string.format("clang++ %s -o /tmp/a.out && /tmp/a.out", file)
	elseif ext == "py" then
		cmd = string.format("python3 %s", file)
	elseif ext == "rs" then
		cmd = "cargo run"
	elseif ext == "lua" then
		cmd = string.format("lua %s", file)
	else
		vim.notify("No run command defined for ." .. ext, vim.log.levels.WARN)
		return
	end
	vim.cmd("split | terminal " .. cmd)
end, vim.tbl_extend("force", run_opts, { desc = "Run file" }))

-- Plugin Keymaps - Use lazy loading to avoid E729 errors
-- These will be set after plugins load
vim.api.nvim_create_autocmd("User", {
	pattern = "VeryLazy",
	callback = function()
		-- Telescope keymaps
		local telescope_ok, telescope = pcall(require, "telescope.builtin")
		if telescope_ok then
			vim.keymap.set("n", "<leader>ff", telescope.find_files, { desc = "Telescope Find Files" })
			vim.keymap.set("n", "<leader>fg", telescope.live_grep, { desc = "Telescope Live Grep" })
			vim.keymap.set("n", "<leader>fb", telescope.buffers, { desc = "Telescope Buffers" })
			vim.keymap.set("n", "<leader>fh", telescope.help_tags, { desc = "Telescope Help" })
		end

		-- Notify keymap (fixed)
		local notify_ok, notify = pcall(require, "notify")
		if notify_ok then
			vim.keymap.set("n", "<leader>on", function()
				if notify.history then
					notify.history()
				else
					vim.notify("Notify history() not available", vim.log.levels.WARN)
				end
			end, { desc = "Notification History" })
		end
	end,
})
