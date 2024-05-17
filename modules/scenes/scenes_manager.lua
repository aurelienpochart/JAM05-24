--- @class ScenesManager
--- @field protected scenes Scene[]
--- @field public currentScene Scene
local ScenesManager = {}

local availableScenesPath = {
    "scenes/main_menu" -- Default
}

local __meta = {
    __index = ScenesManager
}

--- @return ScenesManager
function ScenesManager.New()
    local self = setmetatable({}, __meta)
    local scenes = {}

    for _, path in ipairs(availableScenesPath) do
        scenes[#scenes + 1] = require(path)
    end
    
    self.scenes = scenes
    self.currentScene = self.scenes[1]
    return self
end

return ScenesManager.New()