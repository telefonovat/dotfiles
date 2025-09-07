return {
  { "mason-org/mason.nvim", version = "^1.0.0" },
  {
    "mason-org/mason-lspconfig.nvim",
    version = "^1.0.0",
    lazy = false,
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = {},
        automatic_installation = false,
        automatic_setup = false,
        automatic_enable = false,
        handlers = nil,
      })
    end,
  },
}
