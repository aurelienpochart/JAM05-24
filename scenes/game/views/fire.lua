local function onDraw()
    love.graphics.print("Fire", 800, 300)
end

--- @param scene Scene
return function(scene)
    scene:RegisterView("fire", onDraw)
end