return {
  "stevearc/conform.nvim",
  opts = {
    formatters_by_ft = {
      vue = { "prettierd" },
      javascript = { "prettierd" },
      typescript = { "prettierd" },
      javascriptreact = { "prettierd" },
      typescriptreact = { "prettierd" },
      css = { "prettierd" },
      less = { "prettierd" },
      json = { "prettierd" },
      yaml = { "prettierd" },
      html = { "prettierd" },
      nginx = {},
    },
    formatters = {
      prettier = {
        prepend_args = function()
          return { "--tab-width", "4" }
        end,
      },
    },
  },
}
