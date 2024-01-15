return {
	{
		"rcarriga/nvim-notify",
		event = "VeryLazy",
		config = function()
			local notify = require("notify")
			notify.setup({
				stages = "fade", -- This controls the stages of the notification's appearance and disappearance.
			})
			vim.notify = notify
		end,
	},
}
