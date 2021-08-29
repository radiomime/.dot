local M = {}
local Log = require "core.log"

function M.config()
  neo.builtin.nvimtree = {
    active = true,
    on_config_done = nil,
    side = "left",
    width = 30,
    show_icons = {
      git = 1,
      folders = 1,
      files = 1,
      folder_arrows = 1,
      tree_width = 30,
    },
    ignore = { ".git", "node_modules", ".cache" },
    auto_open = 1,
    auto_close = 1,
    quit_on_open = 0,
    follow = 1,
    hide_dotfiles = 1,
    git_hl = 1,
    root_folder_modifier = ":t",
    tab_open = 0,
    allow_resize = 1,
    lsp_diagnostics = 1,
    auto_ignore_ft = { "startify", "dashboard" },
    icons = {
      default = "",
      symlink = "",
      git = {
        unstaged = "",
        staged = "S",
        unmerged = "",
        renamed = "➜",
        deleted = "",
        untracked = "U",
        ignored = "◌",
      },
      folder = {
        default = "",
        open = "",
        empty = "",
        empty_open = "",
        symlink = "",
      },
    },
  }
end

function M.setup()
  local status_ok, nvim_tree_config = pcall(require, "nvim-tree.config")
  if not status_ok then
    Log:get_default().error "Failed to load nvim-tree.config"
    return
  end
  local g = vim.g

  for opt, val in pairs(neo.builtin.nvimtree) do
    g["nvim_tree_" .. opt] = val
  end

  -- Implicitly update nvim-tree when project module is active
  if neo.builtin.project.active then
    vim.g.nvim_tree_update_cwd = 1
    vim.g.nvim_tree_respect_buf_cwd = 1
  end

  local tree_cb = nvim_tree_config.nvim_tree_callback

  if not g.nvim_tree_bindings then
    g.nvim_tree_bindings = {
      { key = { "l", "<CR>", "o" }, cb = tree_cb "edit" },
      { key = "h", cb = tree_cb "close_node" },
      { key = "v", cb = tree_cb "vsplit" },
    }
  end

  neo.builtin.which_key.mappings["e"] = { "<cmd>NvimTreeToggle<CR>", "Explorer" }

  local tree_view = require "nvim-tree.view"

  -- Add nvim_tree open callback
  local open = tree_view.open
  tree_view.open = function()
    M.on_open()
    open()
  end

  vim.cmd "au WinClosed * lua require('core.nvimtree').on_close()"

  if neo.builtin.nvimtree.on_config_done then
    neo.builtin.nvimtree.on_config_done(nvim_tree_config)
  end
end

function M.on_open()
  if package.loaded["bufferline.state"] and neo.builtin.nvimtree.side == "left" then
    require("bufferline.state").set_offset(neo.builtin.nvimtree.width + 1, "")
  end
end

function M.on_close()
  local buf = tonumber(vim.fn.expand "<abuf>")
  local ft = vim.api.nvim_buf_get_option(buf, "filetype")
  if ft == "NvimTree" and package.loaded["bufferline.state"] then
    require("bufferline.state").set_offset(0)
  end
end

function M.change_tree_dir(dir)
  local lib_status_ok, lib = pcall(require, "nvim-tree.lib")
  if lib_status_ok then
    lib.change_dir(dir)
  end
end

return M
