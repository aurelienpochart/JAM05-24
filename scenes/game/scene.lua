local Scene = require("modules/scenes/scene").New("game")
local Graphics = require("modules/love/graphics")

Scene:OnLoaded(function()
    Scene:ToggleView("fire", true)
end)

Scene:OnDraw(function()
    --Graphics.DrawRect("fill", 20,50, 8000,800)
end)

Scene:OnKeyPressed(function(key)
    if key == "a" then
        Scene:ToggleView("bar", not Scene:GetView("bar").isActive)
    end
end)

Scene:LoadViews({"bar", "fire"})

return Scene