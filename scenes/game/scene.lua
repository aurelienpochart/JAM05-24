local Scene = require("modules/scenes/scene").New("game")
local Graphics = require("modules/love/graphics")

Scene:OnLoaded(function()
    Scene:ToggleView("fire", true)
    Scene:ToggleView("game_bar", true)
end)

Scene:OnDraw(function()
    love.graphics.print('Hello World!', 400, 300)

    Graphics.DrawRect("fill", 20,50, 8000,800)
end)

Scene:OnKeyPressed(function(key)
    if key == "a" then
        Scene:ToggleView("bar", not Scene:GetView("bar").isActive)
    end
end)

Scene:LoadViews({"bar", "fire", "game_bar"})

return Scene