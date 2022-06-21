-- TODO: Below might make things clean
-- hs.hotkey.alertDuration = 0
-- hs.hints.showTitleThresh = 0
-- hs.window.animationDuration = 0

-- printer
-- TODO: move this and other utils to its own spoon
local function bubble(str)
  hs.alert.show(str)
end

-- load config
local conf = hs.fs.pathToAbsolute(hs.configdir .. "/config.lua")
if conf then
  require("config")
  print("*** config has been loaded ***")
end

-- reload hammerspoon config
-- hs.hotkey.bind({ "cmd", "shift", "ctrl" }, "r", function()
-- hs.hotkey.bind({ "cmd", "alt", "ctrl" }, "r", function()
hs.hotkey.bind({ "cmd", "ctrl" }, "r", function()
  hs.reload()
end)

local function reloadConfig(files)
  local doReload = false
  for _, file in pairs(files) do
    if file:sub(-4) == ".lua" then
      doReload = true
    end
  end
  if doReload then
    hs.reload()
  end
end

-- reload config when editing files in ~/.hammerspoon/*
hs.pathwatcher.new(os.getenv("HOME") .. "/.hammerspoon/", reloadConfig):start()

-- display when config has been reloaded successfully
hs.alert.show("Config loaded")

-- hs.alert.sho
-- hs.

local function spoonExists(name)
  local spoonPath = hs.configdir .. "/Spoons/" .. name
  print("Checking for spoon " .. name .. " at path: " .. spoonPath)

  if not hs.fs.displayName(spoonPath) then
    print("local spoon does not exist: " .. name)
    return false
  end

  return true
end

local function officialSpoonExists(name)
  local spoonPath = hs.configdir
    .. "/Spoons/OfficialSpoons/Source/"
    .. name
    .. ".spoon"
  print("Checking for official spoon " .. name .. " at path: " .. spoonPath)

  if not hs.fs.displayName(spoonPath) then
    print("official spoon not found: " .. name)
    return false
  end
  return true
end

local function localLinkOfficialSpoon(name)
  hs.alert.show("imma link: " .. name)
  local isLinked = spoonExists(name)
  hs.alert.show("is linked: " .. tostring(isLinked))
  local officialExists = officialSpoonExists(name)
  hs.alert.show("exists   : " .. tostring(officialExists))
end

spoonExists("ModalMgr")
officialSpoonExists("ModalMgr")

localLinkOfficialSpoon("ModalMgr")

-- hs.fs.link(hs.configdir .. '')

-- ModalMgr Spoon must be loaded explicitly, because this repository heavily relies upon it.
-- hs.loadSpoon("ModalMgr")

-- notes below, probably trash

-- below will not show when Do Not Disturb is on
-- hs.notify.new({ title = "Hammerspoon", informativeText = "Hello World" }):send()

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
