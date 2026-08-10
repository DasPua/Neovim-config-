-- return {
-- 	"folke/tokyonight.nvim",
-- 	lazy = false,
-- 	priority = 1000,
-- 	config = function()
-- 		require("tokyonight").setup({
-- 			style = "night",
-- 			transparent = false,
-- 			styles = {
-- 				sidebars = "dark",
-- 				floats = "dark",
-- 			},
-- 			on_highlights = function(hl, colors)
-- 				hl.LineNrAbove = { fg = colors.fg_dark }
-- 				hl.LineNrBelow = { fg = colors.fg_dark }
-- 				hl.CursorLineNr = { fg = colors.green, bold = true }
-- 			end,
-- 		})
--
-- 		vim.cmd.colorscheme("tokyonight")
--
-- 		-- Base float groups
-- 		vim.api.nvim_set_hl(0, "NormalFloat", { bg = "NONE" })
-- 		vim.api.nvim_set_hl(0, "FloatBorder", { bg = "NONE" })
-- 		vim.api.nvim_set_hl(0, "Pmenu", { bg = "NONE" })
--
-- 		-- which-key
-- 		vim.api.nvim_set_hl(0, "WhichKeyFloat", { bg = "NONE" })
-- 		vim.api.nvim_set_hl(0, "WhichKeyBorder", { bg = "NONE" })
-- 		vim.api.nvim_set_hl(0, "WhichKeyNormal", { bg = "NONE" })
--
-- 		-- blink.cmp
-- 		vim.api.nvim_set_hl(0, "BlinkCmpMenu", { bg = "NONE" })
-- 		vim.api.nvim_set_hl(0, "BlinkCmpMenuBorder", { bg = "NONE" })
-- 		vim.api.nvim_set_hl(0, "BlinkCmpDoc", { bg = "NONE" })
-- 		vim.api.nvim_set_hl(0, "BlinkCmpDocBorder", { bg = "NONE" })
-- 		vim.api.nvim_set_hl(0, "BlinkCmpSignatureHelp", { bg = "NONE" })
-- 		vim.api.nvim_set_hl(0, "BlinkCmpSignatureHelpBorder", { bg = "NONE" })
--
-- 		-- Noice
-- 		vim.api.nvim_set_hl(0, "NoiceCmdlinePopup", { bg = "NONE" })
-- 		vim.api.nvim_set_hl(0, "NoiceCmdlinePopupBorder", { bg = "NONE" })
-- 		vim.api.nvim_set_hl(0, "NoicePopup", { bg = "NONE" })
-- 		vim.api.nvim_set_hl(0, "NoicePopupBorder", { bg = "NONE" })
--
-- 		-- Snacks
-- 		vim.api.nvim_set_hl(0, "SnacksNotifierBg", { bg = "NONE" })
-- 		vim.api.nvim_set_hl(0, "SnacksNotifierBorder", { bg = "NONE" })
-- 		vim.api.nvim_set_hl(0, "SnacksNotifierBgInfo", { bg = "NONE" })
-- 		vim.api.nvim_set_hl(0, "SnacksNotifierBgWarn", { bg = "NONE" })
-- 		vim.api.nvim_set_hl(0, "SnacksNotifierBgError", { bg = "NONE" })
--
-- 		vim.api.nvim_set_hl(0, "SnacksInputBorder", { bg = "NONE" })
-- 		vim.api.nvim_set_hl(0, "SnacksInputNormal", { bg = "NONE" })
-- 		vim.api.nvim_set_hl(0, "SnacksDashboardNormal", { bg = "NONE" })
-- 		vim.api.nvim_set_hl(0, "SnacksNormal", { bg = "NONE" })
-- 	end,
-- }
--
return {
	{
		"catppuccin/nvim",
		name = "catppuccin",
		lazy = false,
		priority = 1000,

		opts = {
			flavour = "mocha", -- latte, frappe, macchiato, mocha

			background = {
				light = "latte",
				dark = "mocha",
			},

			transparent_background = false,
			float = {
				transparent = false,
				solid = false,
			},

			show_end_of_buffer = false,
			term_colors = true,
			dim_inactive = {
				enabled = false,
			},

			styles = {
				comments = { "italic" },
				conditionals = { "italic" },
				loops = {},
				functions = {},
				keywords = {},
				strings = {},
				variables = {},
				numbers = {},
				booleans = {},
				properties = {},
				types = {},
				operators = {},
			},

			auto_integrations = true,

			custom_highlights = function(colors)
				return {
					Normal = { bg = colors.base },

					NormalFloat = { bg = colors.base },
					FloatBorder = { bg = colors.base, fg = colors.surface1 },
					FloatTitle = { bg = colors.base, fg = colors.blue },

					Pmenu = { bg = colors.base },
					PmenuBorder = { bg = colors.base, fg = colors.surface1 },
					PmenuSel = { bg = colors.surface0 },

					BlinkCmpMenu = { bg = colors.base },
					BlinkCmpMenuBorder = { bg = colors.base, fg = colors.surface1 },
					BlinkCmpDoc = { bg = colors.base },
					BlinkCmpDocBorder = { bg = colors.base, fg = colors.surface1 },
					BlinkCmpSignatureHelp = { bg = colors.base },
					BlinkCmpSignatureHelpBorder = { bg = colors.base, fg = colors.surface1 },

					TroubleNormal = { bg = colors.base },
					TroubleNormalNC = { bg = colors.base },
					TroublePreview = { bg = colors.base },
				}
			end,
		},

		config = function(_, opts)
			require("catppuccin").setup(opts)
			vim.cmd.colorscheme("catppuccin")
		end,
	},
}
