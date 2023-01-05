-- local utils = require("utils")
local M = {}

-- defaults
local compile_path = vim.fn.stdpath("config") .. "/plugin/packer_compiled.lua"
local package_root = vim.fn.stdpath("data") .. "/site/pack"
local install_path = vim.fn.stdpath("data")
  .. "/site/pack/packer/start/packer.nvim"

-- TODO: turn the following two into some command? packer nuke?
function M:clear_packer_cache()
  print("deleting packer cache at:" .. compile_path)
  if vim.fn.delete(compile_path) == 0 then
    print("deleted packer_compiled.lua")
  end
end

function M:remove_packer_directory()
  print("deleting packer at:" .. install_path)
  if vim.fn.delete(install_path, "rf") == 0 then
    print("deleted repo: packer.nvim")
  end
end

function M:packer_is_installed()
  -- assumes nothing else is installed in this strange path
  return (vim.fn.empty(vim.fn.glob(install_path)) == 0)
end

function M:init()
  -- install packer if that directory isn't populated
  if not M.packer_is_installed(self) then
    print("installing packer to: " .. install_path)
    PACKER_BOOTSTRAP = vim.fn.system({
      "git",
      "clone",
      "--depth",
      "1",
      "https://github.com/wbthomason/packer.nvim",
      install_path,
    })
    print("packer is installing. restart neovim")
    print("PACKER_BOOTSTRAP" .. PACKER_BOOTSTRAP)

    -- Only required if you have packer configured as `opt`
    -- vim.cmd("packadd packer.nvim")
  end

  -- Autocommand that reloads neovim whenever you save the plugins.lua file
  vim.cmd([[
     augroup packer_user_config
       autocmd!
       autocmd BufWritePost plugins.lua source <afile> | PackerSync
     augroup end
   ]])

  -- Use a protected call so we don't error out on first use
  local packer_ok, packer = pcall(require, "packer")
  if not packer_ok then
    print("error: cannot require packer in init function")
    return
  end

  -- packer init function
  packer.init({
    git = { clone_timeout = 300 },
    display = {
      open_fn = function()
        return require("packer.util").float({ border = "rounded" })
      end,
    },
    log = { level = "info" }, -- default is warn
  })
  -- self.packer = packer
  -- return self
end

