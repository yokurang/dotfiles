return {
	{
		"nvim-orgmode/orgmode",
		dependencies = {
			{ "nvim-treesitter/nvim-treesitter", lazy = true },
		},
		event = "VeryLazy",
		config = function()
			-- Load treesitter grammar for org
			require("orgmode").setup_ts_grammar()

			-- Setup treesitter
			require("nvim-treesitter.configs").setup({
				highlight = {
					enable = true,
					additional_vim_regex_highlighting = { "org" },
				},
				ensure_installed = { "org" },
			})

			-- Setup orgmode
			require("orgmode").setup_ts_grammar()
			require("orgmode").setup({
				org_agenda_files = { "~/Documents/notes-org/**/*" },
				org_default_notes_file = "~/Documents/notes-org/refile.org",
			})
		end,
	},
	{
		"akinsho/org-bullets.nvim",
		-- ft = "org",
		lazy = false,
		config = function()
			require("org-bullets").setup({
				concealcursor = true,
				checkboxes = {
					half = { "-", "OrgTSCheckboxHalfChecked" },
					todo = { "×", "OrgTODO" },
				},
			})
		end,
	},
}
