return {
	{ -- This plugin
		"Zeioth/compiler.nvim",
		cmd = { "CompilerOpen", "CompilerToggleResults", "CompilerRedo" },
		dependencies = { "stevearc/overseer.nvim" },
		opts = {},
		-- Open compiler
		vim.api.nvim_set_keymap("n", "<leader>co", "<cmd>CompilerOpen<cr>", { noremap = true, silent = true }),
		-- Redo last selected option
		vim.api.nvim_set_keymap(
			"n",
			"<leader>cr",
			"<cmd>CompilerStop<cr>" -- (Optional, to dispose all tasks before redo)
				.. "<cmd>CompilerRedo<cr>",
			{ noremap = true, silent = true }
		),

		-- Toggle compiler results
		vim.api.nvim_set_keymap("n", "<leader>ct", "<cmd>CompilerToggleResults<cr>", { noremap = true, silent = true }),
	},
	{ -- The task runner we use
		"stevearc/overseer.nvim",
		version = "*",
		cmd = { "CompilerOpen", "CompilerToggleResults", "CompilerRedo" },
		opts = {
			task_list = {
				direction = "bottom",
				min_height = 25,
				max_height = 25,
				default_detail = 1,
			},
		},
	},
}
