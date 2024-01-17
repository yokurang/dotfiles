return {
	"monkoose/nvlime",
	config = function()
		require("cmp").setup.filetype({ "lisp" }, {
			sources = {
				{ name = "nvlime" },
				-- other sources like path or buffer, etc.
				-- .
				-- .
			},
		})
	end,
}
