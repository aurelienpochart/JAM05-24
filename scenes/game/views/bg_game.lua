local bg_game = love.graphics.newImage("assets/images/bg_game.png")

local function onDraw()
    if bg_game then
        love.graphics.draw(bg_game, 0, 0, 0, 2, 2)
    end
end

return function(scene)
    scene:RegisterView("bg_game", onDraw)
end