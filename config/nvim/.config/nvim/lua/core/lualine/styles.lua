local M = {}
local components = require "core.lualine.components"

local styles = {
  neostyle = nil,
  default = nil,
  none = nil,
}

styles.none = {
  style = "none",
  options = {
    icons_enabled = true,
    component_separators = "",
    section_separators = "",
    disabled_filetypes = {},
  },
  sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {},
    lualine_x = {},
    lualine_y = {},
    lualine_z = {},
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {},
    lualine_x = {},
    lualine_y = {},
    lualine_z = {},
  },
  tabline = {},
  extensions = {},
}

styles.default = {
  style = "default",
  options = {
    icons_enabled = true,
    component_separators = { "", "" },
    section_separators = { "", "" },
    disabled_filetypes = {},
  },
  sections = {
    lualine_a = { "mode" },
    lualine_b = { "branch" },
    lualine_c = { "filename" },
    lualine_x = { "encoding", "fileformat", "filetype" },
    lualine_y = { "progress" },
    lualine_z = { "location" },
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = { "filename" },
    lualine_x = { "location" },
    lualine_y = {},
    lualine_z = {},
  },
  tabline = {},
  extensions = {},
}

styles.neostyle = {
  style = "neostyle",
  options = {
    icons_enabled = true,
    component_separators = "",
    section_separators = "",
    disabled_filetypes = { "dashboard" },
  },
  sections = {
    lualine_a = {
      components.mode,
    },
    lualine_b = {
      components.branch,
      components.filename,
    },
    lualine_c = {
      components.diff,
      components.python_env,
    },
    lualine_x = {
      components.diagnostics,
      components.treesitter,
      components.lsp,
      components.filetype,
    },
    lualine_y = {},
    lualine_z = {
      components.scrollbar,
    },
  },
  inactive_sections = {
    lualine_a = {
      "filename",
    },
    lualine_b = {},
    lualine_c = {},
    lualine_x = {},
    lualine_y = {},
    lualine_z = {},
  },
  tabline = {},
  extensions = { "nvim-tree" },
}

function M.get_style(style)
  local style_keys = vim.tbl_keys(styles)
  if not vim.tbl_contains(style_keys, style) then
    local Log = require "core.log"
    local logger = Log:get_default()
    logger.error(
      "Invalid lualine style",
      string.format('"%s"', style),
      "options are: ",
      string.format('"%s"', table.concat(style_keys, '", "'))
    )
    logger.info '"neostyle" style is applied.'
    style = "neostyle"
  end

  return vim.deepcopy(styles[style])
end

function M.update()
  local style = M.get_style(neo.builtin.lualine.style)
  if neo.builtin.lualine.options.theme == nil then
    neo.builtin.lualine.options.theme = neo.colorscheme
  end

  neo.builtin.lualine = vim.tbl_deep_extend("keep", neo.builtin.lualine, style)
end

return M
