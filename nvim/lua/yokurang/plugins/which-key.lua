local Terminal = require("toggleterm.terminal").Terminal

local float_term = Terminal:new({ direction = "float" })

function _G.toggle_float()
	float_term:toggle()
end

local mappings = {
	t = {
		t = { ":ToggleTerm<cr>", "Split Below" },
		f = { toggle_float, "Floating Terminal" },
	},
	f = { ":Telescope find_files<cr>", "Telescope Find Files" },
	r = { ":Telescope live_grep<cr>", "Telescope Live Grep" },
}

local opts = {
	prefix = "<leader>",
}

return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	init = function()
		vim.o.timeout = true
		vim.o.timeoutlen = 500
	end,
	config = function()
		local wk = require("which-key")
		wk.setup({
			plugins = {
				marks = true, -- shows a list of your marks on ' and `
				registers = true, -- shows your registers on " in NORMAL or <C-r> in INSERT mode
				-- the presets plugin, adds help for a bunch of default keybindings in Neovim
				-- No actual key bindings are created
				spelling = {
					enabled = true, -- enabling this will show WhichKey when pressing z= to select spelling suggestions
					suggestions = 20, -- how many suggestions should be shown in the list?
				},
				presets = {
					operators = true, -- adds help for operators like d, y, ... and registers them for motion / text object completion
					motions = true, -- adds help for motions
					text_objects = true, -- help for text objects triggered after entering an operator
					windows = true, -- default bindings on <c-w>
					nav = true,     -- misc bindings to work with windows
					z = true,       -- bindings for folds, spelling and others prefixed with z
					g = true,       -- bindings for prefixed with g
				},
			},
			icons = {
				breadcrumb = "»", -- symbol used in the command line area that shows your active key combo
				separator = "➜", -- symbol used between a key and it's label
				group = "+", -- symbol prepended to a group
			},
			window = {
				border = "none",      -- none, single, double, shadow
				position = "bottom",  -- bottom, top
				margin = { 1, 0, 1, 0 }, -- extra window margin [top, right, bottom, left]
				padding = { 2, 2, 2, 2 }, -- extra window padding [top, right, bottom, left]
			},
			layout = {
				height = { min = 4, max = 25 }, -- min and max height of the columns
				width = { min = 20, max = 50 }, -- min and max width of the columns
				spacing = 3,                -- spacing between columns
				align = "center",           -- align columns left, center or right
			},
			ignore_missing = false,       -- enable this to hide mappings for which you didn't specify a label
		})
		wk.register(mappings, opts)
	end,
}
