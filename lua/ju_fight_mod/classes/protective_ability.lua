local cfg = ju.fight.cfg

local GM = GM or GAMEMODE
local setmetatable = setmetatable

local PROTECTIVE_ABILITY = {
    ['antiAttackType'] = cfg.defaultAttackType,
}


function PROTECTIVE_ABILITY:SetAntiAttackType(attackType)
    self.antiAttackType = attackType

    return self
end

ju.fight.classes.PROTECTIVE_ABILITY = setmetatable(PROTECTIVE_ABILITY, ju.fight.classes.ABILITY)
