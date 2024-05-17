local ScenesManager = require("modules/scenes/scenes_manager")
local Game = require("modules/game/game")

local Controllers = { game = Game, scenesManager = ScenesManager } 

--[[ Love2D Overrides ]]
function love.load()
    Game:SetTitle("On Fire !")
    Game:SetWindowMode(1920, 1080, {})
    ScenesManager:SwitchTo("game")
end

function love.update(dt)
    local currentScene = ScenesManager.currentScene

    if currentScene.onUpdate then
        currentScene.onUpdate(dt)
    end
    for _, sceneView in ipairs(currentScene.views) do
        if not sceneView.isActive then
            goto continue
        end
        if sceneView.onUpdate then
            sceneView.onUpdate(dt)
        end
        :: continue ::
    end
end

function love.draw()
    local currentScene = ScenesManager.currentScene
    
    currentScene.onDraw()
    for _, sceneView in ipairs(currentScene.views) do
        if not sceneView.isActive then
            goto continue
        end
        sceneView.onDraw()
        :: continue ::
    end
end

--- @param key string
function love.keypressed(key)
    Game:OnKeyPressed(key)
    if ScenesManager.currentScene.onKeyPressed then
        ScenesManager.currentScene.onKeyPressed(key)
    end
end

return Controllers