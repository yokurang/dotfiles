local bufnr = 230

vim.api.nvim_buf_set_lines(bufnr, 0, -1, false, {
	"hello",
	"world",
})

vim.api.nvim_create_autocmd(
  "BufWritePost",
  {
    group = vim.api.nvim_create_augroup(
      "BufWritePost",
      { clear = true },
    )
    callback = function()
      print("hello")
    end,

})
