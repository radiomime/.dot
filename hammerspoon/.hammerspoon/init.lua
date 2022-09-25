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
-- local config
-- local conf = hs.fs.pathToAbsolute(hs.configdir .. "/config.lua")
-- if conf then
--   config = require("config")
--   print("*** config has been loaded ***")
-- end

-- reload hammerspoon config
hs.hotkey.bind({ "cmd", "ctrl" }, "h", function()
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

-- load config
local config_ok, config = pcall(require, "config")
if not config_ok then
  bubble("error finding necessary config.lua file")
  return
end

local function getOfficialSpoonPath(name)
  local spoonPath = hs.configdir
    .. "/Spoons/OfficialSpoons/Source/"
    .. name
    .. ".spoon"

  print("Checking for official spoon " .. name .. " at path: " .. spoonPath)

  if not hs.fs.displayName(spoonPath) then
    print("official spoon does not exist: " .. name)
    -- hs.alert.show("not seeing the official spoon")
    return nil
  end

  print("official spoon exists: " .. name)
  return spoonPath
end

local function getSpoonPath(name)
  local spoonPath = hs.configdir .. "/Spoons/" .. name .. ".spoon"
  -- hs.alert.show("spoon path: " .. spoonPath)
  return spoonPath
end

local function localSpoonExists(name)
  local spoonPath = getSpoonPath(name)
  print("Checking for spoon " .. name .. " at path: " .. spoonPath)

  if not hs.fs.displayName(spoonPath) then
    print("local spoon does not exist: " .. name)
    return false
  end

  return true
end

-- local function officialSpoonExists(name)
--   local spoonPath = hs.configdir
--     .. "/Spoons/OfficialSpoons/Source/"
--     .. name
--     .. ".spoon"
--   print("Checking for official spoon " .. name .. " at path: " .. spoonPath)
--
--   if not hs.fs.displayName(spoonPath) then
--     print("official spoon does not exist: " .. name)
--     return false
--   end
--
--   print("official spoon exists: " .. name)
--   return true
-- end

local function localLinkOfficialSpoon(name)
  local isLinked = localSpoonExists(name)
  local officialPath = getOfficialSpoonPath(name)
  -- hs.alert.show("thinking about locally linking: " .. name)
  -- hs.alert.show(name .. " is linked: " .. tostring(isLinked))
  -- hs.alert.show(name .. " exists: " .. tostring(officialPath))

  if not isLinked and officialPath then
    -- log
    hs.alert.show("locally linking " .. name)
    -- hs.alert.show(
    --   "i would like to locally link, because I think I can and should"
    -- )
    -- hs.alert.show("I need to link the official spoon: " .. name)
    -- hs.alert.show("link path\n" .. getSpoonPath(name))
    -- hs.alert.show("dir path\n" .. officialPath)

    hs.fs.link(officialPath, getSpoonPath(name), true)
  else
    -- hs.alert.show("i do not need to locally link the spoon")
    print("I do not need to link the official spoon: " .. name)
  end
end

-- https://www.hammerspoon.org/Spoons/
-- https://github.com/Hammerspoon/hammerspoon/blob/master/SPOONS.md#how-do-i-create-a-spoon
-- https://evantravers.com/articles/2020/06/08/hammerspoon-a-better-better-hyper-key/
-- http://www.hammerspoon.org/Spoons/ReloadConfiguration.html
-- https://www.hammerspoon.org/go/#fancyreload
-- https://github.com/ashfinal/awesome-hammerspoon
-- https://github.com/jasonrudolph/keyboard/blob/main/hammerspoon/init.lua
-- https://www.hammerspoon.org/docs/hs.fs.html#link
-- https://github.com/koekeishiya/yabai

-- spoonExists("ModalMgr")
-- getOfficialSpoonPath("ModalMgr")
-- print("*** does exist ***: " .. getOfficialSpoonPath("ModalMgr"))
-- print(
--   "*** does not exist ***: "
--     .. tostring(true == getOfficialSpoonPath("Doesn't exist"))
-- )
-- officialSpoonExists("ModalMgr")

-- ModalMgr Spoon must be loaded explicitly, because this repository heavily relies upon it.
localLinkOfficialSpoon("ModalMgr")
hs.loadSpoon("ModalMgr")

-- load spoons defined in config
for _, spoon in pairs(config.hspoon_list) do
  -- hs.alert.show("key " .. _)
  -- hs.alert.show("value " .. spoon)
  localLinkOfficialSpoon(spoon)
  hs.loadSpoon(spoon)
end

----------------------------------------------------------------------------------------------------
-- Register AClock
if spoon.AClock then
  hs.alert.show("there is a aclock spoon")
  hsaclock_keys = hsaclock_keys or { "alt", "T" }
  if string.len(hsaclock_keys[2]) > 0 then
    hs.alert.show("we have some good hsa clock keys length")
    spoon.ModalMgr.supervisor:bind(
      hsaclock_keys[1],
      hsaclock_keys[2],
      "Toggle Floating Clock",
      function()
        spoon.AClock:toggleShow()
      end
    )
  end
end

-- hs.alert.show(config.hspoon_list)

-- hs.alert.show(c.hspoon_list)

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
