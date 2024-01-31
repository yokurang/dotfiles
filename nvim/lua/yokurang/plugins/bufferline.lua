return {
	"akinsho/bufferline.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	version = "*",
	opts = {
		options = {
			mode = "tabs",
			separator_style = "slant",
		},
	},
	vim.keymap.set("n", "<leader>bn", ":BufferLineCycleNext<CR>"),
	vim.keymap.set("n", "<leader>bp", ":BufferLineCyclePrev<CR>"),
	vim.keymap.set("n", "<leader>be", ":BufferLineSortByExtension<CR>"),
	vim.keymap.set("n", "<leader>bd", ":BufferLinePickClose<CR>"),
	vim.keymap.set("n", "<leader>bc", ":BufferLinePick<CR>"),
}
