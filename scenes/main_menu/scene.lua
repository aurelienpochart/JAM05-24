local Scene = require("modules/scenes/scene").New("main_menu")
local Graphics = require("modules/love/graphics")

Scene:OnLoaded(function()
    
end)

Scene:OnUnloaded(function()
    
end)

Scene:OnDraw(function()
    love.graphics.print('Ntm', 400, 300)
end)

return Scene