local FireParticle = require("modules/particles/fireParticle")
local fire = FireParticle.New()

local function onUpdate(dt)
    fire.particleSystem:update(dt)
end

local function onKeyPressed(key)
    if key == "space" then
        fire:Explode()
    end
end

local function onDraw()
    love.graphics.draw(fire.particleSystem, 920, 540)
end

--- @param scene Scene
return function(scene)
    scene:RegisterView("fire", onDraw, onUpdate, onKeyPressed)
end