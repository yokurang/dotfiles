return {
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
		config = function()
			vim.cmd([[colorscheme catppuccin]])
			vim.o.background = "dark"
		end,
	},
}

