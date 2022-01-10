local M = {}
-- local utils = require('utils')

-- TODO: Should this be in a try/catch?
M.load_colorscheme = function()
  -- vim.cmd "set whichwrap+=<,>,[,],h,l"
  -- Colorscheme must get called after plugins are loaded or it will break new installs.

  -- TODO: get some colorschemes! my old ones do not seem to be here
  local _colorscheme = 'tokyonight'
  -- local _colorscheme = 'darkplus'
  -- local _colorscheme = 'spacegray'

  vim.g.colors_name = _colorscheme
  vim.cmd("colorscheme " .. _colorscheme)
end

M.load_colorscheme()

return M
