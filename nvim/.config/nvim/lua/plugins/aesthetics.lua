return {
  {
    "scottmckendry/cyberdream.nvim",
    opts = {
      transparent = true,
      overrides = function(colors)
        local bright_red = "#ff3344"
        return {
          ["@property"] = { fg = colors.cyan },
          ["@variable"] = { fg = bright_red },
        }
      end,
    },
  },
  { "nvim-tree/nvim-web-devicons", opts = {} },
}
