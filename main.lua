local ScenesManager = require("modules/scenes/scenes_manager")

--[[ Love2D Overrides ]]
function love.draw()
    ScenesManager.currentScene.onDraw()
end

--- @param key string
function love.keypressed(key)
    if ScenesManager.currentScene.onKeyPressed then
        ScenesManager.currentScene.onKeyPressed(key)
    end
end