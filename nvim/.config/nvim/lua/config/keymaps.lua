-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local set = vim.keymap.set

set("n", "<leader>ic", function()
  print(vim.fn.getcwd())
end, { desc = "Get current working directory" })

set("n", "gr", function()
  vim.lsp.buf.references()
end, { desc = "references" })
