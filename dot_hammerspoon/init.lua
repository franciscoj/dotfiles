-- Took these from https://github.com/mattr-/dotfiles/blob/6973593e6dcd882150a3321091f1fe64a7dc3619/home/.hammerspoon/init.lua
-- kudos to @mattr- for sharing them.

local hyper = {"ctrl", "alt", "shift", "cmd"}

hs.window.animationDuration = 0.10
hs.hotkey.bind(hyper, "R", "Reload Configuration", function ()
   hs.reload()
end)

local function resize_win(direction)
  local win = hs.window.focusedWindow()
  if win then
    local f = win:frame()
    local screen = win:screen()
    local localf = screen:absoluteToLocal(f)
    direction(localf, screen)
    local absolutef = screen:localToAbsolute(localf)
    win:setFrame(absolutef)
  else
    hs.alert.show("No focused window!")
  end
end

local function halfright(window, screen)
  local max = screen:fullFrame()
  window.x = max.w/2
  window.y = 0
  window.w = max.w/2
  window.h = max.h
end
hs.hotkey.bind(hyper, "Right", nil, function() resize_win(halfright) end)

local function halfleft(window, screen)
  local max = screen:fullFrame()
  window.x = 0 window.y = 0 window.w = max.w/2 window.h = max.h
end
hs.hotkey.bind(hyper, "Left", nil, function() resize_win(halfleft) end)

local function fullscreen(window, screen)
  local max = screen:fullFrame()
  window.x = 0 window.y = 0 window.w = max.w window.h = max.h
end
hs.hotkey.bind(hyper, "Up", nil, function() resize_win(fullscreen) end)

local function reduced(window, screen)
  local max = screen:fullFrame()

  window.x = max.w/16
  window.y = max.h/16
  window.w = max.w/16 * 14
  window.h = max.h/16 * 14
end
hs.hotkey.bind(hyper, "Down", nil, function() resize_win(reduced) end)

local function mini(window, screen)
  local max = screen:fullFrame()

  window.x = max.w/16 * 10
  window.y = max.h/16 * 2
  window.w = max.w/16 * 5
  window.h = max.h/16 * 10
end
hs.hotkey.bind(hyper, "M", nil, function() resize_win(mini) end)

