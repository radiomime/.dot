local nvim_cmp = {}

-- function nvm_cmp:check_status()
--   local status_cmp_ok, cmp = pcall(require, "cmp")
--   if not status_cmp_ok then
--     return
--   end
--   local status_luasnip_ok, luasnip = pcall(require, "luasnip")
--   if not status_luasnip_ok then
--     return
--   end
-- end

function nvim_cmp:config()
    -- require("nvim-cmp").setup({
    require("cmp").setup({
        snippet = {
            -- REQUIRED - you must specify a snippet engine
            expand = function(args)
                require("luasnip").lsp_expand(args.body) -- For `luasnip` users.
                -- vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
                -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
                -- require'snippy'.expand_snippet(args.body) -- For `snippy` users.
            end,
        },
        -- confirm_opts = {
        --     behavior = cmp.ConfirmBehavior.Replace,
        --     select = true,
        -- },
        completion = {
            ---@usage The minimum length of a word to complete on.
            keyword_length = 1,
        },
        -- experimental = {
        --     ghost_text = true,
        --     native_menu = false,
        -- },
        --         formatting = {
        --             kind_icons = {
        --                 Class = " ",
        --                 Color = " ",
        --                 Constant = "ﲀ ",
        --                 Constructor = " ",
        --                 Enum = "練",
        --                 EnumMember = " ",
        --                 Event = " ",
        --                 Field = " ",
        --                 File = "",
        --                 Folder = " ",
        --                 Function = " ",
        --                 Interface = "ﰮ ",
        --                 Keyword = " ",
        --                 Method = " ",
        --                 Module = " ",
        --                 Operator = "",
        --                 Property = " ",
        --                 Reference = " ",
        --                 Snippet = " ",
        --                 Struct = " ",
        --                 Text = " ",
        --                 TypeParameter = " ",
        --                 Unit = "塞",
        --                 Value = " ",
        --                 Variable = " ",
        --             },
        --             source_names = {
        --                 nvim_lsp = "(LSP)",
        --                 emoji = "(Emoji)",
        --                 path = "(Path)",
        --                 calc = "(Calc)",
        --                 cmp_tabnine = "(Tabnine)",
        --                 vsnip = "(Snippet)",
        --                 luasnip = "(Snippet)",
        --                 buffer = "(Buffer)",
        --             },
        --             duplicates = {
        --                 buffer = 1,
        --                 path = 1,
        --                 nvim_lsp = 0,
        --                 luasnip = 1,
        --             },
        --             duplicates_default = 0,
        --             format = function(entry, vim_item)
        --                 vim_item.kind =
        --                     lvim.builtin.cmp.formatting.kind_icons[vim_item.kind]
        --                 vim_item.menu =
        --                     lvim.builtin.cmp.formatting.source_names[entry.source.name]
        --                 vim_item.dup = lvim.builtin.cmp.formatting.duplicates[entry.source.name]
        --                     or lvim.builtin.cmp.formatting.duplicates_default
        --                 return vim_item
        --             end,
        --         },
        --         snippet = {
        --             expand = function(args)
        --                 require("luasnip").lsp_expand(args.body)
        --             end,
        --         },
        --         documentation = {
        --             border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
        --         },
        --         sources = {
        --             { name = "nvim_lsp" },
        --             { name = "path" },
        --             { name = "luasnip" },
        --             { name = "cmp_tabnine" },
        --             { name = "nvim_lua" },
        --             { name = "buffer" },
        --             { name = "calc" },
        --             { name = "emoji" },
        --             { name = "treesitter" },
        --             { name = "crates" },
        --         },
        --         mapping = {
        --             ["<C-k>"] = cmp.mapping.select_prev_item(),
        --             ["<C-j>"] = cmp.mapping.select_next_item(),
        --             ["<C-d>"] = cmp.mapping.scroll_docs(-4),
        --             ["<C-f>"] = cmp.mapping.scroll_docs(4),
        --             -- TODO: potentially fix emmet nonsense
        --             ["<Tab>"] = cmp.mapping(function(fallback)
        --                 if cmp.visible() then
        --                     cmp.select_next_item()
        --                 elseif luasnip.expandable() then
        --                     luasnip.expand()
        --                 elseif jumpable() then
        --                     luasnip.jump(1)
        --                 elseif check_backspace() then
        --                     fallback()
        --                 elseif is_emmet_active() then
        --                     return vim.fn["cmp#complete"]()
        --                 else
        --                     fallback()
        --                 end
        --             end, {
        --                 "i",
        --                 "s",
        --             }),
        --             ["<S-Tab>"] = cmp.mapping(function(fallback)
        --                 if cmp.visible() then
        --                     cmp.select_prev_item()
        --                 elseif jumpable(-1) then
        --                     luasnip.jump(-1)
        --                 else
        --                     fallback()
        --                 end
        --             end, {
        --                 "i",
        --                 "s",
        --             }),
        --
        --             ["<C-Space>"] = cmp.mapping.complete(),
        --             ["<C-e>"] = cmp.mapping.abort(),
        --             ["<CR>"] = cmp.mapping(function(fallback)
        --                 if
        --                     cmp.visible() and cmp.confirm(lvim.builtin.cmp.confirm_opts)
        --                 then
        --                     return
        --                 end
        --
        --                 if jumpable() then
        --                     if not luasnip.jump(1) then
        --                         fallback()
        --                     end
        --                 else
        --                     fallback()
        --                 end
        --             end),
        --         },
    })
end

-- -- post-install/update hook
-- function nvim_cmp:run()
--     require("cmp").setup({
--     })
-- end

return nvim_cmp