function M:_install()
  local packer_ok, packer = pcall(require, "packer")
  if not packer_ok then
    print("error: cannot require packer in install function")
    return
  end

  -- TODO: what is using <leader> q? It is a diagnostics thing, and I think I'm using a better one down (dd)
  return packer.startup(function(use)
    -- My plugins here
    use("wbthomason/packer.nvim") -- packer can manage itself
    use("lewis6991/impatient.nvim") -- faster start up speed. to clear cache, :LuaCacheClear

    use("nvim-lua/popup.nvim") -- An implementation of the Popup API from vim in Neovim
    use("nvim-lua/plenary.nvim") -- Useful lua functions used ny lots of plugins
    use("windwp/nvim-autopairs") -- Autopairs, integrates with both cmp and treesitter
    use("numToStr/Comment.nvim") -- Easily comment stuff
    use("kyazdani42/nvim-web-devicons")
    use("kyazdani42/nvim-tree.lua")
    use({
      "akinsho/bufferline.nvim",
      tag = "*",
      requires = "kyazdani42/nvim-web-devicons",
    }) -- buffer line up top

    use("moll/vim-bbye")
    -- TODO: play around with qs config more
    use("unblevable/quick-scope") -- do I like this?
    use("nvim-lualine/lualine.nvim")
    use({ "akinsho/toggleterm.nvim", branch = "main" })
    -- use("ahmedkhalf/project.nvim")
    use("lukas-reineke/indent-blankline.nvim")
    use("goolord/alpha-nvim")
    use("antoinemadec/FixCursorHold.nvim") -- This is needed to fix lsp doc highlight
    use("folke/which-key.nvim")

    -- use("tpope/vim-abolish") -- work with strings -- I think I like `johmsalas/text-case.nvim` better

    -- Colorschemes
    -- use "lunarvim/colorschemes" -- A bunch of colorschemes you can try out
    use("folke/tokyonight.nvim")
    use("EdenEast/nightfox.nvim") -- Packer
    use("rebelot/kanagawa.nvim")
    use("catppuccin/nvim") -- TODO: incorporate this as an option
    -- use("lunarvim/darkplus.nvim")
    -- use("tiagovla/tokyodark.nvim")
    -- use("rafamadriz/neon")
    -- use("marko-cerovac/material.nvim")
    -- use("shaunsingh/moonlight.nvim")

    -- Copilot --
    -- run ':Copilot setup'
    -- be sure ~/.config/github-copilot has files in it
    -- use("github/copilot.vim")
    -- enable the other plugins below. This may be easier once the below plugins are more mature.
    -- use({
    --   "zbirenbaum/copilot.lua",
    --   event = { "VimEnter" },
    --   config = function()
    --     vim.defer_fn(function()
    --       require("copilot").setup({
    --         ft_disable = {
    --           "markdown",
    --           "terraform",
    --           "text",
    --         },
    --       })
    --     end, 100)
    --   end,
    -- })
    -- use({
    --   "zbirenbaum/copilot-cmp",
    --   after = { "copilot.lua", "nvim-cmp" },
    -- })
    -- End of copilot setup --

    -- cmp plugins
    --[[ TODO: look into more sources: https://github.com/hrsh7th/nvim-cmp/wiki/List-of-sources ]]
    use("hrsh7th/nvim-cmp") -- The completion plugin
    use("hrsh7th/cmp-buffer") -- buffer completions
    use("hrsh7th/cmp-path") -- path completions
    use("hrsh7th/cmp-cmdline") -- cmdline completions
    use("saadparwaiz1/cmp_luasnip") -- snippet completions
    use("hrsh7th/cmp-nvim-lsp")

    -- snippets
    use("L3MON4D3/LuaSnip") --snippet engine
    use("rafamadriz/friendly-snippets") -- a bunch of snippets to use

    -- LSP
    -- use("neovim/nvim-lspconfig") -- enable LSP
    -- use("williamboman/nvim-lsp-installer") -- simple to use language server installer
    -- use({ "williamboman/mason.nvim" })
    use({
      "williamboman/mason.nvim", -- manage external tooling
      "williamboman/mason-lspconfig.nvim", -- bridges mason and lspconfig
      "neovim/nvim-lspconfig", -- enable LSP
    })
    use({
      "tamago324/nlsp-settings.nvim", -- language server settings defined in json for
      requires = { "neovim/nvim-lspconfig" },
    })
    use("jose-elias-alvarez/null-ls.nvim") -- for formatters and linters
    use("jose-elias-alvarez/nvim-lsp-ts-utils") -- tsserver builtin lsp client easier development

    -- diagnostics
    -- TODO: setup some keybinds. remove whatever is mapped to <leader>q, my other diagnostics thing
    use({
      "folke/trouble.nvim",
      requires = "kyazdani42/nvim-web-devicons",
    })

    -- Telescope
    -- TODO: look at this as primeagen said
    --   https://github.com/nvim-telescope/telescope-fzf-native.nvim
    -- -- telescope
    --  use({
    --      "nvim-telescope/telescope-fzf-native.nvim",
    --      run = "make",
    --      disable = false,
    --  })
    use({
      "nvim-telescope/telescope.nvim",
      requires = { "nvim-lua/plenary.nvim" },
    })

    -- Treesitter
    use({
      "nvim-treesitter/nvim-treesitter",
      run = ":TSUpdate",
    })
    use("JoosepAlviste/nvim-ts-context-commentstring")

    -- Git
    use("lewis6991/gitsigns.nvim")

    -- preview
    -- TODO: move this to a config file??
    use({
      "iamcco/markdown-preview.nvim",
      run = "cd app && npm install",
      setup = function()
        vim.g.mkdp_filetypes = { "markdown" }
      end,
      ft = { "markdown" },
    })

    -- make things pretty
    -- TODO: compare with https://github.com/nvim-telescope/telescope-ui-select.nvim
    use({ "stevearc/dressing.nvim" })

    -- movement
    use({
      "phaazon/hop.nvim",
      branch = "v1", -- optional but strongly recommended
      -- config = function()
      --   -- you can configure Hop the way you like here; see :h hop-config
      --   require("hop").setup({ keys = "etovxqpdygfblzhckisuran" })
      -- end,
    })

    -- other
    use("simrat39/symbols-outline.nvim")
    use("axieax/urlview.nvim") -- :UrlView, :UrlView packer, and :UrlView buffer

    -- checkout!
    -- use("sindrets/winshift.nvim")
    -- use('mrjones2014/smart-splits.nvim')

    -- copilot
    -- TODO: format this, make a config file?
    use({
      "zbirenbaum/copilot.lua",
      event = { "VimEnter" },
      config = function()
        vim.defer_fn(function()
          require("copilot").setup()
        end, 100)
      end,
    })
    -- copilot cmp
    use({
      "zbirenbaum/copilot-cmp",
      after = { "copilot.lua" },
      config = function()
        require("copilot_cmp").setup({
          method = "getCompletionsCycling",
        })
      end,
    })

    -- rando
    --[[ TODO: fork this ]]
    use({
      "anuvyklack/help-vsplit.nvim",
      config = function()
        require("help-vsplit").setup({
          always = true, -- Always open help in a vertical split.
          side = "right", -- 'left' or 'right'
          buftype = { "help" },
          filetype = { "man" },
        })
      end,
    })

    -- Packer
    use({
      "folke/noice.nvim",
      event = "VimEnter",
      config = function()
        require("noice").setup()
      end,
      requires = {
        -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
        "MunifTanjim/nui.nvim",
        "rcarriga/nvim-notify",
      },
    })

    -- TODO: add some new keymaps! https://github.com/johmsalas/text-case.nvim#setup
    use("johmsalas/text-case.nvim")
    -----
    -- TODO: below are some of the old ones I've used
    -----
    -- -- completion and snippets
    -- use({
    --   "hrsh7th/nvim-cmp",
    --    requires = {
    --      "L3MON4D3/LuaSnip",
    --      "saadparwaiz1/cmp_luasnip",
    --      "hrsh7th/cmp-buffer",
    --      "hrsh7th/cmp-nvim-lsp",
    --      "hrsh7th/cmp-path",
    --      "hrsh7th/cmp-nvim-lua",
    --    },
    --   config = require('plugins.nvim-cmp').config,
    --   run = function()
    --     -- cmp's config requires cmp to be installed to run the first time
    --     if not plugins.nvim-cmp then
    --         require('plugins.nvim-cmp').config()
    --     end
    --   end,
    -- })

    -- -- which key
    -- use({
    --   "folke/which-key.nvim",
    --   requires = {},
    --   config = require('plugins.which-key').config,
    --   -- event =  "BufWinEnter",
    --   disable = false,
    -- })

    -- -- treesitter
    -- use({
    --   "nvim-treesitter/nvim-treesitter",
    --   branch = "0.5-compat",
    --   -- run = ":TSUpdate",
    --   config = require('plugins.nvim-treesitter').config,
    -- })
    --
    --  -- autopairs
    --  use({
    --    "windwp/nvim-autopairs",
    --    config = require('plugins.nvim-autopairs').config,
    --  })

    -- -- commenting
    -- use("tpope/vim-commentary")
    -- use("JoosepAlviste/nvim-ts-context-commentstring")

    -- -- nvim tree
    -- use({
    --     "kyazdani42/nvim-tree.lua",
    --     requires = 'kyazdani42/nvim-web-devicons',
    --     config = require('plugins.nvim-tree').config,
    -- })

    -- -- gitsigns
    -- use({
    --     "lewis6991/gitsigns.nvim",
    --     requires = {
    --         'nvim-lua/plenary.nvim'
    --     },
    --     config = require('plugins.gitsigns').config,
    --     disable = false,
    -- })

    -- -- comments
    -- use({
    --     "numToStr/Comment.nvim",
    --     config = require('plugins.comment').config,
    --     disable = false,
    -- })

    -- -- project
    -- use({
    --     "ahmedkhalf/project.nvim",
    --     config = require('plugins.project').config,
    --     disable = false,
    -- })

    -- -- status line
    -- use({
    --     "nvim-lualine/lualine.nvim",
    --     requires = {
    --         'kyazdani42/nvim-web-devicons',
    --     },
    --     config = require('plugins.lualine').config,
    --     disable = false,
    -- })

    -- motion plugins, check this out!
    -- https://github.com/ggandor/lightspeed.nvim

    -- -- bufferline / tabs
    -- use({
    --     "romgrk/barbar.nvim",
    --     requires = {
    --         'kyazdani42/nvim-web-devicons',
    --     },
    --     config = require('plugins.barbar').config,
    --     disable = false,
    -- })

    -- -- dashboard
    -- -- TODO: define globals elsewhere, call dashboard without a setup/config func
    -- use({
    --     "ChristianChiarulli/dashboard-nvim",
    --     requires = {
    --         'nvim-telescope/telescope.nvim',
    --     },
    --     setup = require('plugins.dashboard').setup,
    --     disable = true,
    -- })

    -- -- terminal
    -- use({
    --     "akinsho/toggleterm.nvim",
    --     config = require('plugins.toggleterm').config,
    --     disable = false,
    -- })

    -- -- utility or required by other ones
    -- use("nvim-lua/popup.nvim") -- this could maybe be deleted (require where needed)
    -- use("nvim-lua/plenary.nvim") -- could maybe be delete (require where needed)

    -- -- experimenting

    -- -- tmp fixes
    -- use("antoinemadec/FixCursorHold.nvim") -- Needed while issue https://github.com/neovim/neovim/issues/12587 is still open

    -- -- sort through
    -- use('hrsh7th/vim-vsnip') -- event: InsertEnter
    -- use('rafamadriz/friendly-snippets') -- event: InsertCharPre (maybe for cmp?)
    -- use({"rcarriga/nvim-notify", disable = false})
    -- use({"Tastyep/structlog.nvim", disable = false})

    -- -- Automatically set up your configuration after cloning packer.nvim
    -- -- Put this at the end after all plugins
    -- if PACKER_BOOTSTRAP then
    --   -- plugins.sync()
    --   require("packer").sync()
    -- end
  end)
end

function M:sync()
  if require("packer") then
    require("packer").sync()
  else
    print("error: packer expected")
  end
end

function M:install()
  M.init()
  M.install_ret = M._install()
end

function M:configure()
  -- print("configuring plugins")
  -- TODO: protected call for these?
  -- TODO: underscore file names for namespace collision avoidance.
  -- require('plugins.cmp')
  require("plugins.telescope")
  require("plugins.treesitter")
  require("plugins.autopairs")
  require("plugins.comment")
  require("plugins.gitsigns")
  require("plugins._nvimtree")
  require("plugins.bufferline")
  require("plugins.lualine")
  require("plugins.hop")
  require("plugins.toggleterm")
  require("plugins.impatient")
  require("plugins.indentblankline")
  require("plugins.alpha")
  require("plugins.whichkey")
  require("plugins._symbolsoutline")
  require("plugins._quickscope")
end

-- M.install()

return M
