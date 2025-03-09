local lspconfig = require("lspconfig")
local mason = require("mason")

mason.setup()

lspconfig.volar.setup({})

lspconfig.ts_ls.setup({
  filetypes = { "typescript", "javascript", "javascriptreact", "typescriptreact", "vue" },
  init_options = {
    plugins = {
      {
        name = "@vue/typescript-plugin",
        location = vim.fn.stdpath("data") .. "/mason/packages/vue-language-server/node_modules/@vue/language-server",
        languages = { "vue" },
      },
    },
  },
})
require("lspconfig").pylsp.setup({})
