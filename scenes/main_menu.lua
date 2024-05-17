local Scene = require("modules/scenes/scene").New("main_menu")

Scene:OnDraw(function()
    love.graphics.print("Menu principal", 500, 500)
end)

Scene:OnKeyPressed(function(key) 
    print(key)
end)

return Scene