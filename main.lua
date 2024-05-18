local ScenesManager = require("modules/scenes/scenes_manager")
local Game = require("modules/game/game")

_G.Controllers = { game = Game, scenesManager = ScenesManager } 

--[[ Love2D Overrides ]]
function love.load()
    Game:SetTitle("On Fire !")
    Game:SetWindowMode(1920, 1080, {})
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
        for _, sceneView in ipairs(ScenesManager.currentScene.views) do
            if not sceneView.isActive then
                goto continue
            end
            if sceneView.onKeyPressed then
                sceneView.onKeyPressed(key)
            end
            :: continue ::
        end
    end
end