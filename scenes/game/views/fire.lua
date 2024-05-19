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

local function performExplosion()
    explode = true
    explosion:Explode()
    fire.particleSystem:reset()
end

function _G.Fire.addElement(name)
    if currentElement == "" then
        currentElement = name
    end
    elementCount = elementCount + 1
    print(name)
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

local function onKeyPressed(key)
    if key == "space" and explode == false then
        explode = true
        explosion.particleSystem:reset()
        explosion:Explode()
        fire.particleSystem:reset()
    end
    if key == "b" then
        onSodium()
        onSodiumPlusCuivre()
        --onMagnesium()
        --onMagnesiumPlusSodium()
        --onMagnesiumPlusSoufre()
        --onSouffre()
        --onSouffrePlusPotassium()
        --onSouffrePlusCuivre()
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