local jam = require("app.lib.jam")
local us = require("app.lib.moses")

local MainScene = class("MainScene", cc.load("mvc").ViewBase)

function MainScene:onCreate()
    display.newLayer():addTo(self):onTouch(function(e)
        print(e.x, e.y)
    end)
end

return MainScene

