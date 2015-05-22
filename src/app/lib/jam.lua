local jam = {}
local Sprite = cc.Sprite

function Sprite:frameIdx(...)
    local params = {...}
    if #params == 0 then return self.frameIdx_ end
    if #params == 1 and type(params[1]) == "number" then
        self.frameIdx_ = params[1] % #self.frames_
        self:setSpriteFrame(self.frames_[self.frameIdx_ + 1])
        return self
    end
    local time = 0.5
    if type(params[1]) == "table" then
        if #params > 1 then time = params[2] end
        params = params[1]
    end
    local frames = {}
    for _, e in ipairs(params) do
        frames[#frames + 1] = self.frames_[(e % #self.frames_) + 1]
    end
    self:playAnimationForever(display.newAnimation(frames, time))
    self.frameIdx_ = params
    return self
end

function jam.sprite(name, size)
    local texture = display.loadImage(name)
    local wid = texture:getPixelsWide()
    local hei = texture:getPixelsHigh()
    local frames = {}
    for i = 0, (wid * hei) / (size * size) - 1 do
        local sf = display.newSpriteFrame(texture, cc.rect((i % (wid / size)) * size, math.floor(i / (wid / size)) * size, size, size))
        cc.SpriteFrameCache:getInstance():addSpriteFrame(sf, name .. i)
        frames[#frames + 1] = sf
    end
    local ret = display.newSprite(frames[1])
    ret.frames_ = frames
    ret.frameIdx_ = 0
    return ret
end

return jam

