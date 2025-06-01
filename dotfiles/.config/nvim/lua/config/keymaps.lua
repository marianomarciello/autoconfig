-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local map = vim.keymap.set
local unmap = vim.keymap.del
local wk = require("which-key")

map("n", "<leader>q", "<cmd>quit<cr>", { desc = "General | Quit", silent = true })
map("n", "zz", "<cmd>w<cr>", { desc = "General | Save", silent = true })
map("i", "jk", "<Esc>", { desc = "General | Esc", silent = true })

map("n", "<leader>k", ":wincmd k<CR>", { desc = "General | Go to upper window", silent = true })
map("n", "<leader>j", ":wincmd j<CR>", { desc = "General | Go to lower window", silent = true })
map("n", "<leader>h", ":wincmd h<CR>", { desc = "General | Go to left window", silent = true })
map("n", "<leader>l", ":wincmd l<CR>", { desc = "General | Go to right window", silent = true })
map("n", "<leader>=", ":wincmd =<CR>", { desc = "General | Resize in equal space", silent = true })


wk.add(
-- Sort
  {
    { "<leader>cs", group = "Sort", mode = "v", icon = "" }
  }
)
map("v", "<leader>csa", ":%sort<cr>", { desc = "Ascending" })
map("v", "<leader>csd", ":%sort!<cr>", { desc = "Descending" })
map("v", "<leader>csu", ":%sort u<cr>", { desc = "Unique" })
