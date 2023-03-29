local cfg = ju.fight.cfg

local GM = GM or GAMEMODE
local setmetatable = setmetatable

local PROTECTIVE_ABILITY = setmetatable({
    ['antiAttackType'] = cfg.defaultAttackType,
}, ju.fight.classes.ABILITY)


function ATTACKING_ABILITY:SetAntiAttackType(attackType)
    self.antiAttackType = attackType

    return self
end
