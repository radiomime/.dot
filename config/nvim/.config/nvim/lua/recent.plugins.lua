return {
    -- Packer can manage itself as an optional plugin
    -- { "wbthomason/packer.nvim" },
    -- { "folke/tokyonight.nvim" },
    -- { "neovim/nvim-lspconfig" },
    -- { "tamago324/nlsp-settings.nvim" },
    -- { "jose-elias-alvarez/null-ls.nvim" },
    -- {
    --     "kabouzeid/nvim-lspinstall",
    --     event = "VimEnter",
    --     config = function()
    --         local lspinstall = require("core.lspinstall")
    --         lspinstall.setup()
    --     end,
    -- },

    -- { "nvim-lua/popup.nvim" },
    -- { "nvim-lua/plenary.nvim" },
    -- Telescope
    -- {
    --     "nvim-telescope/telescope.nvim",
    --     config = function()
    --         require("core.telescope").setup()
    --     end,
    --     -- requires = { { "nvim-lua/plenary.nvim" } },
    --     disable = not neo.builtin.telescope.active,
    -- },
    -- TODO: primeagen rec: https://github.com/nvim-telescope/telescope-fzf-native.nvim

    -- Completion & Snippets
    -- {
    --     "hrsh7th/nvim-compe",
    --     event = "InsertEnter",
    --     config = function()
    --         require("core.compe").setup()
    --     end,
    --     disable = not neo.builtin.compe.active,
    --     -- wants = "vim-vsnip",
    --     -- requires = {
    --     -- {
    --     --   "hrsh7th/vim-vsnip",
    --     --   wants = "friendly-snippets",
    --     --   event = "InsertCharPre",
    --     -- },
    --     -- {
    --     --   "rafamadriz/friendly-snippets",
    --     --   event = "InsertCharPre",
    --     -- },
    --     -- },
    -- },
    {
        "hrsh7th/vim-vsnip",
        -- wants = "friendly-snippets",
        event = "InsertEnter",
        disable = not neo.builtin.compe.active,
    },
    {
        "rafamadriz/friendly-snippets",
        event = "InsertCharPre",
        disable = not neo.builtin.compe.active,
    },

    -- Autopairs
    {
        "windwp/nvim-autopairs",
        -- event = "InsertEnter",
        after = "nvim-compe",
        config = function()
            require("core.autopairs").setup()
        end,
        disable = not neo.builtin.autopairs.active
            or not neo.builtin.compe.active,
    },

    -- Treesitter
    {
        "nvim-treesitter/nvim-treesitter",
        branch = "0.5-compat",
        -- run = ":TSUpdate",
        config = function()
            require("core.treesitter").setup()
        end,
    },

    -- NvimTree
    {
        "kyazdani42/nvim-tree.lua",
        -- event = "BufWinOpen",
        -- cmd = "NvimTreeToggle",
        -- commit = "fd7f60e242205ea9efc9649101c81a07d5f458bb",
        config = function()
            require("core.nvimtree").setup()
        end,
        disable = not neo.builtin.nvimtree.active,
    },

    {
        "lewis6991/gitsigns.nvim",

        config = function()
            require("core.gitsigns").setup()
        end,
        event = "BufRead",
        disable = not neo.builtin.gitsigns.active,
    },

    -- Whichkey
    {
        "folke/which-key.nvim",
        config = function()
            require("core.which-key").setup()
        end,
        event = "BufWinEnter",
        disable = not neo.builtin.which_key.active,
    },

    -- Comments
    {
        "terrortylor/nvim-comment",
        event = "BufRead",
        config = function()
            require("nvim_comment").setup()
        end,
        disable = not neo.builtin.comment.active,
    },

    -- project.nvim
    {
        "ahmedkhalf/project.nvim",
        config = function()
            require("core.project").setup()
        end,
        disable = not neo.builtin.project.active,
    },

    -- Icons
    { "kyazdani42/nvim-web-devicons" },

    -- Status Line and Bufferline
    {
        -- "hoob3rt/lualine.nvim",
        "shadmansaleh/lualine.nvim",
        -- "Lunarvim/lualine.nvim",
        config = function()
            require("core.lualine").setup()
        end,
        disable = not neo.builtin.lualine.active,
    },

    -- TODO: do I like bar bar? If so, add some leader key shortcuts
    {
        "romgrk/barbar.nvim",
        config = function()
            require("core.bufferline").setup()
        end,
        event = "BufWinEnter",
        disable = not neo.builtin.bufferline.active,
    },

    -- Debugging
    {
        "mfussenegger/nvim-dap",
        -- event = "BufWinEnter",
        config = function()
            require("core.dap").setup()
        end,
        disable = not neo.builtin.dap.active,
    },

    -- Debugger management
    {
        "Pocco81/DAPInstall.nvim",
        -- event = "BufWinEnter",
        -- event = "BufRead",
        disable = not neo.builtin.dap.active,
    },

    -- Dashboard
    {
        "ChristianChiarulli/dashboard-nvim",
        event = "BufWinEnter",
        config = function()
            require("core.dashboard").setup()
        end,
        disable = not neo.builtin.dashboard.active,
    },

    -- Terminal
    {
        "akinsho/nvim-toggleterm.lua",
        event = "BufWinEnter",
        config = function()
            require("core.terminal").setup()
        end,
        disable = not neo.builtin.terminal.active,
    },

    -- Markdown Preview
    {
        "iamcco/markdown-preview.nvim",
        run = "cd app && yarn install",
        -- ft = "markdown",
    },

    -- Zen Mode
    -- TODO: add configuration file for zen-mode!
    -- TODO: whats the deal with configs??
    {
        "folke/zen-mode.nvim",
        event = "BufWinEnter",
        config = function()
            require("core.zenmode").setup()
        end,
        disable = false,
        -- config = function()
        --     require("zen-mode").setup({
        --         window = {
        --             width = 1000,
        --         },
        --     })
        -- end,
    },
}
