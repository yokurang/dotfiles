return {
	"akinsho/git-conflict.nvim",
	version = "*",
	config = function()
		require("git-conflict").setup({
			default_mappings = {
				ours = "o",
				theirs = "t",
				none = "0",
				both = "b",
				next = "n",
				prev = "p",
			},
		})
	end,
}

