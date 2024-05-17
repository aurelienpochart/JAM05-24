--- @class ScenesManager
--- @field protected scenes Scene[]
--- @field public currentScene Scene
local ScenesManager = {}

local availableScenesPath = {
    "scenes/main_menu", -- Default
    "scenes/game"
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

--- @param name string
--- @return Scene
function ScenesManager:GetScene(name)
    for _, scene in ipairs(self.scenes) do
        if scene.name == name then
            return scene
        end
    end
end

--- @param name string
function ScenesManager:SwitchTo(name)
    local scene = self:GetScene(name)

    if not scene then
        return
    end
    self.currentScene = scene
end

return ScenesManager.New()