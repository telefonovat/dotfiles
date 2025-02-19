-- return {
--   "kelly-lin/ranger.nvim",
--   config = function()
--     require("ranger-nvim").setup({ replace_netrw = false })
--     vim.api.nvim_set_keymap("n", "<leader>ef", "", {
--       noremap = true,
--       callback = function()
--         require("ranger-nvim").open(true)
--       end,
--     })
--   end,
-- }

return {
  "kevinhwang91/rnvimr",
  -- config = function()
  --   require("rnvimr").setup({})
  -- end,
  -- opts = {
  --   rnvimr_enable_ex = true,
  -- },
}
