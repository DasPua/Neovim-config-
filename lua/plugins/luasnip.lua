return {
	"L3MON4D3/LuaSnip",
	version = "v2.*",
	build = "make install_jsregexp",

	dependencies = {
		"rafamadriz/friendly-snippets",
	},

	config = function()
		local ls = require("luasnip")

		ls.config.set_config({
			history = true,
			updateevents = "TextChanged,TextChangedI",
			enable_autosnippets = false,
		})

		require("luasnip.loaders.from_vscode").lazy_load()

		require("luasnip.loaders.from_lua").lazy_load({
			paths = { vim.fn.stdpath("config") .. "/lua/snippets" },
		})

		vim.keymap.set({ "i", "s" }, "<C-l>", function()
			if ls.expand_or_jumpable() then
				ls.expand_or_jump()
			end
		end, { desc = "LuaSnip Expand or Jump" })

		vim.keymap.set({ "i", "s" }, "<C-h>", function()
			if ls.jumpable(-1) then
				ls.jump(-1)
			end
		end, { desc = "LuaSnip Jump Back" })

		vim.keymap.set("i", "<C-e>", function()
			if ls.choice_active() then
				ls.change_choice(1)
			end
		end, { desc = "LuaSnip Next Choice" })
	end,
}
