return {
	"folke/zen-mode.nvim",
	config = function()
		require("zen-mode").setup({
			window = {
				backdrop = 0.95,
				width = 0.8,
				height = 0.8,
				options = {
					signcolumn = "no",
					number = false,
					relativenumber = false,
					cursorline = false,
					cursorcolumn = false,
					foldcolumn = "0",
					list = false,
				},
			},
			plugins = {
				options = { enabled = true, ruler = false, showcmd = false },
				twilight = { enabled = true },
				gitsigns = { enabled = false },
				tmux = { enabled = false },
				kitty = { enabled = false },
			},
			on_open = function()
				vim.cmd("setlocal signcolumn=no number relativenumber cursorline cursorcolumn foldcolumn=0 list")
				vim.cmd("setlocal winhighlight=Normal:NormalFloat,FloatBorder:NormalFloat")
			end,
			on_close = function()
				vim.cmd("setlocal signcolumn=yes number relativenumber cursorline cursorcolumn foldcolumn=0 list")
				vim.cmd("setlocal winhighlight=Normal:Normal,FloatBorder:Normal")
			end,
		})
	end,
}
