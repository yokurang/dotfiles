return {
	"tomtomjhj/vscoq.nvim",
	dependencies = {
		"whonore/Coqtail",
		"nvim/nvim-lspconfig",
	},
	config = function()
		require("vscoq").setup()
	end,
}
