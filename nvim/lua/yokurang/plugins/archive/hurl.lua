return {
	"jellydn/hurl.nvim",
	dependencies = { "MunifTanjim/nui.nvim" },
	ft = "hurl",
	opts = {
		-- Show debugging info
		debug = false,
		-- Show response in popup or split
		mode = "split",
		-- Default formatter
		formatters = {
			json = { "jq" }, -- Make sure you have install jq in your system, e.g: brew install jq
			html = {
				"prettier", -- Make sure you have install prettier in your system, e.g: npm install -g prettier
				"--parser",
				"html",
			},
		},
	},
	keys = {
		-- Run API request
		{ "<leader>A", "<cmd>HurlRunner<CR>", desc = "Run All requests" },
		{ "<leader>a", "<cmd>HurlRunnerAt<CR>", desc = "Run Api request" },
		{ "<leader>te", "<cmd>HurlRunnerToEntry<CR>", desc = "Run Api request to entry" },
		{ "<leader>tm", "<cmd>HurlToggleMode<CR>", desc = "Hurl Toggle Mode" },
		{ "<leader>tv", "<cmd>HurlVerbose<CR>", desc = "Run Api in verbose mode" },
		-- Run Hurl request in visual mode
		{ "<leader>h", ":HurlRunner<CR>", desc = "Hurl Runner", mode = "v" },
	},
	config = function()
		require("hurl").setup({
			debug = true, -- Enable to show detailed logs
			mode = "popup", -- Change to 'popup' to display responses in a popup window
			env_file = { "vars.env" }, -- Change this to use a different environment file name
			formatters = {
				json = { "jq" }, -- Customize the JSON formatter command
				html = {
					"prettier", -- Customize the HTML formatter command
					"--parser",
					"html",
				},
			},
		})
	end,
}
