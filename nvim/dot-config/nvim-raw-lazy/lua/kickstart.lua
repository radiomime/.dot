--[[
Things I learned in tutor and kickstart...

- To undo all the changes on a line, type:   `U`{normal}  (capital U)

 1. [:!command](:!cmd) executes an external command.
 4. [:r](:r) FILENAME              retrieves disk file FILENAME and puts it
                             below the cursor position.
 5. [:r !dir](:r!)                  reads the output of the dir command and
                             puts it below the cursor position.
 5. Typing a capital `R`{normal} enters Replace mode until `<Esc>`{normal} is
     pressed.




If you experience any errors while trying to install kickstart, run `:checkhealth` for more info.

I hope you enjoy your Neovim journey,
- TJ

P.S. You can delete this when you're done too. It's your config now! :)
--]]
--

-- Set <space> as the leader key
-- See `:help mapleader`
-- --  NOTE: Must happen before plugins are loaded (otherwise wrong leader will be used)
-- vim.g.mapleader = " "
-- vim.g.maplocalleader = " "

-- -- Set to true if you have a Nerd Font installed and selected in the terminal
-- vim.g.have_nerd_font = false

-- [[ Setting options ]]
-- See `:help vim.opt`
-- NOTE: You can change these options as you wish!
--  For more options, you can see `:help option-list`

-- -- [[ Basic Autocommands ]]
-- --  See `:help lua-guide-autocommands`
--
-- -- Highlight when yanking (copying) text
-- --  Try it with `yap` in normal mode
-- --  See `:help vim.highlight.on_yank()`
-- vim.api.nvim_create_autocmd("TextYankPost", {
--   desc = "Highlight when yanking (copying) text",
--   group = vim.api.nvim_create_augroup(
--     "kickstart-highlight-yank",
--     { clear = true }
--   ),
--   callback = function()
--     vim.highlight.on_yank()
--   end,
-- })
