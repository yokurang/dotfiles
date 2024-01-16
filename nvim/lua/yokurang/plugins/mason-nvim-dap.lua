return {
	"williamboman/mason.nvim",
	"mfussenegger/nvim-dap",
	"jay-babu/mason-nvim-dap.nvim",
	config = function()
		require("mason").setup()
		require("mason-nvim-dap").setup({
			ensure_installed = {
				"stylua",
				"jq",
				"debugpy",
				"cpptools",
			},
			handlers = {
				function(config)
					-- all sources with no handler get passed here

					-- Keep original functionality
					require("mason-nvim-dap").default_setup(config)
				end,
				python = function(config)
					config.adapters = {
						type = "executable",
						command = "~/.local/share/nvim/mason/packages/debugpy/venv/bin/python",
						args = {
							"-m",
							"debugpy.adapter",
						},
					}
					require("mason-nvim-dap").default_setup(config) -- don't forget this!
				end,
			},
		})
	end,
}
