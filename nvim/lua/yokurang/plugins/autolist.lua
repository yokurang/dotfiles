return {
	"gaoDean/autolist.nvim",
	ft = {
		"markdown",
		"text",
		"tex",
		"plaintex",
		"norg",
	},
	config = function()
		require("autolist").setup()

		vim.keymap.set("i", "<tab>", "<cmd>AutolistTab<cr>")
		vim.keymap.set("i", "<s-tab>", "<cmd>AutolistShiftTab<cr>")
		vim.keymap.set("i", "<c-t>", "<c-t><cmd>AutolistRecalculate<cr>") -- an example of using <c-t> to indent
		vim.keymap.set("i", "<CR>", "<CR><cmd>AutolistNewBullet<cr>")
		vim.keymap.set("n", "o", "o<cmd>AutolistNewBullet<cr>")
		vim.keymap.set("n", "O", "O<cmd>AutolistNewBulletBefore<cr>")
		vim.keymap.set("n", "<CR>", "<cmd>AutolistToggleCheckbox<cr><CR>")
		vim.keymap.set("n", "<C-r>", "<cmd>AutolistRecalculate<cr>")

		-- cycle list types with dot-repeat
		vim.keymap.set("n", "<leader>cn", require("autolist").cycle_next_dr, { expr = true })
		vim.keymap.set("n", "<leader>cp", require("autolist").cycle_prev_dr, { expr = true })

		-- if you don't want dot-repeat
		-- vim.keymap.set("n", "<leader>cn", "<cmd>AutolistCycleNext<cr>")
		-- vim.keymap.set("n", "<leader>cp", "<cmd>AutolistCycleNext<cr>")

		-- functions to recalculate list on edit
		vim.keymap.set("n", ">>", ">><cmd>AutolistRecalculate<cr>")
		vim.keymap.set("n", "<<", "<<<cmd>AutolistRecalculate<cr>")
		vim.keymap.set("n", "dd", "dd<cmd>AutolistRecalculate<cr>")
		vim.keymap.set("v", "d", "d<cmd>AutolistRecalculate<cr>")

		local list_patterns = {
			neorg_1 = "%-",
			neorg_2 = "%-%-",
			neorg_3 = "%-%-%-",
			neorg_4 = "%-%-%-%-",
			neorg_5 = "%-%-%-%-%-",
			unordered = "[-+*]", -- - + *
			digit = "%d+[.)]", -- 1. 2. 3.
			ascii = "%a[.)]", -- a) b) c)
			roman = "%u*[.)]", -- I. II. III.
			latex_item = "\\item",
		}

		local default_config = {
			enabled = true,
			colon = { -- if a line ends in a colon
				indent = true, -- if in list and line ends in `:` then create list
				indent_raw = true, -- above, but doesn't need to be in a list to work
				preferred = "-", -- what the new list starts with (can be `1.` etc)
			},
			cycle = { -- Cycles the list type in order
				"-", -- whatever you put here will match the first item in your list
				"*", -- for example if your list started with a `-` it would go to `*`
				"1.", -- this says that if your list starts with a `*` it would go to `1.`
				"1)", -- this all leverages the power of recalculate.
				"a)", -- i spent many hours on that function
				"I.", -- try it, change the first bullet in a list to `a)`, and press recalculate
			},
			lists = { -- configures list behaviours
				-- Each key in lists represents a filetype.
				-- The value is a table of all the list patterns that the filetype implements.
				-- See how to define your custom list below in the readme.
				-- You must put the file name for the filetype, not the file extension
				-- To get the "file name", it is just =:set filetype?= or =:se ft?=.
				markdown = {
					list_patterns.unordered,
					list_patterns.digit,
					list_patterns.ascii, -- for example this specifies activate the ascii list
					list_patterns.roman, -- type for markdown files.
				},
				text = {
					list_patterns.unordered,
					list_patterns.digit,
					list_patterns.ascii,
					list_patterns.roman,
				},
				norg = {
					list_patterns.neorg_1,
					list_patterns.neorg_2,
					list_patterns.neorg_3,
					list_patterns.neorg_4,
					list_patterns.neorg_5,
				},
				tex = { list_patterns.latex_item },
				plaintex = { list_patterns.latex_item },
			},
			checkbox = {
				left = "%[", -- the left checkbox delimiter (you could change to "%(" for brackets)
				right = "%]", -- the right checkbox delim (same customisation as above)
				fill = "x", -- if you do the above two customisations, your checkbox could be (x) instead of [x]
			},

			-- this is all based on lua patterns, see "Defining custom lists" for a nice article to learn them
		}
	end,
}
