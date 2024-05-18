--- @class View
--- @field public name string
--- @field public isActive boolean
--- @field protected onUpdate fun(dt: number): void
--- @field protected onDraw fun(): void
--- @field protected onLoaded fun(): void
--- @field protected onUnloaded fun(): void
local View = {}

local __meta = {
    __index = View
}

--- @param name string
--- @param onDraw fun(): void
--- @param onUpdate fun(dt: number): void
--- @param onLoaded fun(): void
--- @param onUnloaded fun(): void
--- @return View
function View.New(name, onDraw, onUpdate, onKeyPressed, onLoaded, onUnloaded)
    local self = setmetatable({}, __meta)
    
    self.name = name
    self.onDraw = onDraw
    self.onUpdate = onUpdate
    self.onLoaded = onLoaded
    self.onUnloaded = onUnloaded
    self.onKeyPressed = onKeyPressed
    self.isActive = false
    return self
end

--- @param bool boolean
function View:SetActive(bool)
    self.isActive = bool

    if self.isActive and self.onLoaded then
        self.onLoaded()
    elseif not self.isActive and self.onUnloaded then
        self.onUnloaded()
    end
end

return View