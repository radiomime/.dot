local utils = require("utils")
-- require("config")


print(utils.get_config_path())

-- Create global config object
neo = {}
-- require('settings')
require("settings").load_options()
-- require("settings").load_commands()

require("keymappings").set_keymappings()

-- TODO: create a command to execute these, shouldn't need to uncomment
-- require("plugins"):clear_packer_cache()
-- require('plugins'):remove_packer_directory()

require("plugins"):init()
require("plugins"):install()

-- colors
require("colorscheme"):load_colors()


-- -- *** working above here *** --

-- -- TODO: we need something like this: vim.opt.packpath = vim.opt.rtp
-- -- vim.cmd([[let &packpath = &runtimepath]])
-- -- }}}


-- -- Get reference to config to overwrite default config later
-- -- TODO: I can just have one config
-- -- NOTE: Anything not specified as local is defined globally
-- local nvim_path = os.getenv("HOME") .. "/.config/nvim/"
-- USER_CONFIG_PATH = nvim_path .. "config.lua"
-- local config_exist = utils.file_exists(USER_CONFIG_PATH)

-- if not config_exist then
--     print("config does not exist at " .. USER_CONFIG_PATH)
--     USER_CONFIG_PATH = nvim_path .. "lv-config.lua"
-- end

-- -- Import default config
-- require("default-config")

-- local autocmds = require("core.autocmds")
-- -- require("settings").load_options()

-- local status_ok, error = pcall(vim.cmd, "luafile " .. USER_CONFIG_PATH)
-- if not status_ok then
--     print("something is wrong with your " .. USER_CONFIG_PATH)
--     print(error)
-- end
-- -- require("settings").load_commands()
-- autocmds.define_augroups(neo.autocommands)

-- -- WORKing below --
-- -- plugins
-- -- require("plugins"):clear_packer_cache()
-- -- require("plugins"):init()
-- -- require("plugins"):install()
-- -- require("plugins"):sync()

-- -- require('telescope').setup({ defaults = { prompt_prefix = "X"}})

-- -- local plugins = require("plugins-new"):tester()
-- -- plugins.tester()

-- -- below is how it was done!
-- -- load plugins via packer
-- -- local plugins = require("plugins")
-- -- local plugin_loader = require("plugin-loader").init()
-- -- plugin_loader:load({ plugins, neo.plugins })

-- -- WORKing above --

-- -- colors
-- vim.g.colors_name = neo.colorscheme -- Colorscheme must get called after plugins are loaded or it will break new installs.
-- vim.cmd("colorscheme " .. neo.colorscheme)

-- utils.toggle_autoformat()
-- local commands = require("core.commands")
-- commands.load(commands.defaults)

-- -- lsp
-- require("lsp").config()

-- -- formatting
-- -- local null_status_ok, null_ls = pcall(require, "null-ls")
-- -- if null_status_ok then
-- --     null_ls.config({})
-- --     require("lspconfig")["null-ls"].setup(neo.lsp.null_ls.setup)
-- -- end

-- -- local lsp_settings_status_ok, lsp_settings = pcall(require, "nlspsettings")
-- -- if lsp_settings_status_ok then
-- --     lsp_settings.setup({
-- --         config_home = os.getenv("HOME") .. "/.config/nvim/lsp-settings",
-- --     })
-- -- end

-- -- require("keymappings").setup()

-- require("tester")

-- -- -- TODO: these guys need to be in language files
-- -- -- if nvim.lang.emmet.active then
-- -- --   require "lsp.emmet-ls"
-- -- -- end
-- -- -- if nvim.lang.tailwindcss.active then
-- -- --   require "lsp.tailwind
