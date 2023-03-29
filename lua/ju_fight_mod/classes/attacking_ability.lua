local cfg = ju.fight.cfg

local GM = GM or GAMEMODE
local setmetatable = setmetatable


local ATTACKING_ABILITY = setmetatable({

    ['damage'] = cfg.defaultDamage,

    ['attackType'] = cfg.defaultAttackType,
    
}, ju.fight.classes.ABILITY)


function ATTACKING_ABILITY:SetDamage(damage)
    self.damage = num

    return self
end

function ATTACKING_ABILITY:SetAttackType(attackType)
    self.attackType = attackType

    return self
end
