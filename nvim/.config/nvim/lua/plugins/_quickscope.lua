local M = {}

-- Not currently using this, using nvim tree instead

-- TODO: add a keybind to open nvim tree in current buffer's path or with it open
function M:configure()
  -- print("configuring neotree")

  -- Unless you are still migrating, remove the deprecated commands from v1.x
  vim.cmd([[ let g:qs_highlight_on_keys = ['f', 'F', 't', 'T'] ]])
  --[[ let g:qs_highlight_on_keys = ['f', 'F', 't', 'T'] ]]
end

M.configure()

return M
