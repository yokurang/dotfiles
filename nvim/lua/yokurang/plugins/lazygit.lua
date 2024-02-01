return {
	{
		"kdheepak/lazygit.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
		config = function()
			require("telescope").load_extension("lazygit")
		end,
		vim.keymap.set("n", "<leader>tlo", ":LazyGit<CR>"),
		vim.keymap.set("n", "<leader>tlt", ":Telescope lazygit<CR>"),
		vim.keymap.set("n", "<leader>tlf", ":LazyGitFilter<CR>"),
	},
}
