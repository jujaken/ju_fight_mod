
local cfg = ju.fight.cfg
local list = ju.fight.listSkills

local GM = GM or GAMEMODE
local setmetatable = setmetatable

local netInstructions = {
    [1] = 'Use',
}

local ABILITY = {
    ['manacost'] = cfg.defaultMana / 5,
    ['cooldown'] = cfg.defaultCooldown,
    ['iconPath'] = cfg.defaultIconPath,
    ['useSound'] = cfg.defaultUseSound,
    ['title'] = cfg.defaultTitle,
}

local ABILITY = {}

ABILITY.__index = ABILITY

function ABILITY:GetNetStr(id)
    return netInstructions[1] .. '_' .. self.uniqueId
end

function ABILITY:New(uniqueId)
    assert(uniqueId, 'U a really so stupid? U ability don`t have fucking `uniqueId`!')

    self.uniqueId = uniqueId

    list[self.uniqueId] = self

    for k, _ in ipairs(netInstructions) do
        util.AddNetworkString(self:GetNetStr(k))
    end

    self.__index = self

    return setmetatable({}, self)
end

function ABILITY:OnUsed(client, targets)
    
end

function ABILITY:PostUsed(client, targets)
    
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

if SERVER then
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
    
    function ABILITY:SetTargetType(typeIndex)
        self.targetType = typeIndex
    
        return self
    end

    function ABILITY:SetClientNoTarget(bValue)
        self.clientNoTarget = bValue

        return self
    end
else

end


ju.fight.classes.ABILITY = ABILITY
