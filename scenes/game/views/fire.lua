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

function _G.Fire.addElement(name)
    if currentElement == "" then
        currentElement = name
    end
    elementCount = elementCount + 1
end

local function onSodium()
    fire = FireParticle.New(920, 540, true)
    fire.particleSystem:setColors(Colors.Yellow)
end



local function onUpdate(dt)
    if electricVisible then
        electric.particleSystem:update(dt)
    end
    fire.particleSystem:update(dt)

    if explode == true then
        explosion.particleSystem:update(dt)
        if love.timer.getTime() - timer > 2 then
            print("Explode")
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
    end
    if key == "b" then
        onSodium()
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