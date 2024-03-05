return {
	{
		"miikanissi/modus-themes.nvim",
		priority = 1000,
		config = function()
			-- Default options
			require("modus-themes").setup({
				-- Theme comes in two styles `modus_operandi` and `modus_vivendi`
				-- `auto` will automatically set style based on background set with vim.o.background
				style = "auto",
				variant = "default", -- Theme comes in four variants `default`, `tinted`, `deuteranopia`, and `tritanopia`
				transparent = false, -- Transparent background (as supported by the terminal)
				dim_inactive = false, -- "non-current" windows are dimmed
				styles = {
					-- Style to be applied to different syntax groups
					-- Value is any valid attr-list value for `:help nvim_set_hl`
					comments = { italic = true },
					keywords = { italic = true },
					functions = {},
					variables = {},
				},

				--- You can override specific color groups to use other groups or a hex color
				--- function will be called with a ColorScheme table
				---@param colors ColorScheme
				on_colors = function(colors) end,

				--- You can override specific highlights to use other groups or a hex color
				--- function will be called with a Highlights and ColorScheme table
				---@param highlights Highlights
				---@param colors ColorScheme
				on_highlights = function(highlights, colors) end,
			})
			vim.cmd([[colorscheme kanagawa-dragon]])
			vim.o.background = "dark"
		end,
	},
	{
		"rebelot/kanagawa.nvim",
		config = function()
			-- load the colorscheme here
		end,
	},
	{
		"ellisonleao/gruvbox.nvim",
		priority = 1000,

		opts = ...,
	},
	{
		"catppuccin/nvim",
		name = "catppuccin",
		lazy = false,
		priority = 1000, -- make sure to load this before all the other start plugins
		flavour = "mocha",
		transparent_background = true,
		styles = { -- Handles the styles of general hi groups (see `:h highlight-args`):
			comments = { "italic" }, -- Change the style of comments
		},
	},
	{
		"bluz71/vim-moonfly-colors",
		name = "moonfly",
		lazy = false,
		priority = 1000,
		config = function()
			-- vim.cmd([[colorscheme moonfly]])
		end,
	},
}
