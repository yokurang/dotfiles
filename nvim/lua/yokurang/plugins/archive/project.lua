return {
	"ahmedkhalf/project.nvim",

	vim.keymap.set("n", "<leader>pf", "<cmd>Telescope projects<cr>", { desc = "Open Project" }),
	config = function()
		-- lua
		require("nvim-tree").setup({
			sync_root_with_cwd = true,
			respect_buf_cwd = true,
			update_focused_file = {
				enable = true,
				update_root = true,
			},
		})
	end,
}
