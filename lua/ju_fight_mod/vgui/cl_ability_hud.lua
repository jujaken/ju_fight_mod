local math = math
local ScrW, ScrH = ScrW, ScrH

local abilities = ju.fight.listAbilities

local numberVertices = 4
local numberAbilities = 6

local sizeIcon = 32

local function getTablePositionsForSquareItems(numItems, sizePanel, sizeItem)

    local posTable = {}    

    local pi, cos, sin = math.pi, math.cos, math.sin

    sizePanel = sizePanel - sizeItem

    local startPi, step = - pi / 2, 2 * pi / numItems
    local halfSizePanel, halfSizeItem = sizePanel / 2, sizeItem / 2

    for i = 1, numItems, 1 do

        local piPos = startPi - step * ( i - 1 )
        
        posTable[i] = { 
            ['x'] = halfSizePanel + halfSizeItem + halfSizePanel * cos(piPos) - halfSizeItem, 
            ['y'] = halfSizePanel + halfSizeItem + halfSizePanel * sin(piPos) - halfSizeItem
        }

    end

    return posTable
    
end


-- Ability hud button

DEFINE_BASECLASS('Panel')

-- AccessorFunc(PANEL, 'abilityId', 'AbilityId', FORCE_STRING)

local PANEL = {}

function PANEL:Init()
    -- self.iconMaterial = Material(abilities[abilityId]:GetIconPath())
end

function PANEL:Paint(w, h)
    surface.SetDrawColor(98, 67, 93, 214)
    surface.DrawRect(0, 0, w, h)
end

vgui.Register('JuAbilityHudButton', PANEL, 'Panel')


-- Ability hud

DEFINE_BASECLASS('Panel')

PANEL = {}

function PANEL:Init()
    
    local size = ScrH() / 4
    self:SetSize(size, size)

    self:CreateAbilityButtons(size)
end

function PANEL:Paint(w, h)
    surface.SetDrawColor(21, 105, 142, 150)
    surface.DrawRect(0, 0, w, h)

    -- for test:
    -- surface.DrawCircle(w / 2, h / 2, (w / 2 - sizeIcon) * math.cos(CurTime()), 33, 33, 33, 255)
end

function PANEL:CreateAbilityButtons(size)

    self.abilityButtons = {}

    for k, v in ipairs(getTablePositionsForSquareItems(numberAbilities, size, sizeIcon)) do
        
        self.abilityButtons[k] = vgui.Create('JuAbilityHudButton', self)
        self.abilityButtons[k]:SetSize(sizeIcon, sizeIcon)
        self.abilityButtons[k]:SetPos(v.x, v.y)

    end

end

function PANEL:RemoveAllAbilityButtons()
    
    for k, v in ipairs(self.abilityButtons) do
        v:Remove()
    end

end

vgui.Register('JuAbilityHud', PANEL, 'Panel')
