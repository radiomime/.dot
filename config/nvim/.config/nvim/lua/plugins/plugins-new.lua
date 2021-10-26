print("I am doing things in plugins-new")
local utils = require('utils')

local plugins = {}

local compile_path = utils.get_config_path() .. "/plugin/packer_compiled.lua"

function plugins:clear_packer_cache()
    print('attempt to clear packer_compiled path')
    print(compile_path)
    print(compile_path)
    print(compile_path)
    if vim.fn.delete(compile_path) == 0 then
        print("deleted packer_compiled.lua")
    end
end

function plugins:init()
    -- TODO: check this installs correctly when not installed yet
    local install_path = vim.fn.stdpath("data")
        .. "/site/pack/packer/start/packer.nvim"
    local package_root = vim.fn.stdpath("data") .. "/site/pack"


    print(vim.fn.stdpath("data"))
    print(vim.fn.stdpath("config"))

    if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
        vim.fn.system({
            "git",
            "clone",
            "--depth",
            "1",
            "https://github.com/wbthomason/packer.nvim",
            install_path,
        })
        vim.cmd("packadd packer.nvim")
    end
    local packer_ok, packer = pcall(require, "packer")
    if not packer_ok then
        return
    end

    packer.init {
        package_root = package_root,
        compile_path = compile_path,
        git = { clone_timeout = 300 },
        display = {
            open_fn = function()
                return require("packer.util").float { border = "rounded" }
            end,
        },
    }
    self.packer = packer
    return self
end

