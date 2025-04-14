return {
  "azratul/live-share.nvim",
  version = "v1.0.0",
  dependencies = {
    "jbyuki/instant.nvim",
  },
  config = function()
    vim.g.instant_username = "JesperW"
    require("live-share").setup({})
  end,
}
