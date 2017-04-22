local hyper = {"ctrl", "alt", "cmd"}

-- grid
hs.window.animationDuration = 0
hs.layout.centered = {x=0.1, y=0, w=0.8, h=0.9}

local grid = {
  {key="up", unit=hs.layout.maximized},
  {key="right", unit=hs.layout.right50},
  {key="down", unit=hs.layout.centered},
  {key="left", unit=hs.layout.left50}
}

hs.fnutils.each(grid, function(entry)
  hs.hotkey.bind(hyper, entry.key, function()
    hs.window.focusedWindow():moveToUnit(entry.unit)
  end)
end)

-- caffeine
local caffeine = hs.menubar.new()
local icons = os.getenv("HOME") .. "/.dotfiles/icons/caffeine"

function setCaffeineDisplay(state)
    if state then
        caffeine:setIcon(icons .. "/active@2x.png")
    else
        caffeine:setIcon(icons .. "/inactive@2x.png")
    end
end

function caffeineClicked()
    setCaffeineDisplay(hs.caffeinate.toggle("displayIdle"))
end

if caffeine then
    caffeine:setClickCallback(caffeineClicked)
    setCaffeineDisplay(hs.caffeinate.get("displayIdle"))
end

-- wifi watcher
function setNpmrc()
  if hs.wifi.currentNetwork() == "HS-Corp" then
    print("[npmrc] Using hubspot")
    hs.execute("npmrc hubspot", true)
  else
    print("[npmrc] Using default")
    hs.execute("npmrc default", true)
  end
end

hs.wifi.watcher.new(setNpmrc):start()

-- auto-reload
local config = os.getenv("HOME") .. "/.hammerspoon/init.lua"
hs.pathwatcher.new(config, hs.reload):start()
