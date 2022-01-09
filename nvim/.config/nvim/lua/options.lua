print('Loading options')

local options = {
  laststatus = 2,                          -- always display the status line
  exrc = true, -- source .nvimrc or .exrc from current directory when starting vim
  backspace = { "indent", "eol", "start" },-- TODO: is this still pertinent?
  -- ruler = true, -- [default: true] Show the line and column number of the cursor position
  backup = false,                          -- creates a backup file
  clipboard = "unnamedplus",               -- allows neovim to access the system clipboard
  cmdheight = 2,                           -- more space in the neovim command line for displaying messages
  colorcolumn = "79", -- fixes indentline for now TODO: is this still necessary?
  completeopt = { "menuone", "noinsert", "noselect" }, -- mostly just for cmp TODO: added noinsert, is this alright?
  conceallevel = 0,                        -- so that `` is visible in markdown files
  fileencoding = "utf-8",                  -- the encoding written to a file
  -- fileencodings = "utf-8", -- the encoding written to a file TODO: I don't think I should use this
  foldmethod = "manual", -- folding, set to "expr" for treesitter based folding
  foldexpr = "", -- set to "nvim_treesitter#foldexpr()" for treesitter based folding
  hlsearch = false,                        -- highlight all matches on previous search pattern
  ignorecase = true,                       -- ignore case in search patterns
  mouse = "a",                             -- allow the mouse to be used in neovim
  pumheight = 10,                          -- pop up menu height
  showmode = false,                        -- we don't need to see things like -- INSERT -- anymore TODO: do I like this? update status line maybe?
  showtabline = 2,                         -- always show tabs
  smartcase = true,                        -- smart case
  smartindent = true,                      -- make indenting smarter again
  splitbelow = true,                       -- force all horizontal splits to go below current window
  splitright = true,                       -- force all vertical splits to go to the right of current window
  swapfile = false,                        -- creates a swapfile
  termguicolors = true,                    -- set term gui colors (most terminals support this)
  timeoutlen = 100,                        -- time to wait for a mapped sequence to complete (in milliseconds)
  title = true, -- set the title of window to the value of the titlestring
  undodir = vim.fn.stdpath('data') .. "/undo", -- set an undo directory
  undofile = true,                         -- enable persistent undo
  updatetime = 300,                        -- faster completion (4000ms default)
  writebackup = false,                     -- if a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited
  expandtab = true,                        -- convert tabs to spaces
  shiftwidth = 2,                          -- the number of spaces inserted for each indentation
  tabstop = 2,                             -- insert 2 spaces for a tab
  softtabstop = 0, -- number of spaces that tab uses while editing
  cursorline = true,                       -- highlight the current line
  number = true,                           -- set numbered lines
  relativenumber = true,                   -- set relative numbered lines
  numberwidth = 4,                         -- set number column width to 2 {default 4}
  signcolumn = "yes",                      -- always show the sign column, otherwise it would shift the text each time
  wrap = false,                            -- display lines as one long line
  -- spell = false, -- TODO: work on spelling config if I want to use one
  scrolloff = 50, -- cursor mostly centered
  sidescroll = 1, -- scroll sideways 1 column at a time
  sidescrolloff = 10, -- keep a buffer on the side when scrolling
  guifont = "monospace:h17",               -- the font used in graphical neovim applications
}

-- TODO: is title string cool?
-- vim.opt.titlestring = "%<%F%=%l/%L - nvim" -- what the title of the window will be set to
vim.opt.shortmess:append "c"

for k, v in pairs(options) do
  vim.opt[k] = v
end

-- move to the previous/next line after reaching first/last character in the line
vim.cmd "set whichwrap+=<,>,[,],h,l"

-- vim.cmd [[set iskeyword+=-]]
-- vim.cmd [[set formatoptions-=cro]] -- TODO: this doesn't seem to work
