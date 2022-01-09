local M = {}
-- local utils = require('utils')

M.load_colors = function()
    -- vim.cmd "set whichwrap+=<,>,[,],h,l"
    -- Colorscheme must get called after plugins are loaded or it will break new installs.
  --
  -- TODO: get some colorschemes! my old ones do not seem to be here
  local _colorscheme = 'tokyonight'
  -- local _colorscheme = 'darkplus'
  -- local _colorscheme = 'spacegray'
  vim.g.colors_name = _colorscheme
  vim.cmd("colorscheme " .. _colorscheme)
end

return M
