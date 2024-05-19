local Scene = require("modules/scenes/scene").New("main_menu")
local Graphics = require("modules/love/graphics")

local currentButtonIndex = 1
local buttons = {
    { 
        label = "Jouer",
        xOffset = 350,
        onClick = function()
            Controllers.scenesManager:SwitchTo("game")            
        end
    },
    {
        label = "Quitter",
        xOffset = 290,
        onClick = function()
            os.exit()
        end
    },
    {
        label = "Credits",
        xOffset = 300,
        onClick = function()
            Scene:ToggleView("credits", not Scene:GetView("credits").isActive)
        end
    }
}

local function refreshButtons(firstInit)
    for index, button in ipairs(buttons) do
        button.isHovered = false
        if index == currentButtonIndex then
            button.isHovered = true
        end
        button.image = love.graphics.newImage(button.isHovered and "assets/images/btn_idle.png" or "assets/images/btn_hover.png")
    end
    if not firstInit then
        local sfx = love.audio.newSource("assets/sfx/btn_hover.ogg", "static")
        love.audio.play(sfx)
    end
end

Scene:OnLoaded(function()
    if not Scene.font then
        Scene.font = love.graphics.newFont("assets/fonts/Empire.ttf", 100)
    end
    love.mouse.setVisible(false)
    if not Scene.bg then
        Scene.bg = love.graphics.newImage("assets/images/menu_bg.png")
    end
    if not Scene.music then
        Scene.music = love.audio.newSource("assets/musics/menu.ogg", "static")
        Scene.music:setVolume(0.15)
        love.audio.play(Scene.music)
    end
    refreshButtons(true)
end)

Scene:OnUnloaded(function()
    if Scene.bg then
        Scene.bg:release()
        Scene.bg = nil
    end
    if Scene.music then
        Scene.music:stop()
        Scene.music:release()
        Scene.music = nil
    end
end)

Scene:OnDraw(function()
    love.graphics.draw(Scene.bg, 0, 0)
    love.graphics.setFont(Scene.font)
    love.graphics.push()
    love.graphics.scale(0.5, 0.5)
    local y = 450
    for index, button in ipairs(buttons) do
        love.graphics.draw(button.image, 1350, y * index)
        love.graphics.setColor(0, 0, 0)
        love.graphics.print(button.label, 1350 + button.xOffset, (y * index) + 58)
        love.graphics.setColor(255, 255, 255)
    end
    love.graphics.pop()
end)

Scene:OnKeyPressed(function(key)
    if key == "up" then
        currentButtonIndex = currentButtonIndex - 1
        if (currentButtonIndex < 1) then
            currentButtonIndex = #buttons
        end
        refreshButtons()
        return
    end

    if key == "down" then
        currentButtonIndex = currentButtonIndex + 1
        if (currentButtonIndex > #buttons) then
            currentButtonIndex = 1
        end
        refreshButtons()
        return
    end

    if key == "return" then
        local button = buttons[currentButtonIndex]
        if not button then
            return
        end
        local sfx = love.audio.newSource("assets/sfx/btn_click.ogg", "static")
        love.audio.play(sfx)
        button.onClick()
        return
    end
end)

Scene:LoadViews({"credits"})

return Scene