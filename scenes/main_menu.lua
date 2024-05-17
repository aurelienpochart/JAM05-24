local Scene = require("modules/scenes/scene").New("main_menu")
local Graphics = require("modules/love/graphics")

Scene:OnDraw(function()
    Graphics.DrawRect("fill", 20,50, 120,120)
end)

Scene:OnKeyPressed(function(key)
    
end)

return Scene