local LoveGraphics = {}

--- @param mode string
--- @param x number
--- @param y number
--- @param width number
--- @param height number
--- @param rx number
--- @param ry number
--- @param segments number
function LoveGraphics.DrawRect(mode, x, y, width, height, rx, ry, segments)
    love.graphics.rectangle("fill", 20,50, 60,120)
end

return LoveGraphics