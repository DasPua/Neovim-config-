-- ================================================================================================
-- TITLE : which-key
-- ABOUT : WhichKey helps you remember your Neovim keymaps, by showing keybindings as you type.
-- LINKS :
--   > github : https://github.com/folke/which-key.nvim
-- ================================================================================================

return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	opts = {},
	config = function()
		local wk = require("which-key")
		wk.setup({})

		-- Set the keymap after plugin loads
		vim.keymap.set("n", "<leader>?", function()
			wk.show({ global = false })
		end, { desc = "Buffer Local Keymaps (which-key)" })
	end,
}
