return {
	"saghen/blink.cmp",
	-- dependencies = {
	-- 	"rafamadriz/friendly-snippets",
	-- 	"L3MON4D3/LuaSnip",
	-- },
	version = "v0.*",
	opts = {
		appearance = {
			use_nvim_cmp_as_default = true,
			nerd_font_variant = "normal",
		},
		keymap = {
			preset = "none",
			["<C-space>"] = {
				"show",
				"show_documentation",
				"hide_documentation",
			},
			-- Enter behaves normally
			["<CR>"] = { "fallback" },
			-- Use Tab to accept completion
			["<Tab>"] = { "select_and_accept", "fallback" },
			["<C-k>"] = { "select_prev", "fallback" },
			["<C-j>"] = { "select_next", "fallback" },
			["<C-b>"] = { "scroll_documentation_up", "fallback" },
			["<C-f>"] = { "scroll_documentation_down", "fallback" },
		},
		snippets = {
			preset = "luasnip",
		},
		completion = {
			menu = {
				border = "rounded",
				draw = {
					columns = {
						{ "kind_icon" },
						{ "label", "label_description", gap = 1 },
						{ "kind" },
					},
				},
			},
			documentation = {
				auto_show = true,
				auto_show_delay_ms = 100,
				window = {
					border = "rounded",
				},
			},
		},
		signature = {
			enabled = true,
			window = {
				border = "rounded",
			},
		},
		sources = {
			default = { "lsp", "path", "snippets", "buffer" },
		},
		cmdline = {
			enabled = true,
			keymap = {
				preset = "cmdline",
				["<C-space>"] = { "show", "fallback" },
			},
			completion = {
				menu = {
					auto_show = true,
				},
				list = {
					selection = { preselect = false },
				},
			},
			sources = function()
				local type = vim.fn.getcmdtype()
				if type == "/" or type == "?" then
					return { "buffer" }
				end
				if type == ":" then
					return { "cmdline" }
				end
				return {}
			end,
		},
	},
	config = function(_, opts)
		require("blink.cmp").setup(opts)
		-- Remove snippet placeholders when leaving insert mode
		vim.api.nvim_create_autocmd("InsertLeave", {
			callback = function()
				local luasnip = require("luasnip")
				if luasnip.session.current_nodes[vim.api.nvim_get_current_buf()] then
					luasnip.unlink_current()
				end
			end,
		})
	end,
}
