local sodium = love.graphics.newImage("assets/images/sodium.png")
local scaleX = 0.3  -- Redimensionner en largeur (2x)
local scaleY = 0.305  -- Redimensionner en hauteur (2x)
local initial_positionX = 921  -- Position en X
local initial_positionY = 803  -- Position en Y

local function onDraw()
    if sodium then
        love.graphics.draw(sodium, initial_positionX, initial_positionY, 0, scaleX, scaleY)
    end
end

return function(scene)
    scene:RegisterView("sodium", onDraw)
end