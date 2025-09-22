local global_installed_path = "/usr/local/lib/node_modules"
local tsserver_filetypes = { "typescript", "javascript", "javascriptreact", "typescriptreact", "vue" }

local vue_typescript_plugin = {
  name = "@vue/typescript-plugin",
  location = global_installed_path .. "/@vue/typescript-plugin",
  languages = { "vue" },
  enableForWorkspaceTypeScriptVersions = true,
  configNamespace = "typescript",
}

---@type vim.lsp.Config
local based_pyright_config = {
  filetypes = { "python" },
}

---@type vim.lsp.Config
local ruff_config = {
  filetypes = { "python" },
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
  filetypes = tsserver_filetypes,
}

---@type vim.lsp.Config
local cssls_config = {
  filetypes = {
    "css",
  },
}

---@type vim.lsp.Config
local volar_config = {
  root_markers = { "package.json" },
  on_init = function(client)
    client.handlers["tsserver/request"] = function(_, result, context)
      local ts_clients = vim.lsp.get_clients({ bufnr = context.bufnr, name = "ts_ls" })
      local vtsls_clients = vim.lsp.get_clients({ bufnr = context.bufnr, name = "vtsls" })
      local clients = {}

      vim.list_extend(clients, ts_clients)
      vim.list_extend(clients, vtsls_clients)

      if #clients == 0 then
        vim.notify(
          "Could not find `vtsls` or `ts_ls` lsp client, `vue_ls` would not work without it.",
          vim.log.levels.ERROR
        )
        return
      end
      local ts_client = clients[1]

      local param = unpack(result)
      local id, command, payload = unpack(param)
      ts_client:exec_cmd({
        title = "vue_request_forward", -- You can give title anything as it's used to represent a command in the UI, `:h Client:exec_cmd`
        command = "typescript.tsserverRequest",
        arguments = {
          command,
          payload,
        },
      }, { bufnr = context.bufnr }, function(_, r)
        local response = r and r.body
        -- TODO: handle error or response nil here, e.g. logging
        -- NOTE: Do NOT return if there's an error or no response, just return nil back to the vue_ls to prevent memory leak
        local response_data = { { id, response } }

        ---@diagnostic disable-next-line: param-type-mismatch
        client:notify("tsserver/response", response_data)
      end)
    end
  end,
}

---@type vim.lsp.Config
local json_lsp_config = {
  filetypes = { "json" },
}

---@type vim.lsp.Config
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
vim.lsp.config("volar", volar_config)
vim.lsp.config("cssls", cssls_config)
vim.lsp.config("jsonls", json_lsp_config)
vim.lsp.config("basedpyright", based_pyright_config)
vim.lsp.config("ruff", ruff_config)

vim.lsp.enable({ "vtsls", "rust_analyzer", "cssls", "volar", "jsonls", "basedpyright", "ruff" })
