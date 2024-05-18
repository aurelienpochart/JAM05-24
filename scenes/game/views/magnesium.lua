local magnesium = love.graphics.newImage("assets/images/magnesium.png")
local scaleX = 0.345  -- Redimensionner en largeur (2x)
local scaleY = 0.31  -- Redimensionner en hauteur (2x)
local initial_positionX = 1005  -- Position en X
local initial_positionY = 803  -- Position en Y

local function onDraw()
    if magnesium then
        love.graphics.draw(magnesium, initial_positionX, initial_positionY, 0, scaleX, scaleY)
    end
end

return function(scene)
    scene:RegisterView("magnesium", onDraw)
end