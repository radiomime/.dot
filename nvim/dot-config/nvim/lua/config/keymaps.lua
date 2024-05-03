-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

------------------------
----- insert mode ------
------------------------
-- insert -> normal mode heaven
vim.keymap.set("i", "jk", "<esc>", { silent = true })
vim.keymap.set("i", "kj", "<ESC>", { silent = true })

------------------------
----- normal mode ------
------------------------
-- Better window movement
-- keymap("n", "<C-h>", "<C-w>h", opts)
-- keymap("n", "<C-j>", "<C-w>j", opts)
-- keymap("n", "<C-k>", "<C-w>k", opts)
-- keymap("n", "<C-l>", "<C-w>l", opts)
-- local keymap = vim.api.nvim_set_keymap

-- ; to : for ease of use, but keep ; as an option
vim.keymap.set("n", ";", ":", opts)
vim.keymap.set("n", ":", ";", opts)
