return {
	"HiPhish/nvim-ts-rainbow2",
	config = function()
		require("nvim-treesitter.configs").setup({
			rainbow = {
				enable = true,
				extended_mode = true, -- Highlight also non-parentheses delimiters, boolean or table: lang -> boolean
				-- Which query to use for finding delimiters
				query = "rainbow-parens",
				-- Highlight the entire buffer all at once
				strategy = require("ts-rainbow").strategy.global,
			},
		})
	end,
}
