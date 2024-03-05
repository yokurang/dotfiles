return {
	"cbochs/grapple.nvim",
	config = function()
		-- Lua
		vim.keymap.set("n", "<leader>m", require("grapple").toggle)
		vim.keymap.set("n", "<leader>M", require("grapple").toggle_tags)

		-- User command
		vim.keymap.set("n", "<leader>1", "<cmd>Grapple select index=1<cr>")
	end,
}
