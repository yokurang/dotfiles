return {
	"HiPhish/nvim-ts-rainbow2",
	config = function()
		require("nvim-treesitter.configs").setup({
			rainbow = {
				enable = true,
				extended_mode = true, -- Highlight also non-parentheses delimiters, boolean or table: lang -> boolean
				max_file_lines = 1000, -- Do not enable for files with more than 1000 lines, int
				query = "rainbow-parens",
				strategy = require("ts-rainbow").strategy.global,
			},
		})
	end,
}
