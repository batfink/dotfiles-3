config = os.getenv("HOME") .. "/.hammerspoon/init.lua"

hs.window.animationDuration = 0

hs.layout.centered = {x=0.1, y=0, w=0.8, h=0.9}

hyper = {"ctrl", "alt", "cmd"}

grid = {
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

hs.pathwatcher.new(config, hs.reload):start()
