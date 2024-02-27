return {
  "saecki/crates.nvim",
  tag = "stable",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-lua/popup.nvim",
  },
  config = function()
    require("crates").setup({
      popup = {
        border = "rounded",
      },
    })
  end,
}
