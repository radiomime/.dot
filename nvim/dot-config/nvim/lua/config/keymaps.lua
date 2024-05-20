-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
--
-- NOTE: Remember that Lua is a real programming language, and as such it is possible
-- to define small helper and utility functions so you don't have to repeat yourself.
--
-- local del = function(mode, lhs)
--   vim.keymap.del(mode, lhs)
-- end
-- del("n", "<leader>ww")
vim.keymap.del("n", "<leader>ww")
vim.keymap.del("n", "<leader>wd")
vim.keymap.del("n", "<leader>w-")
vim.keymap.del("n", "<leader>w|")

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
local opts = { noremap = true, silent = true }
vim.keymap.set("n", ";", ":", opts)
vim.keymap.set("n", ":", ";", opts)

------------------------
----- terminal mode ------
------------------------
-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
vim.keymap.set("t", "jk", "<c-\\><c-n>", { desc = "Enter Normal Mode" })
