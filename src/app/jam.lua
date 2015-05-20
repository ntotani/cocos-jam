local jam = {}
local Sprite = cc.Sprite

function Sprite:frameIdx(idx)
    if not idx then return self.frameIdx_ end
    self.frameIdx_ = idx % #self.frames_
    self:setSpriteFrame(self.frames_[self.frameIdx_ + 1])
    return idx
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

