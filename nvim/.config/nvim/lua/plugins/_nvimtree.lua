local M = {}

-- [NvimTree]
-- [x] unknown option: view.auto_resize |
-- [ ] unknown option: renderer.icons.symlink |
-- [ ] unknown option: renderer.icons.git |
-- [ ] unknown option: renderer.icons.default |
-- [ ] unknown option: renderer.icons.folder |
-- [ ] unknown option: update_to_buf_dir

-- TODO: add a keybind to open nvim tree in current buffer's path or with it open
function M:configure()
  print("configuring nvimtree")

  local status_ok, nvim_tree = pcall(require, "nvim-tree")
  if not status_ok then
    return
  end

  local config_status_ok, nvim_tree_config = pcall(require, "nvim-tree.config")
  if not config_status_ok then
    return
  end

  local tree_cb = nvim_tree_config.nvim_tree_callback

  nvim_tree.setup({
    -- TODO: this plugin has had a lot of breaking changes. Look into what my ideal config should have different than the defaults
    disable_netrw = false,
    hijack_netrw = false, -- 'true' can cause issues with other plugins
    view = {
      width = 45,
      side = "left",
      number = true,
      relativenumber = true,
    },
    -- renderer = {
    --   root_folder_modifier = ":t",
    --   icons = {
    --     glyphs = {
    --       default = "",
    --       symlink = "",
    --       folder = {
    --         arrow_closed = "",
    --         arrow_open = "",
    --         default = "",
    --         open = "",
    --         empty = "",
    --         empty_open = "",
    --         symlink = "",
    --         symlink_open = "",
    --       },
    --       git = {
    --         unstaged = "", -- possible: "✗"
    --         staged = "S", -- possible: "✓"
    --         unmerged = "",
    --         renamed = "➜",
    --         untracked = "U", -- possible: "★"
    --         deleted = "",
    --         ignored = "◌",
    --       },
    --     },
    --   },
    -- },
    -- git = {
    --   ignore = false,
    -- },
    trash = {
      cmd = "rip --graveyard ~/.local/share/graveyard",
      require_confirm = true,
    },
  })
end

M.configure()

require("nvim-tree").setup({})

return M
