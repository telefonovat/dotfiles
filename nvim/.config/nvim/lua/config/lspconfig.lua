local lspconfig = require("lspconfig")
local mason = require("mason")

mason.setup()

lspconfig.volar.setup({
  filetypes = { "vue" },
  init_options = {
    vue = {
      hybridMode = false,
    },
    -- typescript = {
    --   tsdk = "/usr/local/lib/node_modules/" .. "typescript/lib",
    -- },
  },

  on_attach = function(client)
    client.server_capabilities.documentFormattingProvider = false -- disable formatting
    client.server_capabilities.documentRangeFormattingProvider = false
  end,
})
require("lspconfig").pylsp.setup({})
