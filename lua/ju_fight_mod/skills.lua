
local types = ju.fight.enums.targetTypes

local classes = ju.fight.classes

local attack = classes.ATTACKING_ABILITY

attack:New('fireball')
    :SetAttackType()
    :SetTargetType(LINE_ZONE)
    -- :SetDist()
    -- :SetRadius()
    :SetDamage()
    :SetClientNoTarget(true)
    .OnUsed = function(self, client, targets)
        
    end



local protect = classes.PROTECTIVE_ABILITY

protect:New('water_protection')
    :SetAntiAttackType()
    :SetTargetType(ON_SPHERE)
    -- :SetRadius(100)
    .OnUsed = function(self, client, targets)
        
    end



local support = classes.SUPPORT_ABILITY

support:New('sun_hill')
    :SetTargetType(ONLY_USER)
    .OnUsed = function(self, client, targets)
        
    end

