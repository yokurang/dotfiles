return {
	"simeji/winresizer",
	vim.keymap.set("n", "<leader>wr", "<cmd>WinResizerStartResize<cr>"),
	vim.keymap.set("n", "<leader>wm", "<cmd>WinResizerStartMove<cr>"),
	vim.keymap.set("n", "<leader>wf", "<cmd>WinResizerStartFocus<cr>"),
	config = function()
		vim.g.winresize_gui_enabled = 1
	end,
}
