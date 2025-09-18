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
  {
    "tadmccorkle/markdown.nvim",
    ft = "markdown", -- or 'event = "VeryLazy"'
    opts = {
      -- configuration here or empty for defaults
    },
  },
  {
    "MeanderingProgrammer/render-markdown.nvim",
    dependencies = { "nvim-treesitter/nvim-treesitter", "echasnovski/mini.nvim" }, -- if you use the mini.nvim suite
    -- dependencies = { 'nvim-treesitter/nvim-treesitter', 'echasnovski/mini.icons' }, -- if you use standalone mini plugins
    -- dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' }, -- if you prefer nvim-web-devicons
    ---@module 'render-markdown'
    ---@type render.md.UserConfig
    opts = {},
  },
}
