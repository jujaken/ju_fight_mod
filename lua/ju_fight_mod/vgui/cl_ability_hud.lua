local ScrW, ScrH = ScrW, ScrH

local abilities = ju.fight.listAbilities

local numberVertices = 4
local numberAbilities = 4

-- Ability hud button


DEFINE_BASECLASS('Panel')

AccessorFunc(PANEL, 'abilityId', 'AbilityId', FORCE_STRING)

local PANEL = {}

function PANEL:Init()

    local h = ScrH() / 4
    local w = h

    self:SetSize(w, h)

    -- self.iconMaterial = Material(abilities[abilityId]:GetIconPath())
end

function PANEL:Paint(w, h)
    
end

vgui.Register('JuAbilityHudButton', PANEL, 'Panel')

-- Ability hud

DEFINE_BASECLASS('Panel')

PANEL = {}

function PANEL:Init()
    
end

vgui.Register('JuAbilityHud', PANEL, 'Panel')
