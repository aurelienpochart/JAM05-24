--- @class Scene
--- @field public name string
--- @field public views View[]
--- @field protected onDraw fun(): void
--- @field protected onKeyPressed fun(key: string): void
--- @field protected onLoaded fun(): void
--- @field protected onUnloaded fun(): void
--- @field protected onUpdate fun(dt: number): void
local Scene = {}

local View = require("modules/scenes/view")

local __meta = {
    __index = Scene
}

--- @param name string
--- @return Scene
function Scene.New(name)
    local self = setmetatable({}, __meta)
    
    self.name = name
    self.views = {}
    return self
end

--- @param onDrawFn fun(): void
--- @return void
function Scene:OnDraw(onDrawFn)
    self.onDraw = onDrawFn
end

--- @param onLoadedFn fun(): void
--- @return void
function Scene:OnLoaded(onLoadedFn)
    self.onLoaded = onLoadedFn
end

--- @param onUnloadedFn fun(): void
--- @return void
function Scene:OnUnloaded(onUnloadedFn)
    self.onUnloaded = onUnloadedFn
end

--- @param onKeyPressedFn fun(key: string): void
--- @return void
function Scene:OnKeyPressed(onKeyPressedFn)
    self.onKeyPressed = onKeyPressedFn
end

--- @param onUpdateFn fun(dt: number): void
--- @return void
function Scene:OnUpdate(onUpdateFn)
    self.onUpdate = onUpdateFn
end

--- @param name string
--- @param onDraw fun(): void
--- @param onUpdate fun(dt: number): void
--- @param onKeyPressed fun(key: string): void
--- @param onLoaded fun(): void
--- @param onUnloaded fun(): void
function Scene:RegisterView(name, onDraw, onUpdate, onKeyPressed, onLoaded, onUnloaded)
    self.views[#self.views + 1] = View.New(name, onDraw, onUpdate, onKeyPressed, onLoaded, onUnloaded)
end

--- @param name string
--- @return View
function Scene:GetView(name)
    for _, view in ipairs(self.views) do
        if view.name == name then
            return view
        end
    end
end

--- @param viewName string
--- @param toggled boolean
function Scene:ToggleView(viewName, toggled)
    local view = self:GetView(viewName)

    if not view then
        return
    end
    view:SetActive(toggled)
end

--- @param views string[]
--- @return void
function Scene:LoadViews(views)
    for _, viewName in ipairs(views) do
        require(("scenes/%s/views/%s"):format(self.name, viewName))(self)
    end
end

return Scene