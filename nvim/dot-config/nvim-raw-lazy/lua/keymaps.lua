print("setting keymappings...")

--  NOTE: Must happen before plugins are loaded (otherwise wrong leader will be used)
vim.g.mapleader = " "
vim.g.maplocalleader = ","

-- Set to true if you have a Nerd Font installed and selected in the terminal
-- vim.g.have_nerd_font = false

-- [[ Basic Keymaps ]]
--  See `:help vim.keymap.set()`

-- Diagnostic keymaps
vim.keymap.set(
  "n",
  "[d",
  vim.diagnostic.goto_prev,
  { desc = "Go to previous [D]iagnostic message" }
)
vim.keymap.set(
  "n",
  "]d",
  vim.diagnostic.goto_next,
  { desc = "Go to next [D]iagnostic message" }
)
vim.keymap.set(
  "n",
  "<leader>e",
  vim.diagnostic.open_float,
  { desc = "Show diagnostic [E]rror messages" }
)
vim.keymap.set(
  "n",
  "<leader>q",
  vim.diagnostic.setloclist,
  { desc = "Open diagnostic [Q]uickfix list" }
)

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
--
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
vim.keymap.set(
  "t",
  "<Esc><Esc>",
  "<C-\\><C-n>",
  { desc = "Exit terminal mode" }
)

-- Keybinds to make split navigation easier.
--  Use CTRL+<hjkl> to switch between windows
--
--  See `:help wincmd` for a list of all window commands
vim.keymap.set(
  "n",
  "<C-h>",
  "<C-w><C-h>",
  { desc = "Move focus to the left window" }
)
vim.keymap.set(
  "n",
  "<C-l>",
  "<C-w><C-l>",
  { desc = "Move focus to the right window" }
)
vim.keymap.set(
  "n",
  "<C-j>",
  "<C-w><C-j>",
  { desc = "Move focus to the lower window" }
)
vim.keymap.set(
  "n",
  "<C-k>",
  "<C-w><C-k>",
  { desc = "Move focus to the upper window" }
)

-- old keymaps...

------------------------
----- insert mode ------
------------------------
-- insert -> normal mode heaven
vim.keymap.set("i", "jk", "<esc>", { silent = true })
vim.keymap.set("i", "kj", "<ESC>", { silent = true })

-- Move current line / block with ctrl-j/k ala vscode.
-- vim.keymap.set("i", "<C-j>", "<Esc>:m .+1<CR>==gi", { silent = true })
-- vim.keymap.set("i", "<C-k>", "<Esc>:m .-2<CR>==gi", { silent = true })

-- navigate tab completion with <c-j> and <c-k>
-- runs conditionally
-- vim.keymap.set(
--   "i",
--   "<C-j>",
--   'pumvisible() ? "\\<C-n>" : "\\<C-j>"',
--   { expr = true, noremap = true }
-- )
--
-- vim.keymap.set(
--   "i",
--   "<C-k>",
--   'pumvisible() ? "\\<C-p>" : "\\<C-k>"',
--   { expr = true, noremap = true }
-- )

local M = {}

