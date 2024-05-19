Elements = require("modules/elements/elements")

local sodium = Elements.New("assets/images/sodium.png")
local sodium2 = Elements.New("assets/images/sodium2.png")
local magnesium = Elements.New("assets/images/magnesium.png")
local magnesium2 = Elements.New("assets/images/magnesium2.png")
local soufre = Elements.New("assets/images/soufre.png")
local soufre2 = Elements.New("assets/images/soufre2.png")
local potassium = Elements.New("assets/images/potassium.png")
local potassium2 = Elements.New("assets/images/potassium2.png")
local cuivre = Elements.New("assets/images/cuivre.png")
local cuivre2 = Elements.New("assets/images/cuivre2.png")
local isTaken = {
    sodium = false,
    magnesium = false,
    soufre = false,
    potassium = false,
    cuivre = false
}

local sodInit = {0.3, 0.305, 921, 887}
local sodInit2 = {0, 0, 921, 887}
local magInit = {0.345, 0.31, 1005, 887}
local magInit2 = {0, 0, 1005, 887}
local souInit = {0.34, 0.345, 838, 887}
local souInit2 = {0, 0, 838, 887}
local potInit = {0.427, 0.438, 754, 887}
local potInit2 = {0, 0, 754, 887}
local cuiInit = {0.44, 0.45, 1089, 887}
local cuiInit2 = {0, 0, 1089, 887}

sodium:setScalePosition(sodInit[1], sodInit[2], sodInit[3], sodInit[4])

magnesium:setScalePosition(magInit[1], magInit[2], magInit[3], magInit[4])
magnesium2:setScalePosition(magInit2[1], magInit2[2], magInit2[3], magInit2[4])
soufre:setScalePosition(souInit[1], souInit[2], souInit[3], souInit[4])
soufre2:setScalePosition(souInit2[1], souInit2[2], souInit2[3], souInit2[4])
potassium:setScalePosition(potInit[1], potInit[2], potInit[3], potInit[4])
potassium2:setScalePosition(potInit2[1], potInit2[2], potInit2[3], potInit2[4])
cuivre:setScalePosition(cuiInit[1], cuiInit[2], cuiInit[3], cuiInit[4])
cuivre2:setScalePosition(cuiInit2[1], cuiInit2[2], cuiInit2[3], cuiInit2[4])

local function drawMaterials()
    if sodium2 then
        love.graphics.draw(sodium2.sprite, sodium2.positionX, sodium2.positionY, 0, sodium2.scaleX, sodium2.scaleY)
    end
    if cuivre2 then
        love.graphics.draw(cuivre2.sprite, cuivre2.positionX, cuivre2.positionY, 0, cuivre2.scaleX, cuivre2.scaleY)
    end
    if potassium2 then
        love.graphics.draw(potassium2.sprite, potassium2.positionX, potassium2.positionY, 0, potassium2.scaleX, potassium2.scaleY)
    end
    if soufre2 then
        love.graphics.draw(soufre2.sprite, soufre2.positionX, soufre2.positionY, 0, soufre2.scaleX, soufre2.scaleY)
    end
    if magnesium2 then
        love.graphics.draw(magnesium2.sprite, magnesium2.positionX, magnesium2.positionY, 0, magnesium2.scaleX, magnesium2.scaleY)
    end
end

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
    drawMaterials()
end

local function onLoaded()
    love.mouse.setVisible(true)
end

local function checkIsOneTaken()
    local count = 0
    for key, value in pairs(isTaken) do
        if value == true then
            count = count + 1
        end
    end
    if count > 0 then
        return true
    end
    return false
end

local function whoIsTaken()
    if isTaken.sodium then
        return "sodium"
    end
    if isTaken.magnesium then
        return "magnesium"
    end
    if isTaken.soufre then
        return "soufre"
    end
    if isTaken.potassium then
        return "potassium"
    end
    if isTaken.cuivre then
        return "cuivre"
    end
end

local function onUpdate(button)
    local x, y = love.mouse.getPosition()
    if love.mouse.isDown(1) then
        if  x > sodium.positionX and x < sodium.positionX + 71 and y > sodium.positionY and y < sodium.positionY + 71 or isTaken.sodium == true then
            if not checkIsOneTaken() or isTaken.sodium then
                sodium:setScalePosition(0, 0, x - 35, y - 35)
                sodium2:setScalePosition(0.35, 0.355, x - 35, y - 35)
                isTaken.sodium = true
            end

        end
            if x > magnesium.positionX and x < magnesium.positionX + 71 and y > magnesium.positionY and y < magnesium.positionY + 71 or isTaken.magnesium == true then
                if not checkIsOneTaken() or isTaken.magnesium then
                    magnesium:setScalePosition(0, 0, x - 35, y - 35)
                    magnesium2:setScalePosition(0.1, 0.1, x - 35, y - 35)
                    isTaken.magnesium = true
                end

            end
            if x > soufre.positionX and x < soufre.positionX + 71 and y > soufre.positionY and y < soufre.positionY + 71 or isTaken.soufre == true then
                if not checkIsOneTaken() or isTaken.soufre then
                    soufre:setScalePosition(0, 0, x - 35, y - 35)
                    soufre2:setScalePosition(0.34, 0.345, x - 35, y - 35)
                    isTaken.soufre = true
                end

            end
            if x > potassium.positionX and x < potassium.positionX + 71 and y > potassium.positionY and y < potassium.positionY + 71 or isTaken.potassium == true then
                if not checkIsOneTaken() or isTaken.potassium then
                    potassium:setScalePosition(0, 0, x - 35, y - 35)
                    potassium2:setScalePosition(0.05, 0.05, x - 35, y - 35)
                    isTaken.potassium = true
                end

            end
        if x > cuivre.positionX and x < cuivre.positionX + 71 and y > cuivre.positionY and y < cuivre.positionY + 71 or isTaken.cuivre == true then
            if not checkIsOneTaken() or isTaken.cuivre then
                cuivre:setScalePosition(0, 0, x - 35, y - 35)
                cuivre2:setScalePosition(0.44, 0.45, x - 50, y - 50)
                isTaken.cuivre = true
            end
        end
    else
        if x - 920 < 71 and y - 540 < 71 then
            if checkIsOneTaken() then
                _G.Fire.addElement(whoIsTaken())
            end
        end
        for key, value in pairs(isTaken) do
            isTaken[key] = false
        end
        sodium:setScalePosition(sodInit[1], sodInit[2], sodInit[3], sodInit[4])
        sodium2:setScalePosition(sodInit2[1], sodInit2[2], sodInit2[3], sodInit2[4])
        magnesium:setScalePosition(magInit[1], magInit[2], magInit[3], magInit[4])
        magnesium2:setScalePosition(magInit2[1], magInit2[2], magInit2[3], magInit2[4])
        soufre:setScalePosition(souInit[1], souInit[2], souInit[3], souInit[4])
        soufre2:setScalePosition(souInit2[1], souInit2[2], souInit2[3], souInit2[4])
        potassium:setScalePosition(potInit[1], potInit[2], potInit[3], potInit[4])
        potassium2:setScalePosition(potInit2[1], potInit2[2], potInit2[3], potInit2[4])
        cuivre:setScalePosition(cuiInit[1], cuiInit[2], cuiInit[3], cuiInit[4])
        cuivre2:setScalePosition(cuiInit2[1], cuiInit2[2], cuiInit2[3], cuiInit2[4])
    end
end

return function(scene)
    scene:RegisterView("elements", onDraw, onUpdate, nil, onLoaded)
end
