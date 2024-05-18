local ElectricParticle = {}

local __meta = {
    __index = ElectricParticle
}

function ElectricParticle.New(cx, cy, zoneWidth, zoneHeight)
    local self = setmetatable({}, __meta)

    self.particleSystem = love.graphics.newParticleSystem(love.graphics.newImage("assets/particles/electric.png"), 1000)
    self.cx = cx
    self.cy = cy
    self.zoneWidth = zoneWidth
    self.zoneHeight = zoneHeight
    self:SetDefaultSettings()
    return self
end

function ElectricParticle:SetDefaultSettings()
    self.particleSystem:setParticleLifetime(0.5, 1.5)
    self.particleSystem:setEmissionRate(100)
    self.particleSystem:setSizeVariation(1)
    self.particleSystem:setLinearAcceleration(-100, -100, 100, 100)
    self.particleSystem:setColors(_G.Colors.Yellow, _G.Colors.Yellow, _G.Colors.Purple)
    self.particleSystem:setSizes(0.4, 0.4, 0)
    self.particleSystem:setSpeed(100, 200)
    self.particleSystem:setSpread(2 * math.pi)
    self.particleSystem:setTangentialAcceleration(100, 200)
    self.particleSystem:setRadialAcceleration(100, 200)
    self.particleSystem:setRotation(0, 2 * math.pi)
    self.particleSystem:setEmissionArea("uniform", self.zoneWidth, self.zoneHeight)
    self.particleSystem:setQuads(love.graphics.newQuad(0, 0, 32, 32, 32, 32))
    self.particleSystem:setOffset(16, 16)
    self.particleSystem:setPosition(self.cx, self.cy)
    self.particleSystem:setDirection(0)
    self.particleSystem:setRelativeRotation(false)
    self.particleSystem:setEmissionRate(400)
    self.particleSystem:setLinearDamping(0, 0)
end

return ElectricParticle