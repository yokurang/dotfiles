return {
	"simeji/winresizer",
	vim.keymap.set("n", "<leader>rws", "<cmd>WinResizerStartResize<cr>"),
	vim.keymap.set("n", "<leader>rwm", "<cmd>WinResizerStartMove<cr>"),
	vim.keymap.set("n", "<leader>rwf", "<cmd>WinResizerStartFocus<cr>"),
	config = function()
		vim.g.winresize_gui_enabled = 1
	end,
}
