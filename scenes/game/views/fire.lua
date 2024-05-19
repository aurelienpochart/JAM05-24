_G.Fire = {}
local FireParticle = require("modules/particles/fireParticle")
local ElectricParticle = require("modules/particles/electricParticle")
local fire = FireParticle.New(920, 540)
local explosion = FireParticle.New(920, 540, false)
local electric = ElectricParticle.New(920, 425, 100, 100)
local explode = false;
local timer = love.timer.getTime()
local currentElement = "";
local elementCount = 0;
local electricVisible = false;

local function setElectricityVisible(toggled)
    if toggled then
        local sfx = love.audio.newSource("assets/sfx/fire_sparks.ogg", "static")
        sfx:setVolume(0.90)
        sfx:setLooping(true)
        sfx:play()
        fire.elecSfx = sfx
    else
        if fire.elecSfx then
            fire.elecSfx:stop()
            fire.elecSfx:release()
        end
    end
    electricVisible = toggled
end

local function onReset()
    electric.particleSystem:reset()
    explosion.particleSystem:reset()
    explode = false
    setElectricityVisible(false)
    currentElement = ""
    elementCount = 0
    fire = FireParticle.New(920, 540)
end

local function performExplosion()
    explode = true
    explosion:Explode()
    fire.particleSystem:reset()
end

local function onSodium()
    fire = FireParticle.New(920, 540, 0)
    fire:SetColors(Colors.Yellow)
end

local function onSodiumPlusPotassium()
    electric:SetColors(Colors.Yellow, Colors.Purple)
    setElectricityVisible(true)
end

local function onSodiumPlusCuivre()
    fire = FireParticle.New(920, 540, 0)
    fire:SetColors(Colors.Yellow, Colors.Purple, Colors.White)
    setElectricityVisible(true)
    electric:SetColors(Colors.Yellow)
end

local function onMagnesium()
    fire = FireParticle.New(920, 540, 0)
    fire:SetColors(Colors.White)
end

local function onMagnesiumPlusSoufre()
    if explode == true then
        return
    end
    explosion = FireParticle.New(920, 540, 0)
    performExplosion()
end

local function onMagnesiumPlusSodium()
    fire = FireParticle.New(920, 540, 0)
    fire:SetColors(Colors.White, Colors.Yellow, Colors.White, Colors.Yellow)
end

local function onSouffre()
    fire = FireParticle.New(920, 540, 1)
end

local function onSouffrePlusPotassium()
    fire = FireParticle.New(920, 540, 1)
    fire:SetColors(Colors.Purple, Colors.LightBlue, Colors.Purple,  Colors.LightBlue)
end

local function onSouffrePlusCuivre()
    if explode == true then
        return
    end
    explosion = FireParticle.New(920, 540, 1)
    explosion:SetColors(Colors.Cyan)
    performExplosion()
end

local function onPotassium()
    fire = FireParticle.New(920, 540, 2)
    fire:SetColors(Colors.DarkPurple, Colors.DarkPurple, Colors.DarkPurple, Colors.DarkPurple)
end

local function onPotassiumPlusMagnesium()
    electric:SetColors(Colors.Purple, Colors.White, Colors.Purple, Colors.White)
    setElectricityVisible(true)
end

local function onPotassiumPlusSoufre()
    fire = FireParticle.New(920, 540, 1)
    fire:SetColors(Colors.DarkPurple, Colors.DarkPurple, Colors.DarkPurple, Colors.DarkPurple)
    explosion = FireParticle.New(920, 540, 1)
    explosion:SetColors(Colors.Blue)
    performExplosion()
end

local function onCuivre()
    fire = FireParticle.New(920, 540)
    fire:SetColors(Colors.Green)
end

local function onCuivrePlusSodium()
    fire = FireParticle.New(920, 540)
    fire:SetColors(Colors.Green, Colors.Yellow, Colors.Green, Colors.Yellow)
end

local function onCuivrePlusPotassium()
    electric:SetColors(Colors.Green, Colors.Purple, Colors.Green, Colors.Purple)
    setElectricityVisible(true)
end

local function onUpdate(dt)
    if electricVisible then
        electric.particleSystem:update(dt)
    end
    fire.particleSystem:update(dt)

    if explode == true then
        explosion.particleSystem:update(dt)
        if love.timer.getTime() - timer > 2 then
            explode = false
            timer = love.timer.getTime()
        end
    else
        timer = love.timer.getTime()
    end
end

function _G.Fire.addElement(name)
    local singleElementActions = {
        sodium = onSodium,
        magnesium = onMagnesium,
        soufre = onSouffre,
        potassium = onPotassium,
        cuivre = onCuivre,
    }
    local combinedElementActions = {
        sodium = {
            potassium = onSodiumPlusPotassium,
            cuivre = onSodiumPlusCuivre,
            magnesium = onMagnesiumPlusSodium,
        },
        magnesium = {
            soufre = onMagnesiumPlusSoufre,
            sodium = onMagnesiumPlusSodium,
            potassium = onPotassiumPlusMagnesium,
        },
        soufre = {
            potassium = onSouffrePlusPotassium,
            cuivre = onSouffrePlusCuivre,
        },
        potassium = {
            sodium = onSodiumPlusPotassium,
            magnesium = onPotassiumPlusMagnesium,
            soufre = onPotassiumPlusSoufre,
        },
        cuivre = {
            sodium = onCuivrePlusSodium,
            soufre = onSouffrePlusCuivre,
            potassium = onCuivrePlusPotassium,
        }
    }

    if currentElement == "" then
        currentElement = name
    end
    if elementCount == 0 and singleElementActions[name] then
        singleElementActions[name]()
        elementCount = elementCount + 1
    elseif elementCount == 1 and combinedElementActions[currentElement] and combinedElementActions[currentElement][name] then
        combinedElementActions[currentElement][name]()
        elementCount = elementCount + 1
    end
end

local function onKeyPressed(key)
    if key == "space" and explode == false then
        explode = true
        explosion.particleSystem:reset()
        explosion:Explode()
        fire.particleSystem:reset()
    end
    if key == "r" then
        onReset()
    end
end

local function onDraw()
    love.graphics.draw(fire.particleSystem, 0, 0)
    love.graphics.draw(electric.particleSystem, 0, 0)
    if explode == true then
        love.graphics.draw(explosion.particleSystem, 0, 0)
    end
end

--- @param scene Scene
return function(scene)
    scene:RegisterView("fire", onDraw, onUpdate, onKeyPressed)
end