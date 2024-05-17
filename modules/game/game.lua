--- @class Game
local Game = {}

local __meta = {
    __index = Game
}

--- @return Game
function Game.New()
    local self = setmetatable({}, __meta)
    return self
end

--- @param title string
--- @return void
function Game:SetTitle(title)
    love.window.setTitle(title)
end

--- @param width number
--- @param height number
--- @param flags table
--- @return void
function Game:SetWindowMode(width, height, flags)
    love.window.setMode(width, height, flags)
end

--- @return void
function Game:Stop()
    love.window.close()
    os.exit()
end

--- @param key string
--- @return void
function Game:OnKeyPressed(key)
    if key == "escape" then
        return self:Stop()
    end
end

return Game.New()