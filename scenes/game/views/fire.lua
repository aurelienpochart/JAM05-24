_G.Fire = {}
local FireParticle = require("modules/particles/fireParticle")
local ElectricParticle = require("modules/particles/electricParticle")
local fire = FireParticle.New(920, 540)
local explosion = FireParticle.New(920, 540, false)
local electric = ElectricParticle.New(920, 425, 100, 100)
local explode = false;
local timer = love.timer.getTime()
local currentElement = "";
local elementCount = 0;
local electricVisible = false;

local function onReset()
    electric.particleSystem:reset()
    explosion.particleSystem:reset()
    explode = false
    electricVisible = false
    currentElement = ""
    elementCount = 0
    fire = FireParticle.New(920, 540)
end

local function performExplosion()
    explode = true
    explosion:Explode()
    fire.particleSystem:reset()
end

local function onSodium()
    fire = FireParticle.New(920, 540, 0)
    fire:SetColors(Colors.Yellow)
end

local function onSodiumPlusPotassium()
    electric:SetColors(Colors.Yellow, Colors.Purple)
    electricVisible = true
end

local function onSodiumPlusCuivre()
    fire:SetColors(Colors.Yellow, Colors.Purple, Colors.White)
    electricVisible = true
    electric:SetColors(Colors.Yellow)
end

local function onMagnesium()
    fire = FireParticle.New(920, 540, 0)
    fire:SetColors(Colors.White)
end

local function onMagnesiumPlusSoufre()
    if explode == true then
        return
    end
    explosion = FireParticle.New(920, 540, 0)
    performExplosion()
end

local function onMagnesiumPlusSodium()
    fire:SetColors(Colors.White, Colors.Yellow, Colors.White, Colors.Yellow)
end

local function onSouffre()
    fire = FireParticle.New(920, 540, 1)
end

local function onSouffrePlusPotassium()
    fire:SetColors(Colors.Purple, Colors.LightBlue, Colors.Purple,  Colors.LightBlue)
end

local function onSouffrePlusCuivre()
    if explode == true then
        return
    end
    explosion = FireParticle.New(920, 540, 1)
    explosion:SetColors(Colors.Cyan)
    performExplosion()
end

local function onUpdate(dt)
    if electricVisible then
        electric.particleSystem:update(dt)
    end
    fire.particleSystem:update(dt)

    if explode == true then
        explosion.particleSystem:update(dt)
        if love.timer.getTime() - timer > 2 then
            explode = false
            timer = love.timer.getTime()
        end
    else
        timer = love.timer.getTime()
    end
end

function _G.Fire.addElement(name)
    if currentElement == "" then
        currentElement = name
    end
    elementCount = elementCount + 1
    if name == "sodium" and elementCount == 1 then
        onSodium()
    end
    if name == "magnesium" and elementCount == 1 then
        onMagnesium()
    end
    if name == "soufre" and elementCount == 1 then
        onSouffre()
    end
    if elementCount == 2 then
        if (currentElement == "sodium" and name == "potassium") or (currentElement == "potassium" and name == "sodium") then
            onSodiumPlusPotassium()
        end
        if (currentElement == "sodium" and name == "cuivre") or (currentElement == "cuivre" and name == "sodium") then
            onSodiumPlusCuivre()
        end
        if (currentElement == "magnesium" and name == "soufre") or (currentElement == "soufre" and name == "magnesium") then
            onMagnesiumPlusSoufre()
        end
        if (currentElement == "magnesium" and name == "sodium") or (currentElement == "sodium" and name == "magnesium") then
            onMagnesiumPlusSodium()
        end
        if (currentElement == "soufre" and name == "potassium") or (currentElement == "potassium" and name == "soufre") then
            onSouffrePlusPotassium()
        end
        if (currentElement == "soufre" and name == "cuivre") or (currentElement == "cuivre" and name == "soufre") then
            onSouffrePlusCuivre()
        end
    end
end

local function onKeyPressed(key)
    if key == "space" and explode == false then
        explode = true
        explosion.particleSystem:reset()
        explosion:Explode()
        fire.particleSystem:reset()
    end
    if key == "r" then
        onReset()
    end
end

local function onDraw()
    love.graphics.draw(fire.particleSystem, 0, 0)
    love.graphics.draw(electric.particleSystem, 0, 0)
    if explode == true then
        love.graphics.draw(explosion.particleSystem, 0, 0)
    end
end

--- @param scene Scene
return function(scene)
    scene:RegisterView("fire", onDraw, onUpdate, onKeyPressed)
end