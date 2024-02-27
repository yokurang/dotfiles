return {
	{ "chrisbra/csv.vim" },
	{
		"cameron-wags/rainbow_csv.nvim",
		config = true,
		ft = {
			"csv",
			"tsv",
			"csv_semicolon",
			"csv_whitespace",
			"csv_pipe",
			"rfc_csv",
			"rfc_semicolon",
		},
		cmd = {
			"RainbowDelim",
			"RainbowDelimSimple",
			"RainbowDelimQuoted",
			"RainbowMultiDelim",
		},
	},
	{
		"vidocqh/data-viewer.nvim",
		opts = {},
		dependencies = {
			"nvim-lua/plenary.nvim",
			"kkharji/sqlite.lua", -- Optional, sqlite support
		},
		config = function()
			require("data-viewer").setup({
				autoDisplayWhenOpenFile = false,
				maxLineEachTable = 100,
				columnColorEnable = true,
				columnColorRoulette = { -- Highlight groups
					"DataViewerColumn0",
					"DataViewerColumn1",
					"DataViewerColumn2",
				},
				view = {
					float = true, -- False will open in current window
					width = 0.8, -- Less than 1 means ratio to screen width, valid when float = true
					height = 0.8, -- Less than 1 means ratio to screen height, valid when float = true
					zindex = 50, -- Valid when float = true
				},
				keymap = {
					quit = "q",
					next_table = "<C-l>",
					prev_table = "<C-h>",
				},
				["filetypes"] = {
					["csv"] = "csv",
					["tsv"] = "csv",
					["csv_semicolon"] = "csv",
					["csv_whitespace"] = "csv",
					["csv_pipe"] = "csv",
					["rfc_csv"] = "csv",
					["rfc_semicolon"] = "csv",
					["json"] = "json",
					["jsonl"] = "json",
					["jsonc"] = "json",
					["yaml"] = "yaml",
					["toml"] = "toml",
					["xml"] = "xml",
					["html"] = "html",
					["sqlite"] = "sqlite",
				},
				["dataview"] = {
					["enable"] = true,
				},
				["lspinstall"] = {
					["enable"] = true,
				},
				["keymaps"] = {
					["enable"] = true,
				},
				["tree"] = {
					["enable"] = true,
				},
				["icons"] = {
					["enable"] = true,
				},
				["sql"] = {
					["enable"] = true,
				},
				["json"] = {
					["enable"] = true,
				},
				["yaml"] = {
					["enable"] = true,
				},
				["toml"] = {
					["enable"] = true,
				},
				["xml"] = {
					["enable"] = true,
				},
				["html"] = {
					["enable"] = true,
				},
				["sqlite"] = {
					["enable"] = true,
				},
			})
		end,
	},
}
