return {
  "iamcco/markdown-preview.nvim",
  cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
  ft = { "markdown" },
  build = function() vim.fn["mkdp#util#install"]() end,
  config = function()
  vim.g.mkdp_auto_start = 1
  vim.g.mkdp_auto_close = 1
  vim.g.mkdp_refresh_slow = 1
  vim.g.mkdp_open_to_the_world = 1

  local keymap = vim.keymap
  keymap.set('n', '<leader>mp', '<cmd>MarkdownPreviewToggle<cr>')
  keymap.set('n', '<leader>ms', '<cmd>MarkdownPreviewStop<cr>')
  end,
}
