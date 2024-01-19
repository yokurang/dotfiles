return {
	"mrquantumcodes/bufferchad.nvim",

	-- uncomment if you want fuzzy search with telescope and a modern ui

	dependencies = {
		{ "nvim-lua/plenary.nvim" },
		{ "MunifTanjim/nui.nvim" },
		{ "stevearc/dressing.nvim" },
		{ "nvim-telescope/telescope.nvim" }, -- needed for fuzzy search, but should work fine even without it
	},
	config = function()
		require("bufferchad").setup({
			mapping = "<leader>bb", -- Map any key, or set to NONE to disable key mapping
			mark_mapping = "<leader>bm", -- The keybinding to display just the marked buffers
			order = "LAST_USED_UP", -- LAST_USED_UP (default)/ASCENDING/DESCENDING/REGULAR
			style = "default", -- default, modern (requires dressing.nvim and nui.nvim), telescope (requires telescope.nvim)
			close_mapping = "<Esc><Esc>", -- only for the default style window.
		})
	end,
}
