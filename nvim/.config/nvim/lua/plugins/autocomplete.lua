return {
  "saghen/blink.cmp",
  dependencies = { "rafamadriz/friendly-snippets" },

  ---@module 'blink.cmp'
  ---@type blink.cmp.Config
  opts = {
    sources = {
      default = {
        "lsp",
        "path",
        "buffer",
      },
    },
  },
}
