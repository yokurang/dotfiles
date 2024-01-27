return {
	"gsuuon/note.nvim",
	opts = {
		-- Spaces are note roots. These directories should contain a `./notes` directory (will be made if not).
		-- Defaults to { '~' }.
		spaces = {
			"~",
			-- '~/projects/foo'
		},

		-- Set keymap = false to disable keymapping
		-- keymap = {
		--   prefix = '<leader>n'
		-- }
	},
	cmd = "Note",
	ft = "note",
}
