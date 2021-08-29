print('*** Inside tester.lua')

-- print(vim.inspect(vim.loop.os_uname()))
print(CONFIG_PATH)
print(nvim)


--[[ what I'm doing
changing lvim to neo as global with all the shit
--]]


--[[ Notes
lua/core directory
    this directory has a bunch of plugin configuration
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

general
    what is LvimInfoIdentifier , LvimInfoHeader?
    what is CACHE_PATH? Check out all path vars
--]]

