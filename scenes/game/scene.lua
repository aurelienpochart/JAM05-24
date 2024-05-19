local Scene = require("modules/scenes/scene").New("game")
local Graphics = require("modules/love/graphics")

Scene:OnLoaded(function()
    local sfx = love.audio.newSource("assets/sfx/baptiste.ogg", "static")
    sfx:setVolume(0.90)
    sfx:play()
    
    Scene:ToggleView("fire", true)
    Scene:ToggleView("game_bar", true)
    Scene:ToggleView("bg_game", true)
    Scene:ToggleView("elements", true)
    
    Scene.sfx = love.audio.newSource("assets/sfx/fire.ogg", "static")
    Scene.sfx:setVolume(0.30)
    Scene.sfx:setLooping(true)
    Scene.sfx:play()
end)

Scene:OnDraw(function()
end)

Scene:OnKeyPressed(function(key)
    if key == "a" then
        Scene:ToggleView("bar", not Scene:GetView("bar").isActive)
    end
    if key == "e" then
        Scene:ToggleView("game_bar", not Scene:GetView("game_bar").isActive)
        Scene:ToggleView("elements", not Scene:GetView("elements").isActive)
    end
end)

Scene:LoadViews({"bg_game", "fire", "game_bar", "elements"})

return Scene