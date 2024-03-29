local status_ok, wk = pcall(require, "which-key")
if not status_ok then
  return
end

-- TODO: what is using <leader> q

local setup = {
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
    scroll_down = "<c-d>", -- binding to scroll down inside the popup
    scroll_up = "<c-u>", -- binding to scroll up inside the popup
  },
  window = {
    border = "rounded", -- none, single, double, shadow, rounded
    position = "bottom", -- bottom, top
    margin = { 1, 0, 1, 0 }, -- extra window margin [top, right, bottom, left]
    padding = { 2, 2, 2, 2 }, -- extra window padding [top, right, bottom, left]
    winblend = 0,
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
    "^ ",
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
}

local normal_opts = {
  mode = "n", -- NORMAL mode
  prefix = "<leader>",
  buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
  silent = true, -- use `silent` when creating keymaps
  noremap = true, -- use `noremap` when creating keymaps
  nowait = true, -- use `nowait` when creating keymaps
}

local normal_mappings = {
  ["a"] = { "<cmd>Alpha<cr>", "Alpha" },
  ["e"] = { "<cmd>NvimTreeToggle<cr>", "Tree Explorer" },
  ["E"] = { "<cmd>NvimTreeFindFile<cr>", "Open File in Tree Explorer" },
  ["w"] = { "<cmd>w!<CR>", "Save" },
  ["q"] = { "<cmd>q!<CR>", "Quit" },
  ["u"] = { "<cmd>QuickScopeToggle<CR>", "QuickScope Toggle Highlight" },

  ["J"] = {
    "<cmd>call search('\\%' . virtcol('.') . 'v\\S', 'wW')<cr>",
    "jump down to next non-blank space in column",
  },
  ["K"] = {
    "<cmd>call search('\\%' . virtcol('.') . 'v\\S', 'bW')<cr>",
    "jump up to next non-blank space in column",
  },

  ["/"] = { "<cmd>CommentToggle<CR>", "Comment" },
  -- [";"] = { "<cmd>Dashboard<CR>", "Dashboard" },
  ["m"] = { "<cmd>MarkdownPreview<CR>", "Markdown Preview" },
  -- TODO: separate 'f' into separate commands?
  -- ["f"] = { "<cmd>Telescope find_files<CR>", "Find File" },
  -- ["f"] = {
  --   "<cmd>Telescope find_files hidden=true search_dirs=['.','local','private']<CR>",
  --   "Find File",
  -- },
  ["f"] = {
    -- "<cmd>Telescope find_files follow=true hidden=true no_ignore=true no_ignore_parent=true<CR>",
    -- "<cmd>Telescope find_files no_ignore_parent=true no_ignore=true<CR>",
    "<cmd>Telescope find_files hidden=true search_dirs=['./local','./private','./keys','.']<CR>",
    "Find File",
  },
  -- TODO: add zenmode back in?
  -- ["h"] = { "<cmd>nohlsearch<CR>", "No Highlight" },
  -- ["z"] = { "<cmd>ZenMode<CR>", "Zen Mode" },
  ["v"] = { "<cmd>vsplit<CR>", "Vertical split" },
  ["V"] = { "<cmd>split<CR>", "Horizontal split" },
  -- ["h"] = { "<cmd>split<CR>", "Horizontal split" },
  ["P"] = {
    "<cmd>lua require('telescope').extensions.projects.projects()<cr>",
    "Projects",
  },
  ["o"] = { "<cmd>SymbolsOutline<CR>", "Symbols Outline" },

  b = {
    name = "Buffers",
    c = { "<cmd>Bdelete!<CR>", "Close Buffer" },
    j = { "<cmd>BufferPick<cr>", "jump to buffer" },
    f = { "<cmd>Telescope buffers<cr>", "Find buffer" },
    w = { "<cmd>BufferWipeout<cr>", "wipeout buffer" },
    u = { "<cmd>UrlView buffer<cr>", "find urls in buffer" },
    b = {
      "<cmd>Telescope buffers<cr>",
      "Buffers",
    },
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
  -- c = {
  --   name = "copilot",
  --   s = { "<cmd>Copilot status<cr>", "status" },
  --   e = { "<cmd>Copilot enable<cr>", "enable" },
  --   d = { "<cmd>Copilot disable<cr>", "disable" },
  --   p = { "<cmd>Copilot panel<cr>", "panel" },
  -- },
  h = {
    name = "Hop",
    -- AC, BC, and MW suffix can be hoping before and after the cursor, and multiwindow
    h = { "<cmd>HopChar1<cr>", "Char  1" },
    b = { "<cmd>HopWord<cr>", "Word  buffer" },
    a = { "<cmd>HopChar1<cr>", "Char  1" },
    s = { "<cmd>HopChar2<cr>", "Char  2" },
    w = { "<cmd>HopWordMW<cr>", "Word  multiwindow" },
    p = { "<cmd>HopChar<cr>", "Pattern" },
    l = { "<cmd>HopLine<cr>", "Line" },
  },
  p = {
    name = "Packer",
    -- TODO: add commands to reload, remove all, reinstall, etc.
    -- see lunarvim reload_lv_config in their util file for deets
    c = { "<cmd>PackerCompile<cr>", "Compile" },
    i = { "<cmd>PackerInstall<cr>", "Install" },
    s = { "<cmd>PackerSync<cr>", "Sync" },
    S = { "<cmd>PackerStatus<cr>", "Status" },
    u = { "<cmd>PackerUpdate<cr>", "Update" },
    p = { "<cmd>UrlView packer<cr>", "Search URLs to plugins" },
  },
  d = {
    name = "Diagnostics",
    d = { "<cmd>TroubleToggle<cr>", "Toggle Trouble" },
    r = { "<cmd>TroubleRefresh<cr>", "Refresh Trouble" },
  },
  -- TODO: combine this section with keymaps section of gitsigns.lua
  g = {
    name = "Git",
    g = { "<cmd>lua _LAZYGIT_TOGGLE()<CR>", "Lazygit" },
    j = { "<cmd>lua require 'gitsigns'.next_hunk()<cr>", "Next Hunk" },
    k = { "<cmd>lua require 'gitsigns'.prev_hunk()<cr>", "Prev Hunk" },
    -- l = { "<cmd>lua require 'gitsigns'.blame_line()<cr>", "Blame" },
    l = { "<cmd>Gitsigns blame_line<cr>", "Blame" },
    p = { "<cmd>lua require 'gitsigns'.preview_hunk()<cr>", "Preview Hunk" },
    r = { "<cmd>lua require 'gitsigns'.reset_hunk()<cr>", "Reset Hunk" },
    R = { "<cmd>lua require 'gitsigns'.reset_buffer()<cr>", "Reset Buffer" },
    s = { "<cmd>lua require 'gitsigns'.stage_hunk()<cr>", "Stage Hunk" },
    u = {
      "<cmd>lua require 'gitsigns'.undo_stage_hunk()<cr>",
      "Undo Stage Hunk",
    },
    o = { "<cmd>Telescope git_status<cr>", "Open changed file" },
    b = { "<cmd>Telescope git_branches<cr>", "Checkout branch" },
    c = { "<cmd>Telescope git_commits<cr>", "Checkout commit" },
    d = {
      "<cmd>Gitsigns diffthis HEAD<cr>",
      "Diff",
    },
    -- C = {
    --     "<cmd>Telescope git_bcommits<cr>",
    --     "Checkout commit(for current file)",
    -- },
  },

  l = {
    name = "lsp",
    a = {
      "<cmd>Telescope lsp_code_actions theme=get_dropdown<cr>",
      "Code Action",
    },
    d = {
      "<cmd>Telescope lsp_document_diagnostics<cr>",
      "Document Diagnostics",
    },
    w = {
      "<cmd>Telescope lsp_workspace_diagnostics<cr>",
      "Workspace Diagnostics",
    },
    f = { "<cmd>lua vim.lsp.buf.format()<cr>", "Format" },
    i = { "<cmd>LspInfo<cr>", "Info" },
    L = { "<cmd>LspInstallLog<cr>", "Install Log" },
    I = { "<cmd>LspInstallInfo<cr>", "Installer Info" },
    -- TODO: deprecated! lsp.diagnostics!
    j = {
      -- "<cmd>lua vim.lsp.diagnostic.goto_next({popup_opts = {border = neo.lsp.popup_border}})<cr>",
      "<cmd>lua vim.lsp.diagnostic.goto_next()<CR>",
      "Next Diagnostic",
    },
    -- TODO: deprecated! lsp.diagnostics!
    k = {
      -- "<cmd>lua vim.lsp.diagnostic.goto_prev({popup_opts = {border = neo.lsp.popup_border}})<cr>",
      "<cmd>lua vim.lsp.diagnostic.goto_prev()<cr>",
      "Prev Diagnostic",
    },
    -- p = {
    --     name = "Peek",
    --     d = {
    --         "<cmd>lua require('lsp.peek').Peek('definition')<cr>",
    --         "Definition",
    --     },
    --     t = {
    --         "<cmd>lua require('lsp.peek').Peek('typeDefinition')<cr>",
    --         "Type Definition",
    --     },
    --     i = {
    --         "<cmd>lua require('lsp.peek').Peek('implementation')<cr>",
    --         "Implementation",
    --     },
    -- },
    l = { "<cmd>lua vim.lsp.codelens.run()<cr>", "CodeLens Action" },
    q = { "<cmd>lua vim.lsp.diagnostic.set_loclist()<cr>", "Quickfix" },
    r = { "<cmd>lua vim.lsp.buf.rename()<cr>", "Rename" },
    s = { "<cmd>Telescope lsp_document_symbols<cr>", "Document Symbols" },
    S = {
      "<cmd>Telescope lsp_dynamic_workspace_symbols<cr>",
      "Workspace Symbols",
    },
  },
  s = {
    name = "Search",
    f = {
      "<cmd>Telescope current_buffer_fuzzy_find<cr>",
      "Search within this file",
    },
    d = {
      "<cmd>Telescope find_files hidden=true<cr>",
      "Find File (+hidden)",
    },
    b = { "<cmd>Telescope git_branches<cr>", "Checkout branch" },
    c = { "<cmd>Telescope colorscheme<cr>", "Colorscheme" },
    m = { "<cmd>lua require'telescope.builtin'.marks{}<cr>", "Marks" }, -- todo, use this more!
    e = { "<cmd>lua require'telescope.builtin'.registers{}<cr>", "Registers" }, -- todo, use this more!
    h = { "<cmd>Telescope help_tags<cr>", "Find Help" },
    M = { "<cmd>Telescope man_pages<cr>", "Man Pages" },
    r = { "<cmd>Telescope oldfiles<cr>", "Open Recent File" },
    R = { "<cmd>Telescope registers<cr>", "Registers" },
    t = { "<cmd>Telescope live_grep<cr>", "Text" },
    S = { "<cmd>Telescope grep_string<cr>", "String under Cursor" },
    s = {
      "<cmd>Telescope lsp_references<cr>",
      "String under Cursor References",
    },
    k = { "<cmd>Telescope keymaps<cr>", "Keymaps" },
    C = { "<cmd>Telescope commands<cr>", "Commands" },
    p = {
      "<cmd>lua require('telescope.builtin.internal').colorscheme({enable_preview = true})<cr>",
      "Colorscheme with Preview",
    },
  },
  t = {
    name = "Treesitter",
    i = { ":TSInstallInfo<cr>", "Install Info" },
    c = { ":TSConfigInfo<cr>", "Config Info" },
    u = { ":TSUpdate<cr>", "Update" },
  },
  i = {
    name = "iterate",
    a = { "<cmd>normal <C-a><cr>", "up" },
    x = { "<cmd>normal <C-x><cr>", "down" },
  },
  j = {
    name = "Terminal",
    -- numbered terminals
    a = { "<cmd>1ToggleTerm direction=float<cr>", "Float  1" },
    s = { "<cmd>2ToggleTerm direction=float<cr>", "Float  2" },
    d = { "<cmd>3ToggleTerm direction=float<cr>", "Float  3" },
    f = { "<cmd>4ToggleTerm direction=float<cr>", "Float  4" },
    j = { "<cmd>7ToggleTerm direction=float<cr>", "Float  7" },

    -- bindings below correspond to layers on my keyboard
    ["1"] = {
      "<cmd>1ToggleTerm size=20 direction=horizontal<cr>",
      "Horizontal  1",
    },
    ["2"] = {
      "<cmd>2ToggleTerm size=20 direction=horizontal<cr>",
      "Horizontal  2",
    },
    ["3"] = {
      "<cmd>3ToggleTerm size=20 direction=horizontal<cr>",
      "Horizontal  3",
    },
    ["4"] = {
      "<cmd>4ToggleTerm size=20 direction=horizontal<cr>",
      "Horizontal  4",
    },
    ["7"] = {
      "<cmd>7ToggleTerm size=20 direction=horizontal<cr>",
      "Horizontal  7",
    },
    ["!"] = {
      "<cmd>1ToggleTerm size=80 direction=vertical<cr>",
      "Vertical  1",
    },
    ["@"] = {
      "<cmd>2ToggleTerm size=80 direction=vertical<cr>",
      "Vertical  2",
    },
    ["#"] = {
      "<cmd>3ToggleTerm size=80 direction=vertical<cr>",
      "Vertical  3",
    },
    ["$"] = {
      "<cmd>4ToggleTerm size=80 direction=vertical<cr>",
      "Vertical  4",
    },
    ["&"] = {
      "<cmd>7ToggleTerm size=80 direction=vertical<cr>",
      "Vertical  7",
    },

    -- default terminal
    -- h = {
    --   "<cmd>7ToggleTerm size=15 direction=horizontal<cr>",
    --   "Horizontal  7",
    -- },
    -- v = {
    --   "<cmd>7ToggleTerm size=80 direction=vertical<cr>",
    --   "Vertical  7",
    -- },

    -- toggle terminals
    m = { "<cmd>ToggleTermToggleAll<cr>", "Toggle All  Min/Max" },

    -- extra pre-set terminals
    n = { "<cmd>lua _NODE_TOGGLE()<cr>", "Node" },
    u = { "<cmd>lua _NCDU_TOGGLE()<cr>", "NCDU" },
    t = { "<cmd>lua _HTOP_TOGGLE()<cr>", "Htop" }, -- TODO: add a top one? Should I use btm here?
    p = { "<cmd>lua _PYTHON_TOGGLE()<cr>", "Python" },

    -- create terminal in pane
    [";"] = { "<cmd>terminal<cr>", "create terminal in current pane" },
  },
}

local visual_opts = {
  mode = "v", -- VISUAL mode
  prefix = "<leader>",
  buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
  silent = true, -- use `silent` when creating keymaps
  noremap = true, -- use `noremap` when creating keymaps
  nowait = true, -- use `nowait` when creating keymaps
}
local visual_mappings = {
  ["/"] = { ":CommentToggle<CR>", "Comment" },
  ["f"] = { "<cmd>TextCaseOpenTelescope<cr>", "update text case format" },
  l = {
    name = "lsp",
    f = { "<cmd>lua vim.lsp.buf.range_formatting()<cr>", "Format --- visual" },
  },
}

-- TODO: this was giving invalid mapping errors. Is it worth it?
-- local visual_opts = {
--       ["/"] = { ":CommentToggle<CR>", "Comment" },
-- }
--
-- local visual_mappings = {
--             mode = "v", -- VISUAL mode
--             prefix = "<leader>",
--             buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
--             silent = true, -- use `silent` when creating keymaps
--             noremap = true, -- use `noremap` when creating keymaps
--             nowait = true, -- use `nowait` when creating keymaps
-- }

wk.setup(setup)
wk.register(normal_mappings, normal_opts)
wk.register(visual_mappings, visual_opts)
