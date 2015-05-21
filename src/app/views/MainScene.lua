local jam = require("app.jam")

local MainScene = class("MainScene", cc.load("mvc").ViewBase)

function MainScene:onCreate()
    display.newLayer():addTo(self):onTouch(function(e)
        print(e.x, e.y)
    end)
end

return MainScene

