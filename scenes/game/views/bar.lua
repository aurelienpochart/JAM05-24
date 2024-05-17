local function onDraw()
    love.graphics.print("Prout", 800, 300)
end

--- @param scene Scene
return function(scene)
    scene:RegisterView("bar", onDraw)
end