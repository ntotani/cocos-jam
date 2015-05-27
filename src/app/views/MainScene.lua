local jam = require("app.lib.jam")
local us = require("app.lib.moses")

local MainScene = class("MainScene", cc.load("mvc").ViewBase)

function MainScene:onCreate()
    display.newSprite("bg/03.jpg"):move(display.center):addTo(self)
    local gd = display.newLayer():addTo(self)
    us(us.range(10)):each(function()
        jam.sprite("chara/robo.png", 32):move(jam.rand()):addTo(gd):frameIdx(0, 1, 2)
    end)
    local tm  = jam.countUp():align(cc.p(0, 1), 10, 470):addTo(self)
    display.newLayer():addTo(self):onTouch(function(e)
        local b = jam.sprite("icon/bomb.png", 32):move(e):addTo(self)
        b:moveBy({time = 1, x = 0, y = -480, removeSelf = true})
        b:onUpdate(function()
            local hit = us(gd:getChildren()):detect(function(g)
                return cc.rectIntersectsRect(b:getBoundingBox(), g:getBoundingBox())
            end):value()
            if hit then
                b:removeSelf()
                gd:getChildren()[hit]:removeSelf()
                audio.playSound("se/ok.mp3")
                if #gd:getChildren() <= 0 then
                    jam.clear()
                end
            end
        end)
    end)
end

return MainScene