function M.set_keymappings()
  local opts = { noremap = true, silent = true }
  local term_opts = { silent = true }
  -- Shorten function name
  local keymap = vim.api.nvim_set_keymap

  -- print("setting up keymappings")

  --Remap space as leader key
  keymap("", "<Space>", "<Nop>", opts)
  -- --  NOTE: Must happen before plugins are loaded (otherwise wrong leader will be used)
  -- vim.g.mapleader = " "
  -- vim.g.maplocalleader = ","

  ------------------------
  ----- insert mode ------
  ------------------------
  -- insert -> normal mode heaven
  -- keymap("i", "jk", "<ESC>", opts)
  -- keymap("i", "kj", "<ESC>", opts)

  -- -- Move current line / block with ctrl-j/k ala vscode.
  -- keymap("i", "<C-j>", "<Esc>:m .+1<CR>==gi", opts)
  -- keymap("i", "<C-k>", "<Esc>:m .-2<CR>==gi", opts)

  -- navigate tab completion with <c-j> and <c-k>
  -- runs conditionally
  --  keymap(
  --    "i",
  --    "<C-j>",
  --    'pumvisible() ? "\\<C-n>" : "\\<C-j>"',
  --    { expr = true, noremap = true }
  --  )
  --
  --  keymap(
  --    "i",
  --    "<C-k>",
  --    'pumvisible() ? "\\<C-p>" : "\\<C-k>"',
  --    { expr = true, noremap = true }
  --  )

  ------------------------
  ----- normal mode ------
  ------------------------
  -- Better window movement
  keymap("n", "<C-h>", "<C-w>h", opts)
  keymap("n", "<C-j>", "<C-w>j", opts)
  keymap("n", "<C-k>", "<C-w>k", opts)
  keymap("n", "<C-l>", "<C-w>l", opts)

  -- ; to : for ease of use, but keep ; as an option
  keymap("n", ";", ":", opts)
  keymap("n", ":", ";", opts)

  -- Resize with arrows
  keymap("n", "<C-Up>", ":resize -2<CR>", opts)
  keymap("n", "<C-Down>", ":resize +2<CR>", opts)
  keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
  keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

  -- Switch tab buffer with Shift + (h/l)
  keymap("n", "<S-l>", ":BufferNext<CR>", opts)
  keymap("n", "<S-h>", ":BufferPrevious<CR>", opts)
  -- keymap("n", "<S-l>", ":bnext<CR>", opts)
  -- keymap("n", "<S-h>", ":bprevious<CR>", opts)

  -- Move current line / block with Alt-j/k a la vscode.
  -- keymap('n', "<A-j>", ":m .+1<CR>==", opts)
  -- keymap('n', "<A-k>", ":m .-2<CR>==", opts)

  -- QuickFix
  -- TODO: incorporate quickfix? Play with these
  -- keymap('n', "]q", ":cnext<CR>", opts)
  -- keymap('n', "[q", ":cprev<CR>", opts)
  -- keymap('n', "<C-q>", ":call QuickFixToggle()<CR>", opts)

  -- ctrl-s to save, ctrl-q to quit
  keymap("n", "<C-s>", ":w<cr>", opts)
  keymap("n", "<C-q>", ":q<cr>", opts)

  ------------------------
  ------ term mode -------
  ------------------------
  -- JK to insert normal mode
  keymap("t", "JK", "<C-\\><C-n>", opts)
  -- TODO: debug below: should work, but only works when mapped to JK
  -- keymap("t", "KJ", "<C-\\><C-n>:ToggleTerm<cr>", opts)

  -- Terminal window navigation
  keymap("t", "<C-h>", "<C-\\><C-N><C-w>h", opts)
  keymap("t", "<C-j>", "<C-\\><C-N><C-w>j", opts)
  keymap("t", "<C-k>", "<C-\\><C-N><C-w>k", opts)
  keymap("t", "<C-l>", "<C-\\><C-N><C-w>l", opts)

  ------------------------
  ----- visual mode ------
  ------------------------
  -- Better indenting
  keymap("v", "<", "<gv", opts)
  keymap("v", ">", ">gv", opts)

  -- Move text up and down
  -- keymap("v", "<A-j>", ":m .+1<CR>==", opts)
  -- keymap("v", "<A-k>", ":m .-2<CR>==", opts)
  -- keymap("v", "p", '"_dP', opts)

  ------------------------
  ----- vblock mode ------
  ------------------------
  -- Move selected line / block of text in visual mode
  keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
  keymap("x", "K", ":move '<-2<CR>gv-gv", opts)

  -- Move current line / block with Alt-j/k ala vscode.
  keymap("x", "<A-j>", ":move '>+1<CR>gv-gv", opts)
  keymap("x", "<A-k>", ":move '<-2<CR>gv-gv", opts)

  ------------------------
  ----- cmmand mode ------
  ------------------------
  -- navigate tab completion with <c-j> and <c-k>
  -- runs conditionally
  keymap(
    "c",
    "<C-j>",
    'pumvisible() ? "\\<C-n>" : "\\<C-j>"',
    { expr = true, noremap = true }
  )
  keymap(
    "c",
    "<C-k>",
    'pumvisible() ? "\\<C-p>" : "\\<C-k>"',
    { expr = true, noremap = true }
  )

  ---------------------
  ----- mac only ------
  ---------------------
  if vim.fn.has("mac") == 1 then
    keymap("n", "<A-Up>", ":resize -2<CR>", opts)
    keymap("n", "<A-Down>", ":resize +2<CR>", opts)
    keymap("n", "<A-Left>", ":vertical resize -2<CR>", opts)
    keymap("n", "<A-Right>", ":vertical resize +2<CR>", opts)
  end
end

M.set_keymappings()

return M
