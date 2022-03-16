local M = {}

-- Colorscheme must get called after plugins are loaded or it will break new installs.
M._load_colorscheme = function()
  -- TODO: get some colorschemes! my old ones do not seem to be here
  local _colorscheme = "tokyonight"
  -- local _colorscheme = "darkplus"
  -- local _colorscheme = 'spacegray'
  -- local _colorscheme = "neon"
  -- local _colorscheme = 'tokyodark'
  -- local _colorscheme = "material"
  -- local _colorscheme = "moonlight"

  local status_ok, result = pcall(M.load_colorscheme, _colorscheme)
  if not status_ok then
    print("error: cannot load colorscheme: " .. _colorscheme)
    M.load_colorscheme("default")
    return
  end
end

M.load_colorscheme = function(colorscheme_name)
  print("set colorscheme:" .. colorscheme_name)
  vim.g.colors_name = colorscheme_name

  if colorscheme_name == "tokyonight" then
    vim.g.tokyonight_style = "night"
    -- vim.g.tokyonight_style = "day"
    -- vim.g.tokyonight_style = "storm"
  elseif colorscheme_name == "neon" then
    vim.g.neon_style = "doom"
  elseif colorscheme_name == "material" then
    vim.g.material_style = "deep ocean"
    -- vim.g.material_style = "darker"
  end

  vim.cmd("colorscheme " .. colorscheme_name)
end

M._load_colorscheme()

return M
