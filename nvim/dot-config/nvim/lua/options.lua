print("setting options...")

-- [[ Setting options ]]
-- See `:help vim.opt`
-- NOTE: You can change these options as you wish!
--  For more options, you can see `:help option-list`
--

--local options = {
-- vim.opt.laststatus = 2, -- always display the status line
-- vim.opt.exrc = true, -- source .nvimrc or .exrc from current directory when starting vim

-- Sync clipboard between OS and Neovim.
--  Remove this option if you want your OS clipboard to remain independent.
--  See `:help 'clipboard'`
vim.opt.clipboard = "unnamedplus" -- allows neovim to access the system clipboard

-- vim.opt.cmdheight = 1, -- space in the neovim command line for displaying messages
vim.opt.colorcolumn = "80" -- fixes indentline for now

vim.opt.completeopt = { "menuone", "noinsert", "noselect" } -- mostly just for cmp TODO: added noinsert, is this alright?

-- Set highlight on search, but clear on pressing <Esc> in normal mode
vim.opt.hlsearch = false -- highlight all matches on previous search pattern
-- vim.opt.hlsearch = true
-- vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- Case-insensitive searching UNLESS \C or one or more capital letters in the search term
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Preview substitutions live, as you type!
vim.opt.inccommand = "split"

-- Sets how neovim will display certain whitespace characters in the editor.
--  See `:help 'list'`
--  and `:help 'listchars'`
vim.opt.list = true
vim.opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }

-- allow mouse to be used
vim.opt.mouse = "a"

-- vim.opt.pumheight = 10 -- pop up menu height

-- Don't show the mode, it should be in the status line
vim.opt.showmode = false

-- TODO: there are quite a few different indent options. Could be worth looking into this again
vim.opt.cindent = true
vim.opt.breakindent = true

-- Configure how new splits should be opened
vim.opt.splitright = true
vim.opt.splitbelow = true

vim.opt.swapfile = false -- don't create a swap file

-- vim.opt.termguicolors = true -- set term gui colors (most terminals support this)

-- time to wait for a mapped sequence to complete (in milliseconds)
-- displays which-key popup sooner
vim.opt.timeoutlen = 100

-- vim.opt.title = true -- set the title of window to the value of the titlestring
vim.opt.undodir = vim.fn.stdpath("data") .. "/undo" -- set an undo directory
vim.opt.undofile = true -- enable persistent undo

vim.opt.updatetime = 250 -- faster completion (4000ms default)

vim.opt.writebackup = false -- if a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited

vim.opt.expandtab = true -- convert tabs to spaces
vim.opt.shiftwidth = 2 -- the number of spaces inserted for each indentation
vim.opt.tabstop = 2 -- insert 2 spaces for a tab
vim.opt.softtabstop = 0 -- number of spaces that tab uses while editing

vim.opt.cursorline = true -- highlight the current line
vim.opt.number = true -- set numbered lines
vim.opt.relativenumber = true -- set relative numbered lines
vim.opt.numberwidth = 2 -- set number column
vim.opt.signcolumn = "yes" -- always show the sign column, otherwise it would shift the text each time

vim.opt.wrap = false -- display lines as one long line
vim.opt.scrolloff = 20 -- cursor mostly centered
vim.opt.sidescroll = 1 -- scroll sideways 1 column at a time
vim.opt.sidescrolloff = 12 -- keep a buffer on the side when scrolling

--}
-- TODO: is title string cool?
-- vim.opt.titlestring = "%<%F%=%l/%L - nvim" -- what the title of the window will be set to
vim.opt.shortmess:append("c")

-- move to the previous/next line after reaching first/last character in the line
vim.cmd("set whichwrap+=<,>,[,],h,l")
