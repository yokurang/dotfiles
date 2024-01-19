return {
	"mrquantumcodes/retrospect.nvim",
	config = function()
		local retrospect = require("retrospect")
		retrospect.setup({
			saveKey = "<leader>\\", -- The shortcut to save the session, default is leader+backslash(\)
			loadKey = "<leader><BS>", -- The shortcut to load the session
			style = "default", -- or "modern", if you have nui.nvim and dressing.nvim
		})
	end,
}
