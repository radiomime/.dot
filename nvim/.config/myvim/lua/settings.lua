local M = {}
local utils = require('utils')

M.load_options = function()
    -- the following are like vim's 'set <setting>'
    local options = {
        laststatus = 2,
        exrc = true, -- source .nvimrc or .exrc from current directory when starting vim
        backspace = { "indent", "eol", "start" },
        ruler = true,
        backup = false, -- creates a backup file
        clipboard = "unnamedplus", -- allows neovim to access the system clipboard
        cmdheight = 2, -- more space in the neovim command line for displaying messages
        colorcolumn = "79", -- fixes indentline for now
        completeopt = { "menuone", "noinsert", "noselect" },
        conceallevel = 0, -- so that `` is visible in markdown files
        fileencoding = "utf-8", -- the encoding written to a file
        fileencodings = "utf-8", -- the encoding written to a file
        foldmethod = "manual", -- folding, set to "expr" for treesitter based folding
        foldexpr = "", -- set to "nvim_treesitter#foldexpr()" for treesitter based folding
        guifont = "monospace:h17", -- the font used in graphical neovim applications
        hidden = true, -- required to keep multiple buffers and open multiple buffers
        hlsearch = false, -- highlight all matches on previous search pattern
        ignorecase = true, -- ignore case in search patterns
        mouse = "a", -- allow the mouse to be used in neovim
        pumheight = 10, -- pop up menu height
        showmode = false, -- we don't need to see things like -- INSERT -- anymore
        showtabline = 2, -- always show tabs
        smartcase = true, -- override ignore case if search pattern contains upper case
        smartindent = true, -- make indenting smarter again
        autoindent = true, -- copy indent from current line when starting new line
        splitbelow = true, -- force all horizontal splits to go below current window
        splitright = true, -- force all vertical splits to go to the right of current window
        swapfile = false, -- creates a swapfile
        termguicolors = true, -- set term gui colors (most terminals support this)
        timeoutlen = 100, -- time to wait for a mapped sequence to complete (in milliseconds)
        title = true, -- set the title of window to the value of the titlestring
        undodir = utils.get_data_path() .. "/undo", -- set an undo directory
        undofile = true, -- enable persistent undo
        updatetime = 300, -- faster completion (4000ms default)
        writebackup = false, -- if a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited
        expandtab = true, -- convert tabs to spaces
        shiftwidth = 2, -- the number of spaces used for autoindent step
        tabstop = 2, -- number of spaces to insert for a tab
        softtabstop = 0, -- number of spaces that tab uses while editing
        cursorline = true, -- highlight the current line
        number = true, -- set numbered lines
        relativenumber = true, -- set relative numbered lines
        numberwidth = 4, -- set number column width {default 4}
        signcolumn = "yes", -- always show the sign column, otherwise it would shift the text each time
        wrap = false, -- display lines as one long line
        spell = false,
        spelllang = "en",
        scrolloff = 50, -- cursor mostly centered
        sidescroll = 1, -- scroll sideways 1 column at a time
        sidescrolloff = 10, -- keep a buffer on the side when scrolling
    }

    ---  settings  ---

    -- TODO: is title string cool?
    -- vim.opt.titlestring = "%<%F%=%l/%L - nvim" -- what the title of the window will be set to
    vim.opt.shortmess:append("c")

    for k, v in pairs(options) do
        vim.opt[k] = v
    end

    vim.cmd "set whichwrap+=<,>,[,],h,l"
end

-- todo: is this necessary?
M.load_commands = function()
    local cmd = vim.cmd
    -- if neo.line_wrap_cursor_movement then
    --     cmd("set whichwrap+=<,>,[,],h,l")
    -- end

    -- TODO: fix
    -- TODO: do i want this here?
    -- if neo.transparent_window then
    --     cmd("au ColorScheme * hi Normal ctermbg=none guibg=none")
    --     cmd("au ColorScheme * hi SignColumn ctermbg=none guibg=none")
    --     cmd("au ColorScheme * hi NormalNC ctermbg=none guibg=none")
    --     cmd("au ColorScheme * hi MsgArea ctermbg=none guibg=none")
    --     cmd("au ColorScheme * hi TelescopeBorder ctermbg=none guibg=none")
    --     cmd("au ColorScheme * hi NvimTreeNormal ctermbg=none guibg=none")
    --     cmd("let &fcs='eob: '")
    -- end
end

return M
