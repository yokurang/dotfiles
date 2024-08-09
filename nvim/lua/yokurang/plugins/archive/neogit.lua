return {
	"NeogitOrg/neogit",
	dependencies = {
		"nvim-lua/plenary.nvim", -- required
		"sindrets/diffview.nvim", -- optional - Diff integration

		-- Only one of these is needed, not both.
		"nvim-telescope/telescope.nvim", -- optional
		"ibhagwan/fzf-lua", -- optional
	},
	vim.keymap.set("n", "<leader>ng", "<cmd>Neogit<cr>", { desc = "Open Neogit" }),
	config = true,
}
