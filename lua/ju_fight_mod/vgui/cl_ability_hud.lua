local math = math
local ScrW, ScrH = ScrW, ScrH

local abilities = ju.fight.listAbilities

local numberVertices = 4
local numberAbilities = 4

local sizeIcon = 50

local function getTablePositionsForSquareItems(numItems, sizePanel, sizeItem)

    local posTable = {}    

    local pi, cos, sin = math.pi, math.cos, math.sin

    local startPi, step = pi / 2, 2 * pi / numItems
    local halfSizePanel, halfSizeItem = sizePanel / 2, sizeItem / 2

    for i = 1, numItems - 2, 1 do

        local piPos = startPi - step * ( i - 1 )
        
        posTable[i] = { 
            ['x'] = halfSizePanel * cos(piPos) - halfSizeItem, 
            ['y'] = halfSizePanel * sin(piPos) - halfSizeItem
        }

    end

    PrintTable(posTable)

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
    surface.SetDrawColor(230, 10, 10, 158)
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
