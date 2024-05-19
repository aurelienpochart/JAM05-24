local function onDraw()
    love.graphics.print("By Pablo Z, Remi F, Aurelien P, Valentine T.", 530, 850, 0, 0.35)
end

return function(scene)
    scene:RegisterView("credits", onDraw)
end