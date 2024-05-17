local temp = require('lib.Flipbook')
local FireParticle = {}

local __meta = {
    __index = FireParticle
}

function FireParticle.New()
    local self = setmetatable({}, __meta)
    local particleImage = love.graphics.newImage("assets/particles/TEX_FB_Torch_8x8.png")

    self.quads = temp:constructFlipbook(particleImage, 8, 8)
    self.particleSystem = love.graphics.newParticleSystem(particleImage, 500)
    self:SetDefaultParticleSettings()
    return self
end

function FireParticle:SetDefaultParticleSettings()
    self.particleSystem:setParticleLifetime(1, 3) -- Durée de vie des particules prolongée
    self.particleSystem:setEmissionRate(200)      -- Taux d'émission des particules considérablement augmenté
    self.particleSystem:setSizes(-1, 0.5)           -- Taille initiale et finale des particules augmentée pour simuler des flammes plus grandes
    self.particleSystem:setSizeVariation(1)       -- Variation de la taille des particules
    self.particleSystem:setColors(255, 255, 255, 255, 255, 255, 255, 255, 255, 0, 0, 0)
    self.particleSystem:setSpread(math.pi / 3)    -- Dispersion légèrement augmentée pour élargir la zone de feu
    self.particleSystem:setQuads(self.quads)            -- Utilisation des quads pour afficher les différentes parties de la texture
    self.particleSystem:setOffset(temp:getTileSize()) -- Décalage pour centrer les particules
    self.particleSystem:setSpin(-0.25, 0.25)
    self.particleSystem:setInsertMode('bottom')
    self.particleSystem:setLinearAcceleration(-25, -50, 25, -100) -- Accélération vers le haut pour simuler la convergence
    self.particleSystem:setDirection(-math.pi / 2) -- Direction vers le haut
    self.particleSystem:setSpeed(50, 100) -- Vitesse réduite pour une montée plus lente
end

function FireParticle:explode()
    for i = 1, 100 do
        self.particleSystem:setDirection(math.random() * math.pi * 2)
        self.particleSystem:setLinearAcceleration(-100, -100, 100, 100)
        self.particleSystem:setSpeed(50, 200)
        self.particleSystem:emit(1)
    end
    self.particleSystem:setDirection(-math.pi / 2)
    self:SetDefaultParticleSettings()
end

return FireParticle