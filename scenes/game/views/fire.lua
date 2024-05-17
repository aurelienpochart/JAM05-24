local particleImage = love.graphics.newImage("assets/particles/cloud.png")
local particleSystem = love.graphics.newParticleSystem(particleImage, 1000)

local function initParticleSystem()
    particleSystem:setParticleLifetime(1, 2) -- Durée de vie des particules
    particleSystem:setEmissionRate(1000)      -- Taux d'émission des particules
    particleSystem:setSizeVariation(1)       -- Variation de la taille des particules
    particleSystem:setLinearAcceleration(-10, -10, 10, 10) -- Accélération des particules
    particleSystem:setColors(1, 0.5, 0, 1, 1, 0.1, 0, 0) -- Couleurs des particules (dégradé)
    particleSystem:setSpread(math.pi / 8)    -- Diffusion des particules
    particleSystem:setSpeed(50, 100)        -- Vitesse des particules
    particleSystem:setDirection(-math.pi / 2)-- Direction des particules (vers le haut
end

local function onDraw()
    particleSystem:update(1 / 60)
    love.graphics.draw(particleSystem, 800, 300)
end

--- @param scene Scene
return function(scene)
    initParticleSystem()
    scene:RegisterView("fire", onDraw)
end