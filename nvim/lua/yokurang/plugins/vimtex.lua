return {
	"lervag/vimtex",
	ft = { "tex", "latex" },
	dependencies = {
		"micangl/cmp-vimtex",
		"kdheepak/cmp-latex-symbols",
		"xuhdev/vim-latex-live-preview",
	},
	config = function()
		vim.g["vimtex_view_method"] = "zathura"
		vim.g["vimtex_quickfix_mode"] = 0
		vim.g["vimtex_compiler_method"] = "latexmk"
		-- Ignore mappings
		vim.g["vimtex_mappings_enabled"] = 0

		-- Auto Indent
		vim.g["vimtex_indent_enabled"] = 0

		-- Syntax highlighting
		vim.g["vimtex_syntax_enabled"] = 1

		-- Error suppression:
		-- https://github.com/lervag/vimtex/blob/master/doc/vimtex.txt

		vim.g["vimtex_log_ignore"] = {
			"Underfull",
			"Overfull",
			"specifier changed to",
			"Token not allowed in a PDF string",
		}

		vim.g["vimtex_context_pdf_viewer"] = "zathura"
		vim.g["livepreview_previewer"] = "zathura"
		require("cmp_vimtex").setup({
			additional_information = {
				info_in_menu = true,
				info_in_window = true,
				info_max_length = 60,
				match_against_info = true,
				symbols_in_menu = true,
			},
			bibtex_parser = {
				enabled = true,
			},
		})
	end,
}
