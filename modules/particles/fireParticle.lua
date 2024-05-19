local temp = require('lib.Flipbook')
local FireParticle = {}

local __meta = {
    __index = FireParticle
}
_G.Colors = {
    White = {255, 255, 255, 255},
    Black = {0, 0, 0, 255},
    Red = {255, 0, 0, 255},
    Green = {0, 255, 0, 255},
    Blue = {0, 0, 255, 255},
    Yellow = {255, 255, 0, 255},
    Cyan = {0, 255, 255, 255},
    Magenta = {255, 0, 255, 255},
    Orange = {255, 165, 0, 255},
    Purple = {128, 0, 128, 255},
    Pink = {255, 192, 203, 255},
    Brown = {165, 42, 42, 255},
    Grey = {128, 128, 128, 255},
    LightGrey = {211, 211, 211, 255},
    DarkGrey = {169, 169, 169, 255},
    Transparent = {0, 0, 0, 0},
    LightBlue = {119, 181, 181, 254},
    DarkPurple = {102, 0, 102, 255},
}


function FireParticle.New(cx, cy, color)
    local self = setmetatable({}, __meta)
    local particleImage
    if color == 0 then
        particleImage = love.graphics.newImage("assets/particles/TEX_FB_Torch_8x8_WHITE.png")
    elseif color == 1 then
        particleImage = love.graphics.newImage("assets/particles/TEX_FB_Torch_8x8_PALEBLUE.png")
    else
        particleImage = love.graphics.newImage("assets/particles/TEX_FB_Torch_8x8.png")
    end
    self.quads = temp:constructFlipbook(particleImage, 8, 8)
    self.particleSystem = love.graphics.newParticleSystem(particleImage, 500)
    self.cx = cx
    self.cy = cy
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
    self.particleSystem:setPosition(self.cx, self.cy)
end

function FireParticle:Explode()
    local time = love.timer.getTime()

    while love.timer.getTime() - time < 0.01 do
        self.particleSystem:setDirection(math.random() * math.pi * 2)
        self.particleSystem:setLinearAcceleration(-100, -100, 100, 100)
        self.particleSystem:setSpeed(250, 2500)
        self.particleSystem:emit(1)
    end
    self.particleSystem:setEmissionRate(0)
end

function FireParticle:SetColors(...)
    self.particleSystem:setColors(...)
end

return FireParticle