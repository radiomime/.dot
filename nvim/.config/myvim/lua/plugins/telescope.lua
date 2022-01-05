local telescope = {}

function telescope:config()
    require("telescope").setup({
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
                    ["<C-n>"] = require("telescope.actions").move_selection_next,
                    ["<C-p>"] = require("telescope.actions").move_selection_previous,
                    ["<C-c>"] = require("telescope.actions").close,
                    ["<C-j>"] = require("telescope.actions").cycle_history_next,
                    ["<C-k>"] = require("telescope.actions").cycle_history_prev,
                    ["<C-q>"] = require("telescope.actions").smart_send_to_qflist
                        + require("telescope.actions").open_qflist,
                    ["<CR>"] = require("telescope.actions").select_default
                        + require("telescope.actions").center,
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
                    ["<C-n>"] = require("telescope.actions").move_selection_next,
                    ["<C-p>"] = require("telescope.actions").move_selection_previous,
                    ["<C-q>"] = require("telescope.actions").smart_send_to_qflist
                        + require("telescope.actions").open_qflist,
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
end

return telescope
