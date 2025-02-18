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
}
