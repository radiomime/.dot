print("I am doing things in plugins-new")
local utils = require("utils")

local plugins = {}
local compile_path = utils.get_config_path() .. "/plugin/packer_compiled.lua"

function plugins:clear_packer_cache()
    print("attempt to clear packer_compiled path")
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

    packer.init({
        package_root = package_root,
        compile_path = compile_path,
        git = { clone_timeout = 300 },
        display = {
            open_fn = function()
                return require("packer.util").float({ border = "rounded" })
            end,
        },
    })
    self.packer = packer
    return self
end

function plugins:install()
    print("running install for plugins!!!")
    return require("packer").startup(function()
        -- packer can manage itself
        use("wbthomason/packer.nvim")

        -- themes
        use("folke/tokyonight.nvim")

        -- lsp
        use("neovim/nvim-lspconfig")
        use("tamago324/nlsp-settings.nvim")
        use("jose-elias-alvarez/null-ls.nvim")

        -- lsp installer
        use("williamboman/nvim-lsp-installer")

        -- telescope
        -- TODO: look at this as primeagen said
        --   https://github.com/nvim-telescope/telescope-fzf-native.nvim
         use({
             "nvim-telescope/telescope.nvim",
             requires = {{ "nvim-lua/plenary.nvim" }},
             config = require('plugins.telescope').config
         })
         use({
             "nvim-telescope/telescope-fzf-native.nvim",
             run = "make",
             disable = false,
         })

        -- completion and snippets
        use({
          "hrsh7th/nvim-cmp",
           requires = {
             "L3MON4D3/LuaSnip",
             "saadparwaiz1/cmp_luasnip",
             "hrsh7th/cmp-buffer",
             "hrsh7th/cmp-nvim-lsp",
             "hrsh7th/cmp-path",
             "hrsh7th/cmp-nvim-lua",
           },
          config = require('plugins.nvim-cmp').config,
          run = function()
            -- cmp's config requires cmp to be installed to run the first time
            if not plugins.nvim-cmp then
                require('plugins.nvim-cmp').config()
            end
          end,
        })

        -- which key
        use({
          "folke/which-key.nvim",
          requires = {},
          config = require('plugins.which-key').config,
          -- event =  "BufWinEnter",
          disable = false,
        })

        -- treesitter
        use({
          "nvim-treesitter/nvim-treesitter",
          branch = "0.5-compat",
          -- run = ":TSUpdate",
          config = require('plugins.nvim-treesitter').config,
        })
        
         -- autopairs
         use({
           "windwp/nvim-autopairs",
           config = require('plugins.nvim-autopairs').config,
         })

        -- commenting
        use("tpope/vim-commentary")
        use("JoosepAlviste/nvim-ts-context-commentstring")

        -- nvim tree
        use({
            "kyazdani42/nvim-tree.lua",
            requires = 'kyazdani42/nvim-web-devicons',
            config = require('plugins.nvim-tree').config,
        })

        -- utility or required by other ones
        use("nvim-lua/popup.nvim") -- this could maybe be deleted (require where needed)
        use("nvim-lua/plenary.nvim") -- could maybe be delete (require where needed)

        -- experimenting

        -- tmp fixes
        use("antoinemadec/FixCursorHold.nvim") -- Needed while issue https://github.com/neovim/neovim/issues/12587 is still open

        -- sort through
        use('hrsh7th/vim-vsnip') -- event: InsertEnter
        use('rafamadriz/friendly-snippets') -- event: InsertCharPre (maybe for cmp?)
        use({"rcarriga/nvim-notify", disable = false})
        use({"Tastyep/structlog.nvim", disable = false})
    end
    )
end

function plugins:sync()
    if require('packer') then
        require('packer').sync()
    else
        print('packer expected')
    end
end

return plugins
