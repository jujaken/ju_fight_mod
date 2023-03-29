local cfg = ju.fight.cfg

local GM = GM or GAMEMODE
local setmetatable = setmetatable

local ATTACKING_ABILITY = {

    ['damage'] = cfg.defaultDamage,

    ['attackType'] = cfg.defaultAttackType,
    
}

function ATTACKING_ABILITY:SetDamage(damage)
    self.damage = num

    return self
end

function ATTACKING_ABILITY:SetAttackType(attackType)
    self.attackType = attackType

    return self
end

ATTACKING_ABILITY = setmetatable(ATTACKING_ABILITY, ju.fight.classes.ABILITY)

ju.fight.classes.ATTACKING_ABILITY = ATTACKING_ABILITY
