-- Debugging Support
return {
	-- https://github.com/rcarriga/nvim-dap-ui
	"rcarriga/nvim-dap-ui",
	event = "VeryLazy",
	dependencies = {
		-- https://github.com/mfussenegger/nvim-dap
		"mfussenegger/nvim-dap",
		-- https://github.com/theHamsta/nvim-dap-virtual-text
		"theHamsta/nvim-dap-virtual-text", -- inline variable text while debugging
		-- https://github.com/nvim-telescope/telescope-dap.nvim
		"nvim-telescope/telescope-dap.nvim", -- telescope integration with dap
		-- debuggers
		"mfussenegger/nvim-dap-python",
	},
	opts = {
		controls = {
			element = "repl",
			enabled = false,
			icons = {
				disconnect = "",
				pause = "",
				play = "",
				run_last = "",
				step_back = "",
				step_into = "",
				step_out = "",
				step_over = "",
				terminate = "",
			},
		},
		element_mappings = {},
		expand_lines = true,
		floating = {
			border = "single",
			mappings = {
				close = { "q", "<Esc>" },
			},
		},
		force_buffers = true,
		icons = {
			collapsed = "",
			current_frame = "",
			expanded = "",
		},
		layouts = {
			{
				elements = {
					{
						id = "scopes",
						size = 0.5,
					},
					{
						id = "stacks",
						size = 0.34,
					},
					{
						id = "watches",
						size = 0.15,
					},
					{
						id = "breakpoints",
						size = 0.01,
					},
				},
				position = "left",
				size = 50,
			},
			{
				elements = {
					{
						id = "console",
						size = 0.75,
					},
					{
						id = "repl",
						size = 0.25,
					},
				},
				position = "bottom",
				size = 10,
			},
		},
		mappings = {
			edit = "e",
			expand = { "<CR>", "<leader>d" },
			open = "o",
			remove = "d",
			repl = "r",
			toggle = "t",
		},
		render = {
			indent = 1,
			max_value_lines = 100,
		},
	},
	config = function(_, opts)
		local dap = require("dap")
		require("dapui").setup(opts)

		dap.listeners.after.event_initialized["dapui_config"] = function()
			require("dapui").open()
		end

		dap.listeners.before.event_terminated["dapui_config"] = function()
			require("dapui").close()
		end

		dap.listeners.before.event_exited["dapui_config"] = function()
			require("dapui").close()
		end

		vim.keymap.set("n", "<Leader>dt", ":DapToggleBreakpoint<CR>")
		vim.keymap.set("n", "<Leader>dc", ":DapContinue<CR>")
		vim.keymap.set("n", "<Leader>dx", ":DapTerminate<CR>")
		vim.keymap.set("n", "<Leader>do", ":DapStepOver<CR>")

		-- Add dap configurations based on your language/adapter settings
		-- https://github.com/mfussenegger/nvim-dap/wiki/Debug-Adapter-installation
		-- dap.configurations.xxxxxxxxxx = {
		--   {
		--   },
		-- }

		-- Add debuggers
		local path = "~/.local/share/nvim/mason/packages/debugpy/venv/bin/python"
		require("dap-python").setup(path)
	end,
}
