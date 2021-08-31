local M = {}

M.config = function()
  neo.builtin.lspinstall = {
    active = true,
    on_config_done = nil,
  }
end

M.setup = function()
  local lspinstall = require "lspinstall"
  lspinstall.setup()

  if neo.builtin.lspinstall.on_config_done then
    neo.builtin.lspinstall.on_config_done(lspinstall)
  end
end

return M