function plugins:install()
    print('running install for plugins!!!')
    return require('packer').startup(function()
      -- packer can manage itself
      use 'wbthomason/packer.nvim'

      -- themes
      use  "folke/tokyonight.nvim"

      -- lsp
      use "neovim/nvim-lspconfig"
      use "tamago324/nlsp-settings.nvim"
      use "jose-elias-alvarez/null-ls.nvim"

      -- lsp installer
      use "williamboman/nvim-lsp-installer"
    --   use insteaad of 
    -- {
    --     "kabouzeid/nvim-lspinstall",
    --     event = "VimEnter",
    --     config = function()
    --         local lspinstall = require("core.lspinstall")
    --         lspinstall.setup()
    --     end,
    -- },

      -- telescope
      use {
        'nvim-telescope/telescope.nvim',
        requires = { {'nvim-lua/plenary.nvim'} },
        config = function()
            require('telescope').setup({
                defaults = {
                    prompt_prefix = " ",
                    selection_caret = " ",
                    entry_prefix = "  ",
                    initial_mode = "insert",
                    selection_strategy = "reset",
                    sorting_strategy = "descending",
                    layout_strategy = "horizontal",
                    layout_config = {
                        width = 0.75,
                        prompt_position = "bottom",
                        preview_cutoff = 120,
                        horizontal = { mirror = false },
                        vertical = { mirror = false },
                    },
                    file_sorter = require("telescope.sorters").get_fzy_sorter,
                    file_ignore_patterns = { "node_modules" },
                    generic_sorter = require("telescope.sorters").get_generic_fuzzy_sorter,
                    path_display = { shorten = 5 },
                    winblend = 0,
                    border = {},
                    borderchars = {
                        "─",
                        "│",
                        "─",
                        "│",
                        "╭",
                        "╮",
                        "╯",
                        "╰",
                    },
                    color_devicons = true,
                    use_less = true,
                    set_env = { ["COLORTERM"] = "truecolor" }, -- default = nil,
                    file_previewer = require("telescope.previewers").vim_buffer_cat.new,
                    grep_previewer = require("telescope.previewers").vim_buffer_vimgrep.new,
                    qflist_previewer = require("telescope.previewers").vim_buffer_qflist.new,

                    -- Developer configurations: Not meant for general override
                    -- buffer_previewer_maker = require("telescope.previewers").buffer_previewer_maker,
                    mappings = {
                        i = {
                            ["<C-n>"] = require('telescope.actions').move_selection_next,
                            ["<C-p>"] = require('telescope.actions').move_selection_previous,
                            ["<C-c>"] = require('telescope.actions').close,
                            ["<C-j>"] = require('telescope.actions').cycle_history_next,
                            ["<C-k>"] = require('telescope.actions').cycle_history_prev,
                            ["<C-q>"] = require('telescope.actions').smart_send_to_qflist
                                + require('telescope.actions').open_qflist,
                            ["<CR>"] = require('telescope.actions').select_default + require('telescope.actions').center,
                            -- To disable a keymap, put [map] = false
                            -- So, to not map "<C-n>", just put
                            -- ["<c-t>"] = trouble.open_with_trouble,
                            -- ["<c-x>"] = false,
                            -- ["<esc>"] = telescope.actions.close,
                            -- Otherwise, just set the mapping to the function that you want it to be.
                            -- ["<C-i>"] = telescope.actions.select_horizontal,
                            -- Add up multiple telescope.actions
                            -- You can perform as many telescope.actions in a row as you like
                            -- ["<CR>"] = telescope.actions.select_default + telescope.actions.center + my_cool_custom_action,
                        },
                        n = {
                            ["<C-n>"] = require('telescope.actions').move_selection_next,
                            ["<C-p>"] = require('telescope.actions').move_selection_previous,
                            ["<C-q>"] = require('telescope.actions').smart_send_to_qflist
                                + require('telescope.actions').open_qflist,
                            -- ["<c-t>"] = trouble.open_with_trouble,
                            -- ["<C-i>"] = my_cool_custom_action,
                        },
                    },
                },
                extensions = {
                    fzy_native = {
                        override_generic_sorter = false,
                        override_file_sorter = true,
                    },
                },
            })
        end,
      }
      -- TODO: look at this as primeagen said
      --   https://github.com/nvim-telescope/telescope-fzf-native.nvim

      -- completion and snippets
      -- {
      --   "hrsh7th/nvim-cmp",
      --   config = function()
      --     require("lvim.core.cmp").setup()
      --   end,
      --   requires = {
      --     "L3MON4D3/LuaSnip",
      --     "saadparwaiz1/cmp_luasnip",
      --     "hrsh7th/cmp-buffer",
      --     "hrsh7th/cmp-nvim-lsp",
      --     "hrsh7th/cmp-path",
      --     "hrsh7th/cmp-nvim-lua",
      --   },
      --   run = function()
      --     -- cmp's config requires cmp to be installed to run the first time
      --     if not lvim.builtin.cmp then
      --       require("lvim.core.cmp").config()
      --     end
      --   end,
      -- },    

      -- utility or required by other ones
      use "nvim-lua/popup.nvim" -- this could maybe be deleted (require where needed)
      use "nvim-lua/plenary.nvim" -- could maybe be delete (require where needed)

      -- experimenting

      -- tmp fixes
      -- use "antoinemadec/FixCursorHold.nvim"


      -- PACKER SUGGESTED BELOW
      -- PACKER SUGGESTED BELOW
      -- PACKER SUGGESTED BELOW

--       -- Simple plugins can be specified as strings
--       use '9mm/vim-closer'
-- 
--       -- Lazy loading:
--       -- Load on specific commands
--       use {'tpope/vim-dispatch', opt = true, cmd = {'Dispatch', 'Make', 'Focus', 'Start'}}
-- 
--       -- Load on an autocommand event
--       use {'andymass/vim-matchup', event = 'VimEnter'}
-- 
--       -- Load on a combination of conditions: specific filetypes or commands
--       -- Also run code after load (see the "config" key)
--       use {
--         'w0rp/ale',
--         ft = {'sh', 'zsh', 'bash', 'c', 'cpp', 'cmake', 'html', 'markdown', 'racket', 'vim', 'tex'},
--         cmd = 'ALEEnable',
--         config = 'vim.cmd[[ALEEnable]]'
--       }
-- 
--       -- Plugins can have dependencies on other plugins
--       use {
--         'haorenW1025/completion-nvim',
--         opt = true,
--         requires = {{'hrsh7th/vim-vsnip', opt = true}, {'hrsh7th/vim-vsnip-integ', opt = true}}
--       }
-- 
--       -- Plugins can also depend on rocks from luarocks.org:
--       use {
--         'my/supercoolplugin',
--         rocks = {'lpeg', {'lua-cjson', version = '2.1.0'}}
--       }
-- 
--       -- You can specify rocks in isolation
--       use_rocks 'penlight'
--       use_rocks {'lua-resty-http', 'lpeg'}
-- 
--       -- Local plugins can be included
--       use '~/projects/personal/hover.nvim'
-- 
--       -- Plugins can have post-install/update hooks
--       use {'iamcco/markdown-preview.nvim', run = 'cd app && yarn install', cmd = 'MarkdownPreview'}
-- 
--       -- Post-install/update hook with neovim command
--       use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
-- 
--       -- Post-install/update hook with call of vimscript function with argument
--       use { 'glacambre/firenvim', run = function() vim.fn['firenvim#install'](0) end }
-- 
--       -- Use specific branch, dependency and run lua file after load
--       use {
--         'glepnir/galaxyline.nvim', branch = 'main', config = function() require'statusline' end,
--         requires = {'kyazdani42/nvim-web-devicons'}
--       }
-- 
--       -- Use dependency and run lua function after load
--       use {
--         'lewis6991/gitsigns.nvim', requires = { 'nvim-lua/plenary.nvim' },
--         config = function() require('gitsigns').setup() end
--       }
-- 
--       -- You can specify multiple plugins in a single call
--       use {'tjdevries/colorbuddy.vim', {'nvim-treesitter/nvim-treesitter', opt = true}}
-- 
--       -- You can alias plugin names
--       use {'dracula/vim', as = 'dracula'}

-- CURRENT LUNARVIM BELOW
-- CURRENT LUNARVIM BELOW
-- CURRENT LUNARVIM BELOW
--   { "wbthomason/packer.nvim" },
--   { "neovim/nvim-lspconfig" },
--   { "tamago324/nlsp-settings.nvim" },
--   { "jose-elias-alvarez/null-ls.nvim" },
--   { "antoinemadec/FixCursorHold.nvim" }, -- Needed while issue https://github.com/neovim/neovim/issues/12587 is still open
--   {
--     "williamboman/nvim-lsp-installer",
--   },
--   {
--     "rcarriga/nvim-notify",
--     disable = not lvim.builtin.notify.active,
--   },
--   { "Tastyep/structlog.nvim" },
-- 
--   { "nvim-lua/popup.nvim" },
--   { "nvim-lua/plenary.nvim" },
--   -- Telescope
--   {
--     "nvim-telescope/telescope.nvim",
--     config = function()
--       require("lvim.core.telescope").setup()
--     end,
--     disable = not lvim.builtin.telescope.active,
--   },
--   {
--     "nvim-telescope/telescope-fzf-native.nvim",
--     run = "make",
--     disable = not lvim.builtin.telescope.active,
--   },
--   -- Install nvim-cmp, and buffer source as a dependency
--   {
--     "hrsh7th/nvim-cmp",
--     config = function()
--       require("lvim.core.cmp").setup()
--     end,
--     requires = {
--       "L3MON4D3/LuaSnip",
--       "saadparwaiz1/cmp_luasnip",
--       "hrsh7th/cmp-buffer",
--       "hrsh7th/cmp-nvim-lsp",
--       "hrsh7th/cmp-path",
--       "hrsh7th/cmp-nvim-lua",
--     },
--     run = function()
--       -- cmp's config requires cmp to be installed to run the first time
--       if not lvim.builtin.cmp then
--         require("lvim.core.cmp").config()
--       end
--     end,
--   },
--   {
--     "rafamadriz/friendly-snippets",
--     -- event = "InsertCharPre",
--     -- disable = not lvim.builtin.compe.active,
--   },
-- 
--   -- Autopairs
--   {
--     "windwp/nvim-autopairs",
--     -- event = "InsertEnter",
--     config = function()
--       require("lvim.core.autopairs").setup()
--     end,
--     disable = not lvim.builtin.autopairs.active,
--   },
-- 
--   -- Treesitter
--   {
--     "nvim-treesitter/nvim-treesitter",
--     branch = "0.5-compat",
--     -- run = ":TSUpdate",
--     config = function()
--       require("lvim.core.treesitter").setup()
--     end,
--   },
-- 
--   -- NvimTree
--   {
--     "kyazdani42/nvim-tree.lua",
--     -- event = "BufWinOpen",
--     -- cmd = "NvimTreeToggle",
--     -- commit = "fd7f60e242205ea9efc9649101c81a07d5f458bb",
--     config = function()
--       require("lvim.core.nvimtree").setup()
--     end,
--     disable = not lvim.builtin.nvimtree.active,
--   },
-- 
--   {
--     "lewis6991/gitsigns.nvim",
-- 
--     config = function()
--       require("lvim.core.gitsigns").setup()
--     end,
--     event = "BufRead",
--     disable = not lvim.builtin.gitsigns.active,
--   },
-- 
--   -- Whichkey
--   {
--     "folke/which-key.nvim",
--     config = function()
--       require("lvim.core.which-key").setup()
--     end,
--     event = "BufWinEnter",
--     disable = not lvim.builtin.which_key.active,
--   },
-- 
--   -- Comments
--   {
--     "numToStr/Comment.nvim",
--     event = "BufRead",
--     config = function()
--       require("lvim.core.comment").setup()
--     end,
--     disable = not lvim.builtin.comment.active,
--   },
-- 
--   -- project.nvim
--   {
--     "ahmedkhalf/project.nvim",
--     config = function()
--       require("lvim.core.project").setup()
--     end,
--     disable = not lvim.builtin.project.active,
--   },
-- 
--   -- Icons
--   { "kyazdani42/nvim-web-devicons" },
-- 
--   -- Status Line and Bufferline
--   {
--     -- "hoob3rt/lualine.nvim",
--     "nvim-lualine/lualine.nvim",
--     -- "Lunarvim/lualine.nvim",
--     config = function()
--       require("lvim.core.lualine").setup()
--     end,
--     disable = not lvim.builtin.lualine.active,
--   },
-- 
--   {
--     "romgrk/barbar.nvim",
--     config = function()
--       require("lvim.core.bufferline").setup()
--     end,
--     event = "BufWinEnter",
--     disable = not lvim.builtin.bufferline.active,
--   },
-- 
--   -- Debugging
--   {
--     "mfussenegger/nvim-dap",
--     -- event = "BufWinEnter",
--     config = function()
--       require("lvim.core.dap").setup()
--     end,
--     disable = not lvim.builtin.dap.active,
--   },
-- 
--   -- Debugger management
--   {
--     "Pocco81/DAPInstall.nvim",
--     -- event = "BufWinEnter",
--     -- event = "BufRead",
--     disable = not lvim.builtin.dap.active,
--   },
-- 
--   -- Dashboard
--   {
--     "ChristianChiarulli/dashboard-nvim",
--     event = "BufWinEnter",
--     config = function()
--       require("lvim.core.dashboard").setup()
--     end,
--     disable = not lvim.builtin.dashboard.active,
--   },
-- 
--   -- Terminal
--   {
--     "akinsho/toggleterm.nvim",
--     event = "BufWinEnter",
--     config = function()
--       require("lvim.core.terminal").setup()
--     end,
--     disable = not lvim.builtin.terminal.active,
--   },









    end)
end


return plugins
