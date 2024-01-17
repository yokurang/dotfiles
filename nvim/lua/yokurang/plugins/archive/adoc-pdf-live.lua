return {
	"marioortizmanero/adoc-pdf-live.nvim",
	config = function()
		require("adoc_pdf_live").setup({
			enabled = false,
			-- The viewer command must be like `command <file>`
			viewer = "zathura",
			binary = "asciidoctor-pdf",
			params = "",
			debug = false,
			style = "",
			style_regex = "style\\.ya?ml",
		})
	end,
}
