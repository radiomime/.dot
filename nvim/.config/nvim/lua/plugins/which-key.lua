local M = {}
print('whichkey: proper config was called, this is the outside')

function M:config()
  print('whichkey: config was called, the proper one')
  local wk = require('which-key')
    -- require("which-key").setup({
    wk.setup({
      plugins = {
        marks = true, -- shows a list of your marks on ' and `
        registers = true, -- shows your registers on " in NORMAL or <C-r> in INSERT mode
        spelling = {
          enabled = true, -- enabling this will show WhichKey when pressing z= to select spelling suggestions
          suggestions = 20, -- how many suggestions should be shown in the list?
        },
        -- the presets plugin, adds help for a bunch of default keybindings in Neovim
        -- No actual key bindings are created
        presets = {
          -- lunarvim has operators, motions, and text_objects as false. Speed?
          operators = true, -- adds help for operators like d, y, ... and registers them for motion / text object completion
          motions = true, -- adds help for motions
          text_objects = true, -- help for text objects triggered after entering an operator
          windows = true, -- default bindings on <c-w>
          nav = true, -- misc bindings to work with windows
          z = true, -- bindings for folds, spelling and others prefixed with z
          g = true, -- bindings for prefixed with g
        },
      },
      -- add operators that will trigger motion and text object completion
      -- to enable all native operators, set the preset / operators plugin above
      operators = { gc = "Comments" },
      key_labels = {
        -- override the label used to display some keys. It doesn't effect WK in any other way.
        -- For example:
        -- ["<space>"] = "SPC",
        -- ["<cr>"] = "RET",
        -- ["<tab>"] = "TAB",
      },
      icons = {
        breadcrumb = "»", -- symbol used in the command line area that shows your active key combo
        separator = "➜", -- symbol used between a key and it's label
        group = "+", -- symbol prepended to a group
      },
      popup_mappings = {
        scroll_down = '<c-d>', -- binding to scroll down inside the popup
        scroll_up = '<c-u>', -- binding to scroll up inside the popup
      },
      window = {
        border = "double", -- none, single, double, shadow
        position = "top", -- bottom, top
        margin = { 1, 0, 1, 0 }, -- extra window margin [top, right, bottom, left]
        padding = { 2, 2, 2, 2 }, -- extra window padding [top, right, bottom, left]
        winblend = 0
      },
      layout = {
        height = { min = 4, max = 25 }, -- min and max height of the columns
        width = { min = 20, max = 50 }, -- min and max width of the columns
        spacing = 3, -- spacing between columns
        align = "left", -- align columns left, center or right
      },
      ignore_missing = false, -- enable this to hide mappings for which you didn't specify a label
      hidden = {
        "<silent>",
        "<cmd>", 
        "<Cmd>",
        "<CR>",
        "call",
        "lua",
        "^:",
        "^ "
      }, -- hide mapping boilerplate
      show_help = true, -- show help message on the command line when the popup is visible
      triggers = "auto", -- automatically setup triggers
      -- triggers = {"<leader>"} -- or specify a list manually
      triggers_blacklist = {
        -- list of mode / prefixes that should never be hooked by WhichKey
        -- this is mostly relevant for key maps that start with a native binding
        -- most people should not need to change this
        i = { "j", "k" },
        v = { "j", "k" },
      },
    })

    wk.register({
            ["w"] = { "<cmd>w!<CR>", "Save" },
            ["q"] = { "<cmd>q!<CR>", "Quit" },
            ["/"] = { "<cmd>CommentToggle<CR>", "Comment" },
            [";"] = { "<cmd>Dashboard<CR>", "Dashboard" },
            ["c"] = { "<cmd>BufferClose!<CR>", "Close Buffer" },
            ["f"] = { "<cmd>Telescope find_files<CR>", "Find File" },
            ["z"] = { "<cmd>ZenMode<CR>", "Zen Mode" },
            -- ["h"] = { "<cmd>nohlsearch<CR>", "No Highlight" },
            ["v"] = { "<cmd>vsplit<CR>", "Vertical split" },
            ["h"] = { "<cmd>split<CR>", "Horizontal split" },
            -- TODO: remove redundant and combine, s and f keywords
            -- f = {
            --     name = "Telescope",
            --     f = { "<cmd>Telescope find_files<cr>", "Find File" },
            --     d = { "<cmd>Telescope find_files<cr>", "Find File" },
            -- },
            s = {
                name = "Search",
                f = { "<cmd>Telescope find_files<cr>", "Find File" },
                d = {
                    "<cmd>Telescope find_files hidden=true<cr>",
                    "Find File (+hidden)",
                },
                b = { "<cmd>Telescope git_branches<cr>", "Checkout branch" },
                c = { "<cmd>Telescope colorscheme<cr>", "Colorscheme" },
                h = { "<cmd>Telescope help_tags<cr>", "Find Help" },
                M = { "<cmd>Telescope man_pages<cr>", "Man Pages" },
                r = { "<cmd>Telescope oldfiles<cr>", "Open Recent File" },
                R = { "<cmd>Telescope registers<cr>", "Registers" },
                t = { "<cmd>Telescope live_grep<cr>", "Text" },
                k = { "<cmd>Telescope keymaps<cr>", "Keymaps" },
                C = { "<cmd>Telescope commands<cr>", "Commands" },
                p = {
                    "<cmd>lua require('telescope.builtin.internal').colorscheme({enable_preview = true})<cr>",
                    "Colorscheme with Preview",
                },
            },
            b = {
                name = "Buffers",
                j = { "<cmd>BufferPick<cr>", "jump to buffer" },
                f = { "<cmd>Telescope buffers<cr>", "Find buffer" },
                w = { "<cmd>BufferWipeout<cr>", "wipeout buffer" },
                e = {
                    "<cmd>BufferCloseAllButCurrent<cr>",
                    "close all but current buffer",
                },
                h = {
                    "<cmd>BufferCloseBuffersLeft<cr>",
                    "close all buffers to the left",
                },
                l = {
                    "<cmd>BufferCloseBuffersRight<cr>",
                    "close all BufferLines to the right",
                },
                D = {
                    "<cmd>BufferOrderByDirectory<cr>",
                    "sort BufferLines automatically by directory",
                },
                L = {
                    "<cmd>BufferOrderByLanguage<cr>",
                    "sort BufferLines automatically by language",
                },
            },
            p = {
                name = "Packer",
                c = { "<cmd>PackerCompile<cr>", "Compile" },
                i = { "<cmd>PackerInstall<cr>", "Install" },
                r = {
                    "<cmd>lua require('utils').reload_lv_config()<cr>",
                    "Reload",
                },
                s = { "<cmd>PackerSync<cr>", "Sync" },
                S = { "<cmd>PackerStatus<cr>", "Status" },
                u = { "<cmd>PackerUpdate<cr>", "Update" },
            },

            -- " Available Debug Adapters:
            -- "   https://microsoft.github.io/debug-adapter-protocol/implementors/adapters/
            -- " Adapter configuration and installation instructions:
            -- "   https://github.com/mfussenegger/nvim-dap/wiki/Debug-Adapter-installation
            -- " Debug Adapter protocol:
            -- "   https://microsoft.github.io/debug-adapter-protocol/
            -- " Debugging
            g = {
                name = "Git",
                g = { "<cmd>lua require('plugins.toggleterm')._lazygit_toggle()<cr>", "LazyGit" },
                -- g = { "<cmd>lua require('toggleterm.terminal').Terminal:new {cmd = 'lazygit', hidden = true}<cr>", "LazyGit" },
                j = { "<cmd>lua require 'gitsigns'.next_hunk()<cr>", "Next Hunk" },
                k = { "<cmd>lua require 'gitsigns'.prev_hunk()<cr>", "Prev Hunk" },
                l = { "<cmd>lua require 'gitsigns'.blame_line()<cr>", "Blame" },
                p = {
                    "<cmd>lua require 'gitsigns'.preview_hunk()<cr>",
                    "Preview Hunk",
                },
                r = {
                    "<cmd>lua require 'gitsigns'.reset_hunk()<cr>",
                    "Reset Hunk",
                },
                R = {
                    "<cmd>lua require 'gitsigns'.reset_buffer()<cr>",
                    "Reset Buffer",
                },
                s = {
                    "<cmd>lua require 'gitsigns'.stage_hunk()<cr>",
                    "Stage Hunk",
                },
                u = {
                    "<cmd>lua require 'gitsigns'.undo_stage_hunk()<cr>",
                    "Undo Stage Hunk",
                },
                o = { "<cmd>Telescope git_status<cr>", "Open changed file" },
                b = { "<cmd>Telescope git_branches<cr>", "Checkout branch" },
                c = { "<cmd>Telescope git_commits<cr>", "Checkout commit" },
                C = {
                    "<cmd>Telescope git_bcommits<cr>",
                    "Checkout commit(for current file)",
                },
            },

            l = {
                name = "LSP",
                a = { "<cmd>lua vim.lsp.buf.code_action()<cr>", "Code Action" },
                d = {
                    "<cmd>Telescope lsp_document_diagnostics<cr>",
                    "Document Diagnostics",
                },
                w = {
                    "<cmd>Telescope lsp_workspace_diagnostics<cr>",
                    "Workspace Diagnostics",
                },
                -- f = { "<cmd>silent FormatWrite<cr>", "Format" },
                f = { "<cmd>lua vim.lsp.buf.formatting()<cr>", "Format" },
                i = { "<cmd>LspInfo<cr>", "Info" },
                j = {
                    "<cmd>lua vim.lsp.diagnostic.goto_next({popup_opts = {border = neo.lsp.popup_border}})<cr>",
                    "Next Diagnostic",
                },
                k = {
                    "<cmd>lua vim.lsp.diagnostic.goto_prev({popup_opts = {border = neo.lsp.popup_border}})<cr>",
                    "Prev Diagnostic",
                },
                p = {
                    name = "Peek",
                    d = {
                        "<cmd>lua require('lsp.peek').Peek('definition')<cr>",
                        "Definition",
                    },
                    t = {
                        "<cmd>lua require('lsp.peek').Peek('typeDefinition')<cr>",
                        "Type Definition",
                    },
                    i = {
                        "<cmd>lua require('lsp.peek').Peek('implementation')<cr>",
                        "Implementation",
                    },
                },
                q = {
                    "<cmd>lua vim.lsp.diagnostic.set_loclist()<cr>",
                    "Quickfix",
                },
                r = { "<cmd>lua vim.lsp.buf.rename()<cr>", "Rename" },
                s = {
                    "<cmd>Telescope lsp_document_symbols<cr>",
                    "Document Symbols",
                },
                S = {
                    "<cmd>Telescope lsp_dynamic_workspace_symbols<cr>",
                    "Workspace Symbols",
                },
            },
            j = {
                name = "terminal",
                j = {
                    "<cmd>ToggleTerm<cr>",
                    "Toggle floating terminal",
                },
                g = {
                    "<cmd>lua require('core.terminal').lazygit()<cr>",
                    "Git status terminal",
                },
            },
            L = {
                name = "+LunarVim",
                c = {
                    "<cmd>edit ~/.config/nvim/config.lua<cr>",
                    "Edit config.lua",
                },
                f = {
                    "<cmd>lua require('core.telescope').find_lunarvim_files()<cr>",
                    "Find LunarVim files",
                },
                g = {
                    "<cmd>lua require('core.telescope').grep_lunarvim_files()<cr>",
                    "Grep LunarVim files",
                },
                k = {
                    "<cmd>lua require('keymappings').print()<cr>",
                    "View LunarVim's default keymappings",
                },
                i = {
                    "<cmd>lua require('core.info').toggle_popup(vim.bo.filetype)<cr>",
                    "Toggle LunarVim Info",
                },
                l = {
                    name = "+logs",
                    d = {
                        "<cmd>lua require('core.terminal').toggle_log_view('lunarvim')<cr>",
                        "view default log",
                    },
                    D = {
                        "<cmd>edit ~/.cache/nvim/lunarvim.log<cr>",
                        "Open the default logfile",
                    },
                    n = {
                        "<cmd>lua require('core.terminal').toggle_log_view('lsp')<cr>",
                        "view lsp log",
                    },
                    N = {
                        "<cmd>edit ~/.cache/nvim/log<cr>",
                        "Open the Neovim logfile",
                    },
                    l = {
                        "<cmd>lua require('core.terminal').toggle_log_view('nvim')<cr>",
                        "view neovim log",
                    },
                    L = {
                        "<cmd>edit ~/.cache/nvim/lsp.log<cr>",
                        "Open the LSP logfile",
                    },
                    p = {
                        "<cmd>lua require('core.terminal').toggle_log_view('packer.nvim')<cr>",
                        "view packer log",
                    },
                    P = {
                        "<cmd>edit ~/.cache/nvim/packer.nvim.log<cr>",
                        "Open the Packer logfile",
                    },
                },
            },
            t = {
                name = "nvimtree",
                t = { ":NvimTreeToggle<cr>", "Toggle" },
            },
            T = {
                name = "Treesitter",
                i = { ":TSConfigInfo<cr>", "Info" },
            },
    }, {
          mode = "n", -- NORMAL mode
          prefix = "<leader>",
          buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
          silent = true, -- use `silent` when creating keymaps
          noremap = true, -- use `noremap` when creating keymaps
          nowait = true, -- use `nowait` when creating keymaps
    })

    wk.register({
      ["/"] = { ":CommentToggle<CR>", "Comment" },
    }, {
            mode = "v", -- VISUAL mode
            prefix = "<leader>",
            buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
            silent = true, -- use `silent` when creating keymaps
            noremap = true, -- use `noremap` when creating keymaps
            nowait = true, -- use `nowait` when creating keymaps
    })
end

return M
