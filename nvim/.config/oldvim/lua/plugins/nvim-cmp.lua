local M = {}
M.methods = {}

function M:config()
  local status_cmp_ok, cmp = pcall(require, "cmp")
  if not status_cmp_ok then
    print('error: cmp did not load')
    return
  end

  local status_luasnip_ok, luasnip = pcall(require, "luasnip")
  if not status_luasnip_ok then
    print('error: luasnip did not load')
    return
  end

  require("luasnip/loaders/from_vscode").lazy_load()

  local check_backspace = function()
    local col = vim.fn.col "." - 1
    return col == 0 or vim.fn.getline("."):sub(col, col):match "%s"
  end

  --   פּ ﯟ   some other good icons
  local kind_icons = {
    Text = "",
    Method = "m",
    Function = "",
    Constructor = "",
    Field = "",
    Variable = "",
    Class = "",
    Interface = "",
    Module = "",
    Property = "",
    Unit = "",
    Value = "",
    Enum = "",
    Keyword = "",
    Snippet = "",
    Color = "",
    File = "",
    Reference = "",
    Folder = "",
    EnumMember = "",
    Constant = "",
    Struct = "",
    Event = "",
    Operator = "",
    TypeParameter = "",
  }
  -- find more here: https://www.nerdfonts.com/cheat-sheet

  -- require("nvim-cmp").setup({
  -- local cmp = require("cmp")
  cmp.setup({
      snippet = {
          -- REQUIRED - you must specify a snippet engine
          expand = function(args)
              luasnip.lsp_expand(args.body) -- For `luasnip` users.
              -- vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
              -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
              -- require'snippy'.expand_snippet(args.body) -- For `snippy` users.
          end,
      },
      mapping = {
          ["<C-k>"] = cmp.mapping.select_prev_item(),
          ["<C-j>"] = cmp.mapping.select_next_item(),
          ["<C-d>"] = cmp.mapping.scroll_docs(-4),
          ["<C-f>"] = cmp.mapping.scroll_docs(4),
          -- ["<C-b>"] = cmp.mapping(cmp.mapping.scroll_docs(-1), { "i", "c" }),
          -- ["<C-f>"] = cmp.mapping(cmp.mapping.scroll_docs(1), { "i", "c" }),
          ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
          ['<C-y>'] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
          ["<C-e>"] = cmp.mapping {
            i = cmp.mapping.abort(),
            c = cmp.mapping.close(),
          },
          -- Accept currently selected item. If none selected, `select` first item.
          -- Set `select` to `false` to only confirm explicitly selected items.
          ["<CR>"] = cmp.mapping.confirm { select = true },

          ["<Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_next_item()
            elseif luasnip.expandable() then
              luasnip.expand()
            elseif luasnip.expand_or_jumpable() then
              luasnip.expand_or_jump()
            elseif check_backspace() then
              fallback()
            else
              fallback()
            end
          end, {
            "i",
            "s",
          }),
          ["<S-Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_prev_item()
            elseif luasnip.jumpable(-1) then
              luasnip.jump(-1)
            else
              fallback()
            end
          end, {
            "i",
            "s",
          }),

          -- ["<Tab>"] = cmp.mapping(function(fallback)
          --   if cmp.visible() then
          --     cmp.select_next_item()
          --   elseif luasnip.expandable() then
          --     luasnip.expand()
          --   elseif jumpable() then
          --     luasnip.jump(1)
          --   elseif check_backspace() then
          --     fallback()
          --   elseif is_emmet_active() then
          --     return vim.fn["cmp#complete"]()
          --   else
          --     fallback() -- The fallback function sends a already mapped key. In this case, it's probably `<Tab>`.
          --   end
          -- end, {
          --   "i",
          --   "s",
          -- }),
          -- ["<S-Tab>"] = cmp.mapping(function(fallback)
          --   if cmp.visible() then
          --     cmp.select_prev_item()
          --   elseif jumpable(-1) then
          --     luasnip.jump(-1)
          --   else
          --     fallback()
          --   end
          -- end, {
          --   "i",
          --   "s",
          -- }),
          -- ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
          -- ["<CR>"] = cmp.mapping(function(fallback)
          --   if cmp.visible() then
          --     if jumpable() then
          --       luasnip.jump(1)
          --     end
          --     return
          --   end

          --   if jumpable() then
          --     if not luasnip.jump(1) then
          --       fallback()
          --     end
          --   else
          --     fallback()
          --   end
          -- end),
          -- ['<C-y>'] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
      },
      sources = {
        { name = "nvim_lsp" },
        { name = "luasnip" },
        { name = "path" },
        { name = "buffer" },
        { name = "treesitter" },
        -- { name = "cmp_tabnine" },
        -- { name = "nvim_lua" },
        -- { name = "calc" },
        -- { name = "emoji" },
        -- { name = "crates" },
      },
      documentation = {
        border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
      },
      formatting = {
        fields = { "kind", "abbr", "menu" },
        format = function(entry, vim_item)
          -- Kind icons
          vim_item.kind = string.format("%s", kind_icons[vim_item.kind])
          -- vim_item.kind = string.format('%s %s', kind_icons[vim_item.kind], vim_item.kind) -- This concatonates the icons with the name of the item kind
          vim_item.menu = ({
            nvim_lsp = "[LSP]",
            luasnip = "[Snippet]",
            buffer = "[Buffer]",
            path = "[Path]",
          })[entry.source.name]
          return vim_item
        end,
      },
      -- formatting = {
      --     format = function(entry, vim_item)
      --       -- Kind icons
      --       vim_item.kind = string.format('%s %s', require('plugins.nvim-cmp').kind_icons[vim_item.kind], vim_item.kind) -- This concatonates the icons with the name of the item kind

      --       -- Source
      --       vim_item.menu = ({
      --         buffer = "[Buffer]",
      --         nvim_lsp = "[LSP]",
      --         luasnip = "[LuaSnip]",
      --         nvim_lua = "[Lua]",
      --         latex_symbols = "[LaTeX]",
      --       })[entry.source.name]

      --       return vim_item
      --     end
      --     -- fields = { "kind", "abbr", "menu" },
      --     -- duplicates = {
      --     --   buffer = 1,
      --     --   path = 1,
      --     --   nvim_lsp = 0,
      --     --   luasnip = 1,
      --     -- },
      --     -- duplicates_default = 0,
      -- },
      -- confirm_opts = {
      --     behavior = cmp.ConfirmBehavior.Replace,
      --     select = true,
      -- },
      completion = {
          ---@usage The minimum length of a word to complete on.
          keyword_length = 0,
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
  })
end

return M

-- BELOW IS ASPIRATIONAL --
-- BELOW IS ASPIRATIONAL --
-- BELOW IS ASPIRATIONAL --
-- BELOW IS ASPIRATIONAL --
-- BELOW IS ASPIRATIONAL --

-- local nvim_cmp = {}
-- nvim_cmp.methods = {}
-- 
-- nvim_cmp.kind_icons = {
--               Class = " ",
--               Color = " ",
--               Constant = "ﲀ ",
--               Constructor = " ",
--               Enum = "練",
--               EnumMember = " ",
--               Event = " ",
--               Field = " ",
--               File = "",
--               Folder = " ",
--               Function = " ",
--               Interface = "ﰮ ",
--               Keyword = " ",
--               Method = " ",
--               Module = " ",
--               Operator = "",
--               Property = " ",
--               Reference = " ",
--               Snippet = " ",
--               Struct = " ",
--               Text = " ",
--               TypeParameter = " ",
--               Unit = "塞",
--               Value = " ",
--               Variable = " ",
--             }
-- 
-- nvim_cmp.source_names = {
--               buffer = "(Buffer)",
--               nvim_lsp = "(LSP)",
--               luasnip = "(Snippet)",
--               nvim_lua = "[Lua]",
--               latex_symbols = "[LaTeX]",
--               emoji = "(Emoji)",
--               path = "(Path)",
--               calc = "(Calc)",
--               cmp_tabnine = "(Tabnine)",
--               vsnip = "(Snippet)",
--             }
-- 
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
-- 
-- 
-- ---when inside a snippet, seeks to the nearest luasnip field if possible, and checks if it is jumpable
-- ---@param dir number 1 for forward, -1 for backward; defaults to 1
-- ---@return boolean true if a jumpable luasnip field is found while inside a snippet
-- local function jumpable(dir)
--   local luasnip_ok, luasnip = pcall(require, "luasnip")
--   if not luasnip_ok then
--     return
--   end
-- 
--   local win_get_cursor = vim.api.nvim_win_get_cursor
--   local get_current_buf = vim.api.nvim_get_current_buf
-- 
--   local function inside_snippet()
--     -- for outdated versions of luasnip
--     if not luasnip.session.current_nodes then
--       return false
--     end
-- 
--     local node = luasnip.session.current_nodes[get_current_buf()]
--     if not node then
--       return false
--     end
-- 
--     local snip_begin_pos, snip_end_pos = node.parent.snippet.mark:pos_begin_end()
--     local pos = win_get_cursor(0)
--     pos[1] = pos[1] - 1 -- LuaSnip is 0-based not 1-based like nvim for rows
--     return pos[1] >= snip_begin_pos[1] and pos[1] <= snip_end_pos[1]
--   end
-- 
--   ---sets the current buffer's luasnip to the one nearest the cursor
--   ---@return boolean true if a node is found, false otherwise
--   local function seek_luasnip_cursor_node()
--     -- for outdated versions of luasnip
--     if not luasnip.session.current_nodes then
--       return false
--     end
-- 
--     local pos = win_get_cursor(0)
--     pos[1] = pos[1] - 1
--     local node = luasnip.session.current_nodes[get_current_buf()]
--     if not node then
--       return false
--     end
-- 
--     local snippet = node.parent.snippet
--     local exit_node = snippet.insert_nodes[0]
-- 
--     -- exit early if we're past the exit node
--     if exit_node then
--       local exit_pos_end = exit_node.mark:pos_end()
--       if (pos[1] > exit_pos_end[1]) or (pos[1] == exit_pos_end[1] and pos[2] > exit_pos_end[2]) then
--         snippet:remove_from_jumplist()
--         luasnip.session.current_nodes[get_current_buf()] = nil
-- 
--         return false
--       end
--     end
-- 
--     node = snippet.inner_first:jump_into(1, true)
--     while node ~= nil and node.next ~= nil and node ~= snippet do
--       local n_next = node.next
--       local next_pos = n_next and n_next.mark:pos_begin()
--       local candidate = n_next ~= snippet and next_pos and (pos[1] < next_pos[1])
--         or (pos[1] == next_pos[1] and pos[2] < next_pos[2])
-- 
--       -- Past unmarked exit node, exit early
--       if n_next == nil or n_next == snippet.next then
--         snippet:remove_from_jumplist()
--         luasnip.session.current_nodes[get_current_buf()] = nil
-- 
--         return false
--       end
-- 
--       if candidate then
--         luasnip.session.current_nodes[get_current_buf()] = node
--         return true
--       end
-- 
--       local ok
--       ok, node = pcall(node.jump_from, node, 1, true) -- no_move until last stop
--       if not ok then
--         snippet:remove_from_jumplist()
--         luasnip.session.current_nodes[get_current_buf()] = nil
-- 
--         return false
--       end
--     end
-- 
--     -- No candidate, but have an exit node
--     if exit_node then
--       -- to jump to the exit node, seek to snippet
--       luasnip.session.current_nodes[get_current_buf()] = snippet
--       return true
--     end
-- 
--     -- No exit node, exit from snippet
--     snippet:remove_from_jumplist()
--     luasnip.session.current_nodes[get_current_buf()] = nil
--     return false
--   end
-- 
--   if dir == -1 then
--     return inside_snippet() and luasnip.jumpable(-1)
--   else
--     return inside_snippet() and seek_luasnip_cursor_node() and luasnip.jumpable()
--   end
-- end
-- nvim_cmp.methods.jumpable = jumpable
-- 
-- function nvim_cmp:config()
-- -- local kind_icons = {
-- --               Class = " ",
-- --               Color = " ",
-- --               Constant = "ﲀ ",
-- --               Constructor = " ",
-- --               Enum = "練",
-- --               EnumMember = " ",
-- --               Event = " ",
-- --               Field = " ",
-- --               File = "",
-- --               Folder = " ",
-- --               Function = " ",
-- --               Interface = "ﰮ ",
-- --               Keyword = " ",
-- --               Method = " ",
-- --               Module = " ",
-- --               Operator = "",
-- --               Property = " ",
-- --               Reference = " ",
-- --               Snippet = " ",
-- --               Struct = " ",
-- --               Text = " ",
-- --               TypeParameter = " ",
-- --               Unit = "塞",
-- --               Value = " ",
-- --               Variable = " ",
-- --             }
-- -- 
-- -- local       source_names = {
-- --               buffer = "(Buffer)",
-- --               nvim_lsp = "(LSP)",
-- --               luasnip = "(Snippet)",
-- --               nvim_lua = "[Lua]",
-- --               latex_symbols = "[LaTeX]",
-- --               emoji = "(Emoji)",
-- --               path = "(Path)",
-- --               calc = "(Calc)",
-- --               cmp_tabnine = "(Tabnine)",
-- --               vsnip = "(Snippet)",
-- --             }
--   local status_cmp_ok, cmp = pcall(require, "cmp")
--   if not status_cmp_ok then
--     return
--   else
--     print('cmp loaded okay')
--   end
--   local status_luasnip_ok, luasnip = pcall(require, "luasnip")
--   if not status_luasnip_ok then
--     return
--   else
--     print('luasnip loaded okay for cmp')
--   end
-- 
--     -- require("nvim-cmp").setup({
--     require("cmp").setup({
--         snippet = {
--             -- REQUIRED - you must specify a snippet engine
--             expand = function(args)
--                 require("luasnip").lsp_expand(args.body) -- For `luasnip` users.
--                 -- vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
--                 -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
--                 -- require'snippy'.expand_snippet(args.body) -- For `snippy` users.
--             end,
--         },
--         mapping = {
--             ["<C-k>"] = cmp.mapping.select_prev_item(),
--             ["<C-j>"] = cmp.mapping.select_next_item(),
--             ["<C-d>"] = cmp.mapping.scroll_docs(-4),
--             ["<C-f>"] = cmp.mapping.scroll_docs(4),
--             ["<Tab>"] = cmp.mapping(function(fallback)
--               if cmp.visible() then
--                 cmp.select_next_item()
--               elseif luasnip.expandable() then
--                 luasnip.expand()
--               elseif jumpable() then
--                 luasnip.jump(1)
--               elseif check_backspace() then
--                 fallback()
--               elseif is_emmet_active() then
--                 return vim.fn["cmp#complete"]()
--               else
--                 fallback() -- The fallback function sends a already mapped key. In this case, it's probably `<Tab>`.
--               end
--             end, {
--               "i",
--               "s",
--             }),
--             ["<S-Tab>"] = cmp.mapping(function(fallback)
--               if cmp.visible() then
--                 cmp.select_prev_item()
--               elseif jumpable(-1) then
--                 luasnip.jump(-1)
--               else
--                 fallback()
--               end
--             end, {
--               "i",
--               "s",
--             }),
--             ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
--             ['<C-e>'] = cmp.mapping({
--               i = cmp.mapping.abort(),
--               c = cmp.mapping.close(),
--             }),
--             -- ['<CR>'] = cmp.mapping.confirm({ select = true }),
--             ["<CR>"] = cmp.mapping(function(fallback)
--               if cmp.visible() then
--                 if jumpable() then
--                   luasnip.jump(1)
--                 end
--                 return
--               end
-- 
--               if jumpable() then
--                 if not luasnip.jump(1) then
--                   fallback()
--                 end
--               else
--                 fallback()
--               end
--             end),
--             ['<C-y>'] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
--         },
--         sources = {
--           { name = "nvim_lsp" },
--           { name = "path" },
--           { name = "luasnip" },
--           { name = "cmp_tabnine" },
--           { name = "nvim_lua" },
--           { name = "buffer" },
--           { name = "calc" },
--           { name = "emoji" },
--           { name = "treesitter" },
--           { name = "crates" },
--         },
--         documentation = {
--           border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
--         },
--         formatting = {
--             format = function(entry, vim_item)
--               -- Kind icons
--               vim_item.kind = string.format('%s %s', require('plugins.nvim-cmp').kind_icons[vim_item.kind], vim_item.kind) -- This concatonates the icons with the name of the item kind
-- 
--               -- Source
--               vim_item.menu = ({
--                 buffer = "[Buffer]",
--                 nvim_lsp = "[LSP]",
--                 luasnip = "[LuaSnip]",
--                 nvim_lua = "[Lua]",
--                 latex_symbols = "[LaTeX]",
--               })[entry.source.name]
-- 
--               return vim_item
--             end
--             -- fields = { "kind", "abbr", "menu" },
--             -- duplicates = {
--             --   buffer = 1,
--             --   path = 1,
--             --   nvim_lsp = 0,
--             --   luasnip = 1,
--             -- },
--             -- duplicates_default = 0,
--         },
--         -- confirm_opts = {
--         --     behavior = cmp.ConfirmBehavior.Replace,
--         --     select = true,
--         -- },
--         completion = {
--             ---@usage The minimum length of a word to complete on.
--             keyword_length = 1,
--         },
--         -- experimental = {
--         --     ghost_text = true,
--         --     native_menu = false,
--         -- },
--         --         formatting = {
--         --             kind_icons = {
--         --                 Class = " ",
--         --                 Color = " ",
--         --                 Constant = "ﲀ ",
--         --                 Constructor = " ",
--         --                 Enum = "練",
--         --                 EnumMember = " ",
--         --                 Event = " ",
--         --                 Field = " ",
--         --                 File = "",
--         --                 Folder = " ",
--         --                 Function = " ",
--         --                 Interface = "ﰮ ",
--         --                 Keyword = " ",
--         --                 Method = " ",
--         --                 Module = " ",
--         --                 Operator = "",
--         --                 Property = " ",
--         --                 Reference = " ",
--         --                 Snippet = " ",
--         --                 Struct = " ",
--         --                 Text = " ",
--         --                 TypeParameter = " ",
--         --                 Unit = "塞",
--         --                 Value = " ",
--         --                 Variable = " ",
--         --             },
--         --             source_names = {
--         --                 nvim_lsp = "(LSP)",
--         --                 emoji = "(Emoji)",
--         --                 path = "(Path)",
--         --                 calc = "(Calc)",
--         --                 cmp_tabnine = "(Tabnine)",
--         --                 vsnip = "(Snippet)",
--         --                 luasnip = "(Snippet)",
--         --                 buffer = "(Buffer)",
--         --             },
--         --             duplicates = {
--         --                 buffer = 1,
--         --                 path = 1,
--         --                 nvim_lsp = 0,
--         --                 luasnip = 1,
--         --             },
--         --             duplicates_default = 0,
--         --             format = function(entry, vim_item)
--         --                 vim_item.kind =
--         --                     lvim.builtin.cmp.formatting.kind_icons[vim_item.kind]
--         --                 vim_item.menu =
--         --                     lvim.builtin.cmp.formatting.source_names[entry.source.name]
--         --                 vim_item.dup = lvim.builtin.cmp.formatting.duplicates[entry.source.name]
--         --                     or lvim.builtin.cmp.formatting.duplicates_default
--         --                 return vim_item
--         --             end,
--         --         },
--         --         snippet = {
--         --             expand = function(args)
--         --                 require("luasnip").lsp_expand(args.body)
--         --             end,
--         --         },
--         --         documentation = {
--         --             border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
--         --         },
--         --         sources = {
--         --             { name = "nvim_lsp" },
--         --             { name = "path" },
--         --             { name = "luasnip" },
--         --             { name = "cmp_tabnine" },
--         --             { name = "nvim_lua" },
--         --             { name = "buffer" },
--         --             { name = "calc" },
--         --             { name = "emoji" },
--         --             { name = "treesitter" },
--         --             { name = "crates" },
--         --         },
--     })
-- end
-- 
-- return nvim_cmp