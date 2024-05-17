--- @class ScenesManager
--- @field protected scenes Scene[]
--- @field public currentScene Scene
local ScenesManager = {}

local availableScenes = {
    "main_menu", -- Default
    "game"
}

local __meta = {
    __index = ScenesManager
}

--- @return ScenesManager
function ScenesManager.New()
    local self = setmetatable({}, __meta)
    local scenes = {}

    for _, sceneName in ipairs(availableScenes) do
        scenes[#scenes + 1] = require(("scenes/%s/scene"):format(sceneName))
    end
    
    self.scenes = scenes
    self.currentScene = self.scenes[1]
    if self.currentScene.onLoaded then
        self.currentScene.onLoaded()
    end
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
    if self.currentScene.onUnloaded then
        self.currentScene.onUnloaded()
    end
    self.currentScene = scene
    if self.currentScene.onLoaded then
        self.currentScene.onLoaded()
    end
end

return ScenesManager.New()