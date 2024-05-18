Elements = require("modules/elements/elements")

local sodium = Elements.New("assets/images/sodium.png")
local magnesium = Elements.New("assets/images/magnesium.png")
local soufre = Elements.New("assets/images/soufre.png")
local potassium = Elements.New("assets/images/potassium.png")
local cuivre = Elements.New("assets/images/cuivre.png")

local sodInit = {0.3, 0.305, 921, 887}
local magInit = {0.345, 0.31, 1005, 887}
local souInit = {0.34, 0.345, 838, 887}
local potInit = {0.427, 0.438, 754, 887}
local cuiInit = {0.44, 0.45, 1089, 887}

sodium:setScalePosition(sodInit[1], sodInit[2], sodInit[3], sodInit[4])
magnesium:setScalePosition(magInit[1], magInit[2], magInit[3], magInit[4])
soufre:setScalePosition(souInit[1], souInit[2], souInit[3], souInit[4])
potassium:setScalePosition(potInit[1], potInit[2], potInit[3], potInit[4])
cuivre:setScalePosition(cuiInit[1], cuiInit[2], cuiInit[3], cuiInit[4])

local function onDraw()
    if sodium then
        love.graphics.draw(sodium.sprite, sodium.positionX, sodium.positionY, 0, sodium.scaleX, sodium.scaleY)
    end
    if magnesium then
        love.graphics.draw(magnesium.sprite, magnesium.positionX, magnesium.positionY, 0, magnesium.scaleX, magnesium.scaleY)
    end
    if soufre then
        love.graphics.draw(soufre.sprite, soufre.positionX, soufre.positionY, 0, soufre.scaleX, soufre.scaleY)
    end
    if potassium then
        love.graphics.draw(potassium.sprite, potassium.positionX, potassium.positionY, 0, potassium.scaleX, potassium.scaleY)
    end
    if cuivre then
        love.graphics.draw(cuivre.sprite, cuivre.positionX, cuivre.positionY, 0, cuivre.scaleX, cuivre.scaleY)
    end
end

local function onLoaded()
    cursor = love.mouse.setVisible(true)
end

local function onUpdate(button)
    if love.mouse.isDown(1) then
        print("Mouse")
    end
end

return function(scene)
    scene:RegisterView("elements", onDraw, onUpdate, nil, onLoaded)
end
