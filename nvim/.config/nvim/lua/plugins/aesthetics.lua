return {
  {
    "EdenEast/nightfox.nvim",

    config = function()
      vim.g.theme_transparent = true
      local nightfox = require("nightfox")
      nightfox.setup({
        options = {
          transparent = true,

          styles = {
            comments = "italic",
          },

          inverse = {
            visual = false,
          },
        },

        palettes = {
          nightfox = {
            -- comment = "#11deed",
            sel0 = "#2b3451",
          },
        },
      })

      local function toggle_theme_transparency()
        vim.g.theme_transparent = not vim.g.theme_transparent
        nightfox.setup({
          options = {
            transparent = vim.g.theme_transparent,
          },
        })
      end

      vim.keymap.set("n", "<leader>ct", toggle_theme_transparency, {
        desc = "toggle transparency",
      })

      vim.cmd("colorscheme nightfox")
    end,
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
