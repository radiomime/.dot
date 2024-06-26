local M = {}
function M:configure()
  local cmp_okay, cmp = pcall(require, "cmp")
  if not cmp_okay then
    print("error: cannot configure cmp inside configure function")
    return
  end

  local luasnip_ok, luasnip = pcall(require, "luasnip")
  if not luasnip_ok then
    print("error: cannot configure luasnip inside cmp configure function")
    return
  end

  require("luasnip/loaders/from_vscode").lazy_load()

  local check_backspace = function()
    local col = vim.fn.col(".") - 1
    return col == 0 or vim.fn.getline("."):sub(col, col):match("%s")
  end

  --   פּ ﯟ   some other good icons
  local kind_icons = {
    Class = "",
    Color = "",
    Constant = "",
    Constructor = "",
    Copilot = "",
    Enum = "",
    EnumMember = "",
    Event = "",
    Field = "",
    File = "",
    Folder = "",
    Function = "",
    Interface = "",
    Keyword = "",
    Method = "m",
    Module = "",
    Operator = "",
    Property = "",
    Reference = "",
    Snippet = "",
    Struct = "",
    Text = "",
    TypeParameter = "",
    Unit = "",
    Value = "",
    Variable = "",
  }
  -- TODO: are these better? They're the larger versions
  -- kind_icons = {
  --     Class = " ",
  --     Color = " ",
  --     Constant = "ﲀ ",
  --     Constructor = " ",
  --     Enum = "練",
  --     EnumMember = " ",
  --     Event = " ",
  --     Field = " ",
  --     File = "",
  --     Folder = " ",
  --     Function = " ",
  --     Interface = "ﰮ ",
  --     Keyword = " ",
  --     Method = " ",
  --     Module = " ",
  --     Operator = "",
  --     Property = " ",
  --     Reference = " ",
  --     Snippet = " ",
  --     Struct = " ",
  --     Text = " ",
  --     TypeParameter = " ",
  --     Unit = "塞",
  --     Value = " ",
  --     Variable = " ",
  -- },
  -- find more here: https://www.nerdfonts.com/cheat-sheet

  cmp.setup({
    snippet = {
      -- REQUIRED - you must specify a snippet engine
      expand = function(args)
        luasnip.lsp_expand(args.body) -- For `luasnip` users.
      end,
    },
    mapping = {
      -- ["<C-k>"] = cmp.mapping.select_prev_item(), -- TODO: use these instead of tab?
      -- ["<C-j>"] = cmp.mapping.select_next_item(),
      -- ["<C-b>"] = cmp.mapping(cmp.mapping.scroll_docs(-1), { "i", "c" }),
      -- ["<C-f>"] = cmp.mapping(cmp.mapping.scroll_docs(1), { "i", "c" }),
      -- ["<C-d>"] = cmp.mapping.scroll_docs(-4),
      -- ["<C-f>"] = cmp.mapping.scroll_docs(4),
      ["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
      ["<C-y>"] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
      ["<C-e>"] = cmp.mapping({
        i = cmp.mapping.abort(),
        c = cmp.mapping.close(),
      }),
      -- Accept currently selected item. If none selected, `select` first item.
      -- Set `select` to `false` to only confirm explicitly selected items.
      ["<CR>"] = cmp.mapping.confirm({ select = true }),
      -- ["<Tab>"] = cmp.mapping(function(fallback)
      ["<C-j>"] = cmp.mapping(function(fallback)
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
      -- ["<S-Tab>"] = cmp.mapping(function(fallback)
      ["<C-k>"] = cmp.mapping(function(fallback)
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
    sources = {
      -- copilot source
      { name = "copilot", group_index = 2 },
      -- other sources
      { name = "nvim_lsp", group_index = 2 },
      { name = "luasnip", group_index = 2, max_item_count = 2 },
      { name = "buffer", group_index = 2 },
      { name = "path", group_index = 2 },
      -- { name = "copilot" , group_index = 2 },
      -- { name = "treesitter" }, -- TODO: should this be here??
      -- { name = "cmp_tabnine" },
      -- { name = "nvim_lua" },
      -- { name = "calc" },
      -- { name = "emoji" },
      -- { name = "crates" },
    },
    confirm_opts = {
      behavior = cmp.ConfirmBehavior.Replace,
      select = false,
    },
    window = {
      completion = cmp.config.window.bordered(),
      documentation = cmp.config.window.bordered(),
    },
    experimental = {
      ghost_text = false,
      native_menu = false,
    },
  })
end

M.configure()

return M
