
local cfg = ju.fight.cfg
local list = ju.fight.listSkills

local GM = GM or GAMEMODE
local setmetatable = setmetatable

local netInstructions = {
    [1] = 'Use',
}

local ABILITY = {
    ['manacost'] = cfg.defaultMana / 5,
    ['cooldown'] = 15, -- in seconds
    ['iconPath'] = cfg.defaultIconPath,
    ['useSound'] = cfg.defaultUseSound,
}

local ABILITY = {}

ABILITY.__index = ABILITY

function ABILITY:GetNetStr(id)
    return netInstructions[1] .. '_' .. self.uniqueId
end

function ABLILITY:New(uniqueId)
    assert(uniqueId, 'U a really so stupid? U ability don`t have fucking `uniqueId`!')

    self.uniqueId = uniqueId

    list[self.uniqueId] = self

    for k, _ in ipairs(netInstructions) do
        util.AddNetworkString(self:GetNetStr(k))
    end

    return setmetatable({}, self)
end

function ABILITY:SetManacost(manacost)
    self.manacost = manacost

    return self
end

function ABILITY:SetCooldown(cooldown)
    self.cooldown = cooldown

    return self
end

function ABILITY:SetIconPath(iconPath)
    self.iconPath = iconPath

    return self
end

function ABILITY:OnUsed()
    
end

function ABILITY:Use()
    if CLIENT then
        net.Start(self:GetNetStr(1))
            -- net.WriteString(self.uniqueID)
        net.SendToServer()
    else
        hook.Call('JuAbilityWasUsed', GM, self.uniqueId)
    end
end

ju.fight.classes.ABILITY = ABILITY
