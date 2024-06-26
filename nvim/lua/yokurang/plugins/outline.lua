return {
	"hedyhli/outline.nvim",
	lazy = true,
	cmd = { "Outline", "OutlineOpen" },
	keys = { -- Example mapping to toggle outline
		{ "<leader>o", "<cmd>Outline<CR>", desc = "Toggle outline" },
	},
	opts = {
		highlight_hovered_item = true,
		show_guides = true,
		auto_preview = true,
		position = "left",
		width = 30,
		show_numbers = false,
		show_relative_numbers = false,
		show_symbol_details = true,
		show_file_icon = true,
		show_git_blame = true,
		git_blame_prefix = " ",
		show_fold_symbols = true,
		show_current_context = true,
		lsp_blacklist = {},
		symbols = {
			Class = " ",
			Color = " ",
			Constant = "ﲀ ",
			Constructor = " ",
			Enum = "練",
			EnumMember = " ",
			Event = " ",
			Field = "ﰠ ",
			File = "",
			Folder = " ",
			Function = " ",
			Interface = " ",
			Keyword = " ",
			Method = "ƒ ",
			Module = " ",
			Operator = "",
			Property = " ",
			Reference = " ",
			Snippet = " ",
			Struct = " ",
			Text = " ",
			TypeParameter = "",
			Unit = " ",
			Value = " ",
			Variable = " ",
		},
		symbols_outline = {
			Class = " ",
			Color = " ",
			Constant = "ﲀ ",
			Constructor = " ",
			Enum = "練",
			EnumMember = " ",
			Event = " ",
			Field = "ﰠ ",
			File = "",
			Folder = " ",
			Function = " ",
			Interface = " ",
			Keyword = " ",
			Method = "ƒ ",
			Module = " ",
			Operator = "",
			Property = " ",
			Reference = " ",
			Snippet = " ",
			Struct = " ",
			Text = " ",
			TypeParameter = "",
			Unit = " ",
			Value = " ",
			Variable = " ",
		},
	},
}

