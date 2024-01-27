local opts = {
	padding = false,
	auto_open = false,
	auto_close = false,
}

return {
	"folke/trouble.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	cmd = { "Trouble", "TroubleToggle", "TroubleClose", "TroubleRefresh" },
	vim.keymap.set("n", "<leader>to", "<cmd>TroubleToggle<cr>", { desc = "TroubleToggle" }),
	vim.keymap.set("n", "<leader>rt", "<cmd>TroubleToggle lsp_workspace_diagnostics<cr>", { desc = "TroubleRefresh" }),
	opts = opts,
}
