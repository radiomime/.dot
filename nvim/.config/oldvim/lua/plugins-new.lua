print('working here, in plugins-new')

local plugins = {}

function plugins.init()
    -- TODO: check this installs correctly when not installed yet
    local install_path = vim.fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
    local package_root = vim.fn.stdpath("data") .. "/site/pack"

    print(vim.fn.stdpath('data'))
    print(vim.fn.stdpath('config'))
    if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
        vim.fn.system { "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path, }
        vim.cmd "packadd packer.nvim"
    end
--     local execute = vim.api.nvim_command
--     local fn = vim.fn
-- 
--     local install_path =
--         "~/.local/share/nvim/site/pack/packer/start/packer.nvim"
--     if fn.empty(fn.glob(install_path)) > 0 then
--         execute(
--             "!git clone https://github.com/wbthomason/packer.nvim "
--                 .. install_path
--         )
--         execute("packadd packer.nvim")
--     end
-- 
--     local packer_ok, packer = pcall(require, "packer")
--     if not packer_ok then
--         return
--     end
-- 
--     local util = require("packer.util")
-- 
--     packer.init({
--         package_root = util.join_paths("~/.local/share/nvim/site/pack/"),
--         compile_path = util.join_paths(
--             "~/.config/nvim",
--             "plugin",
--             "packer_compiled.lua"
--         ),
--         git = { clone_timeout = 300 },
--         display = {
--             open_fn = function()
--                 return util.float({ border = "rounded" })
--             end,
--         },
--     })
-- 
--     self.packer = packer
--     return self
end

function plugins.tester()
    print('i am tester, hear me roar')
end

return plugins
