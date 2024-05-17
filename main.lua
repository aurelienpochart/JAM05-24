local ScenesManager = require("modules/scenes/scenes_manager")
local Game = require("modules/game/game")

--[[ Love2D Overrides ]]
function love.load()
    Game:SetTitle("On Fire !")
    Game:SetWindowMode(1920, 1080, {})
    ScenesManager:SwitchTo("game")
end

function love.draw()
    ScenesManager.currentScene.onDraw()
end

--- @param key string
function love.keypressed(key)
    Game:OnKeyPressed(key)
    if ScenesManager.currentScene.onKeyPressed then
        ScenesManager.currentScene.onKeyPressed(key)
    end
end