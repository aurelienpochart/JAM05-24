local Scene = require("modules/scenes/scene").New("game")
local Graphics = require("modules/love/graphics")

Scene:OnLoaded(function()
    Scene:ToggleView("fire", true)
    Scene:ToggleView("game_bar", true)
    Scene:ToggleView("bg_game", true)
end)

Scene:OnDraw(function()
    love.graphics.print('Hello World!', 400, 300)

    Graphics.DrawRect("fill", 20, 50, 8000,800)
end)

Scene:OnKeyPressed(function(key)
    if key == "a" then
        Scene:ToggleView("bar", not Scene:GetView("bar").isActive)
    end
    if key == "e" then
        Scene:ToggleView("game_bar", not Scene:GetView("game_bar").isActive)
    end
end)

Scene:LoadViews({"bg_game", "fire", "game_bar", "bar"})

return Scene