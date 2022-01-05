print("*** Inside tester.lua")

-- print(vim.inspect(vim.loop.os_uname()))
print(CONFIG_PATH)
-- print(vim.inspect(neo))

--[[ what I'm doing
init vim to init lua
--]]

--[[ plugin notes
add: lukas-reineke/indent-blankline.nvim
--]]

--[[ Notes
lua/core directory
    this directory has a bunch of plugin configuration

* try to figure out how to make the cursor not blink
* I don't know how to change the colorscheme
--]]

--[[ TODO
lua/settings:
    update these to reflect my init.vim
lua/core directory:
    change lunarvim and lvim in func names
    change whichkey set up to be good
    Change dashboard banner
    what is the info.lua file?? what uses that?
    /lualine:
        builtin.lualine style is lvim
        actually, just edit the styles here!
    terminal:
        this is https://github.com/akinsho/toggleterm.nvim
        edit styles and stuff to remove lvim references.
lua/plugins:
    update plugins to be mine!

lua/plugin-loader:
    understand this, update it if need be

lsp:
    what is nlspsettings? should I use it?

general
    what is LvimInfoIdentifier , LvimInfoHeader?
    what is CACHE_PATH? Check out all path vars
--]]

--[[ things I removed from init.vim that might suck to have removed

augroup noIndentLineOnMarkdown
  autocmd!
  let g:indentLine_enabled=0
augroup END


colorscheme molokai
are the airline plugins good?

-- Plugins --
Plug 'sbdchd/neoformat'
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  }
Plug 'abecodes/tabout.nvim'
Plug 'tomasr/molokai'
Plug 'folke/lsp-colors.nvim'


--]]

-- fartBag
