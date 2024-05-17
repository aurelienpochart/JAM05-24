local FireParticle = require("modules/particles/fireParticle")
local fire = FireParticle.New()

local function onUpdate(dt)
    fire.particleSystem:update(dt)
    if love.keyboard.isDown("space") then
        fire:explode()
    end
end

local function onDraw()
    love.graphics.draw(fire.particleSystem, 920, 540)
end

--- @param scene Scene
return function(scene)
    scene:RegisterView("fire", onDraw, onUpdate)
end