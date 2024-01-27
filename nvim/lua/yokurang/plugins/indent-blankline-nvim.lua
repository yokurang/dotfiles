return {
	"lukas-reineke/indent-blankline.nvim",
	after = "nvim-treesitter",
	main = "ibl",
	opts = {},
	config = function()
		require("ibl").setup()
	end,
}
