-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

return {
  {
    "LazyVim/LazyVim",
    opts = {
      keys = {
        { "<Tab>", "<cmd>bnext<cr>", desc = "Next buffer" },
        { "<S-Tab>", "<cmd>bprevious<cr>", desc = "Previous buffer" },
      },
    },
  },
}
