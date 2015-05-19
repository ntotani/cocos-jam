
local MainScene = class("MainScene", cc.load("mvc").ViewBase)

function MainScene:onCreate()
    -- add background image
    display.newSprite("MainSceneBg.jpg")
        :move(display.center)
        :addTo(self)

    -- add play button
    local playButton = cc.MenuItemImage:create("PlayButton.png", "PlayButton.png")
        :onClicked(function()
            self:getApp():enterScene("PlayScene")
        end)
    cc.Menu:create(playButton)
        :move(display.cx, display.cy - 200)
        :addTo(self)
    local s = display.newSprite():move(display.center):addTo(self)
    s:setContentSize(100, 100)
    s:setColor(cc.c3b(255, 255, 255))
    local draw = cc.DrawNode:create():addTo(self):move(display.center)
    draw:drawSolidRect(cc.p(0, 0), cc.p(100, 100), cc.c4f(1,1,0,1))
    draw:runAction(cc.MoveBy:create(1, cc.p(100, 0)))
end

return MainScene
