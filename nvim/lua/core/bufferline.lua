local M = {}

M.config = function()
  neo.builtin.bufferline = {
    active = true,
    on_config_done = nil,
    keymap = {
      normal_mode = {
        ["<S-l>"] = ":BufferNext<CR>",
        ["<S-h>"] = ":BufferPrevious<CR>",
      },
    },
  }
end

M.setup = function()
  local keymap = require "keymappings"
  keymap.append_to_defaults(neo.builtin.bufferline.keymap)

  if neo.builtin.bufferline.on_config_done then
    neo.builtin.bufferline.on_config_done()
  end
end

return M
