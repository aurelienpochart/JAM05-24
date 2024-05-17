--- @class Scene
--- @field public name string
--- @field public onDraw fun(): void
--- @field public onKeyPressed fun(key: string): void
local Scene = {}

local __meta = {
    __index = Scene
}

--- @param name string
--- @return Scene
function Scene.New(name)
    local self = setmetatable({}, __meta)

    self.name = name
    return self
end

--- @param onDrawFn fun(): void
--- @return void
function Scene:OnDraw(onDrawFn)
    self.onDraw = onDrawFn
end

--- @param onKeyPressedFn fun(key: string): void
--- @return void
function Scene:OnKeyPressed(onKeyPressedFn)
    self.onKeyPressed = onKeyPressedFn
end

return Scene