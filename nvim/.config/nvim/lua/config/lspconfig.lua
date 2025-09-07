local global_installed_path = "/usr/local/lib/node_modules"

local vue_typescript_plugin = {
  name = "@vue/typescript-plugin",
  location = global_installed_path .. "/@vue/typescript-plugin",
  languages = { "typescript", "javascript", "vue" },
  enableForWorkspaceTypeScriptVersions = true,
  configNamespace = "typescript",
}

---@type vim.lsp.Config
local vtsls_config = {
  cmd = { "vtsls", "--stdio" },
  init_options = {
    hostInfo = "neovim",
  },
  settings = {
    vtsls = {
      tsserver = {
        globalPlugins = {
          vue_typescript_plugin,
        },
      },
    },
  },
  filetypes = {
    "typescript",
    "javascript",
    "vue",
  },
  reuse_client = function()
    return true
  end,
}

local rust_analyzer_config = {
  settings = {
    ["rust-analyzer"] = {
      cargo = { allFeatures = true },
      checkOnSave = {
        command = "clippy",
      },
    },
  },
}

vim.lsp.config("rust_analyzer", rust_analyzer_config)
vim.lsp.config("vtsls", vtsls_config)

vim.lsp.enable({ "vtsls", "rust_analyzer" })
