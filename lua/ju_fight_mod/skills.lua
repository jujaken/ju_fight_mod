
local types = ju.fight.enums.targetTypes

local classes = ju.fight.classes

local attack = classes.ATTACKING_ABILITY

attack:new('fireball')
    :SetAttackType()
    :SetTargetType(LINE_ZONE)
    :SetDist()
    :SetRadius()
    :SetDamage()
    :SetClientNoTarget(true)
    .OnUsed = function(self, client, targets)
        
    end



local protect = classes.PROTECTIVE_ABILITY

protect:new('water_protection')
    :SetAntiAttackType()
    :SetTargetType(ON_SPHERE)
    :SetRadius(100)
    .OnUsed = function(self, client, targets)
        
    end



local support = classes.SUPPORT_ABILITY

support:new('sun_hill')
    :SetAntiAttackType()
    :SetTargetType(ONLY_USER)
    .OnUsed = function(self, client, targets)
        
    end

