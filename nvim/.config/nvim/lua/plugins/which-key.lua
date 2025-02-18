return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  opts = {},
  keys = {
    {
      "<leader>e",
      function()
        require("which-key").show({ global = false })
      end,
      desc = "Telescope Easy Edit",
    },
    {
      "<leader>i",
      function()
        require("which-key").show({ global = false })
      end,
      desc = "Quick Info",
    },
  },
}
