local Elements = {}

local __meta = {
    __index = Elements
}

function Elements.New(pathImage)
    local self = setmetatable({}, __meta)
    self.sprite = love.graphics.newImage(pathImage)
    self.positionX = 0
    self.positionY = 0
    self.scaleX = 1
    self.scaleY = 1
    return self
end

function Elements:setScalePosition(sx, sy, px, py)
    self.scaleX = sx
    self.scaleY = sy
    self.positionX = px
    self.positionY = py
end

function Elements:Draw(x, y, scaleX, scaleY)
    love.graphics.draw(self.sprite, x, y, 0, scaleX, scaleY)
end


return Elements