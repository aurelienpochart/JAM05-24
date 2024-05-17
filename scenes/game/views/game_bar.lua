local inventory = love.graphics.newImage("assets/images/inventory.png")
local scaleX = 1.8  -- Redimensionner en largeur (2x)
local scaleY = 1.8  -- Redimensionner en hauteur (2x)
local positionX = 542  -- Position en X
local positionY = 720  -- Position en Y

local function onDraw()
    if inventory then
        love.graphics.draw(inventory, positionX, positionY, 0, scaleX, scaleY)
    end
end

return function(scene)
    scene:RegisterView("game_bar", onDraw)
end