local utils = require("utils")
local M = {}

function M:configure()
  -- print("configuring alpha")
  local status_ok, alpha = pcall(require, "alpha")
  if not status_ok then
    return
  end

  local dashboard = require("alpha.themes.dashboard")
  -- Good source for dumb headers: https://patorjk.com/software/taag/#p=display&f=Ogre&t=Neovim
  dashboard.section.header.val = {
    -- Larry 3D
    [[                               __                ]],
    [[  ___     ___    ___   __  __ /\_\    ___ ___    ]],
    [[ / _ `\  / __`\ / __`\/\ \/\ \\/\ \  / __` __`\  ]],
    [[/\ \/\ \/\  __//\ \_\ \ \ \_/ |\ \ \/\ \/\ \/\ \ ]],
    [[\ \_\ \_\ \____\ \____/\ \___/  \ \_\ \_\ \_\ \_\]],
    [[ \/_/\/_/\/____/\/___/  \/__/    \/_/\/_/\/_/\/_/]],
  }
  -- TODO: add sessions!
  dashboard.section.buttons.val = {
    dashboard.button("f", "  Find file", ":Telescope find_files <CR>"),
    dashboard.button(
      "d",
      "  Find file (include hidden)",
      ":Telescope find_files hidden=true<CR>"
    ),
    dashboard.button("n", "  New file", ":ene <BAR> startinsert <CR>"),
    -- dashboard.button("p", "  Find project", ":Telescope projects <CR>"),
    dashboard.button("t", "  Find text", ":Telescope live_grep <CR>"),
    dashboard.button(
      "r",
      "  Recently used files",
      ":Telescope oldfiles <CR>"
    ),
    dashboard.button(
      "c",
      "  Configuration",
      ":e ~/.config/nvim/init.lua <CR>"
    ),
    dashboard.button("q", "  Quit Neovim", ":qa<CR>"),
  }

  local function footer()
    -- NOTE: requires the fortune-mod package to work
    -- local handle = io.popen("fortune")
    -- local fortune = handle:read("*a")
    -- handle:close()
    -- -- TODO: make this smarter as a fun little exercise?
    -- -- print(vim.inspect(utils.get_os_info().sysname))
    -- if type(fortune) ~= "string" then
    --   return "install fortune: brew install fortune || sudo apt-get install -y fortune"
    -- end
    -- if string.len(fortune) == 0 then
    --   return "install fortune: brew install fortune || sudo apt-get install -y fortune"
    -- end
    -- return fortune
    -- return "a place is only a place"
    -- return "iterate."
    -- return "small changes --> big results.\ntake a breathe. dont get lost."
    -- return "Any fool can write code that a computer can understand\nGood programmers write code that humans can understand"
    -- return "simple is better"
  end

  -- dashboard.section.footer.val = footer()

  dashboard.section.footer.opts.hl = "Type"
  dashboard.section.header.opts.hl = "Include"
  dashboard.section.buttons.opts.hl = "Keyword"

  dashboard.opts.opts.noautocmd = true
  -- vim.cmd([[autocmd User AlphaReady echo 'ready']])
  alpha.setup(dashboard.opts)
end

M.configure({})

return M
