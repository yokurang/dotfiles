return {
	"mrcjkb/rustaceanvim",
	version = "*",
	ft = { "rust" },
	config = function()
		vim.g.rustaceanvim_toolchain = "nightly"
		vim.g.rustaceanvim_racer_completion = 1
		vim.g.rustaceanvim_clippy = 1
		vim.g.rustaceanvim_rustfmt_autosave = 1
		vim.g.rustaceanvim_rustfmt_options = {
			["format_macro_matchers"] = { "derive", "error", "serde" },
			["format_macro_brace_style"] = "AlwaysNextLine",
			["format_with_tabs"] = false,
			["format_write_mode"] = "overwrite",
			["formatting"] = true,
			["normalize_doc_attributes"] = true,
			["normalize_doc_attributes_macro"] = true,
			["normalize_whitespace"] = true,
			["rewrite_doc_comments"] = true,
			["use_field_init_shorthand"] = true,
			["use_try_shorthand"] = true,
		}
		local bufnr = vim.api.nvim_get_current_buf()
		vim.keymap.set("n", "<leader>A", function()
			vim.cmd.RustLsp("codeAction")
		end, { silent = true, buffer = bufnr })
	end,
}

