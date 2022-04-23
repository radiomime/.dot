-- hs.hotkey.bind({ "cmd", "alt", "ctrl" }, "W", function()
--   hs.alert.show("Hello World!")
-- end)

hs.hotkey.bind({ "cmd", "alt", "ctrl" }, "W", function()
  hs.notify.new({ title = "Hammerspoon", informativeText = "Hello World" }):send()
end)

hs.hotkey.bind({ "cmd", "shift", "ctrl" }, "R", function()
  hs.alert.show("Config loaded, dummy")
  hs.reload()
end)

hs.hotkey.bind({ "cmd", "ctrl" }, "J", function()
  -- local foo =hs.screen:name()
  -- hs.screen:next()

  -- hs.window.switcher.nextWindow()
  local currentspace = hs.spaces.focusedSpace()
local active = hs.spaces.activeSpaces()
  print(active)
  hs.notify.new({
    title = "Hammerspoon",
    -- informativeText =  active,
    informativeText = "current space" .. currentspace,
  }):send()
end)

function reloadConfig(files)
  doReload = false
  for _, file in pairs(files) do
    if file:sub(-4) == ".lua" then
      doReload = true
    end
  end
  if doReload then
    hs.reload()
  end
end
myWatcher = hs.pathwatcher.new(
  os.getenv("HOME") .. "/.hammerspoon/",
  reloadConfig
):start()

hs.alert.show("Config loaded")

-- MOVING A WINDOW TO A NEW SPACE -- START
-- local spaces = require("hs._asm.undocumented.spaces")
-- -- move current window to the space sp
-- function MoveWindowToSpace(sp)
--     local win = hs.window.focusedWindow()      -- current window
--     local uuid = win:screen():spacesUUID()     -- uuid for current screen
--     local spaceID = spaces.layout()[uuid][sp]  -- internal index for sp
--     spaces.moveWindowToSpace(win:id(), spaceID) -- move window to new space
--     spaces.changeToSpace(spaceID)              -- follow window to new space
-- end
-- hs.hotkey.bind(hyper, '1', function() MoveWindowToSpace(1) end)
-- MOVING A WINDOW TO A NEW SPACE -- DONE
