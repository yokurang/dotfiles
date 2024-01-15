return {
	"github/copilot.vim",
	config = function()
		vim.cmd([[highlight CopilotSuggestion ctermfg=8 guifg=white guibg=#5c6370]])
	end,
}
