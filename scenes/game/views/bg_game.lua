local function onDraw()
    --love.graphics.clear(1, 1, 1, 1)
end

return function(scene)
    scene:RegisterView("bg_game", onDraw)
end