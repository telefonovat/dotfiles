return {
  "ibhagwan/fzf-lua",
  -- optional for icon support
  dependencies = { "nvim-tree/nvim-web-devicons" },
  -- or if using mini.icons/mini.nvim
  -- dependencies = { "echasnovski/mini.icons" },
  config = function()
    local fzf = require("fzf-lua")
    local set = vim.keymap.set

    -- Local context
    set("n", "<leader>ff", function()
      fzf.files({
        cwd = vim.fn.getcwd(),
        hidden = true,
      })
    end, {
      desc = "find files (cwd)",
    })
    set("n", "<leader>fh", function()
      fzf.oldfiles()
    end, {
      desc = "reopen an old file",
    })
    set("n", "<leader>fc", function()
      fzf.blines()
    end, {
      desc = "󰱼 find inside current buffer",
    })
    set("n", "<leader>fb", function()
      fzf.lines()
    end, {
      desc = "󰱼 find inside all open buffers",
    })

    -- Live grep
    set("n", "<leader>/", function()
      fzf.live_grep({
        cwd = vim.fn.getcwd(),
        hidden = true,
      })
    end, {
      desc = "󰱼 live grep current working directory",
    })

    -- Root context
    set("n", "<leader>Ff", function()
      fzf.files({ hidden = true })
    end, {
      desc = "󰈞 find files (root)",
    })

    -- Helpers
    set("n", "<leader>hc", "<cmd>cd %:h<cr>", { desc = "cd to directory of current buffer" })

    -- Quick edit keymaps for config
    local dotfiles_path = "~/dotfiles/"
    set("n", "<leader>en", function()
      fzf.files({
        cwd = dotfiles_path .. "nvim/.config/nvim",
      })
    end, { desc = "  edit neovim config" })
    set("n", "<leader>ek", function()
      fzf.files({
        cwd = dotfiles_path .. "kitty/.config/kitty",
      })
    end, { desc = "  edit kitty config" })
    set("n", "<leader>ec", function()
      fzf.files({
        cwd = dotfiles_path,
      })
    end, { desc = "  open dotfiles" })
    set("n", "<leader>ed", function()
      fzf.files({
        cwd = "~/mission_control/notes/",
      })
    end, {
      desc = "󱨋 open notes",
    })

    fzf.setup({ keymap = {
      fzf = {
        ["ctrl-q"] = "select-all+accept",
      },
    } })
  end,
}
