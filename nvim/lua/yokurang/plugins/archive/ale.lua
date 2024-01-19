return {
	"dense-analysis/ale",
	config = function()
		vim.g.ale_fix_on_save = 1
		vim.g.ale_completion_enabled = 1
	end,
}
