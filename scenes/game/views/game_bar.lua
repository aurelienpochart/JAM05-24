local function onLoaded()
    print("game_bar loaded")
end

local function onDraw()
    love.graphics.draw("game_bar", 1000, 300)
end

--- @param scene Scene
return function(scene)
    scene:RegisterView("game_bar", onDraw)
end