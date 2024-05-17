local Particle = {}

local __meta = {
    __index = Particle
}

function Particle.New()
    local self = setmetatable({}, __meta)
    
    return self
end

return Particle