
local cfg = ju.fight.cfg


cfg.defaultMana = 100

cfg.swepsSupportingAbilities = {
    ['name_swep'] = true,
}


if !SERVER then return end


-- Keys:

cfg.useAbilityKey = KEY_T

cfg.counterclockwiseAbilityKey = KEY_F

cfg.clockwiseAbilityKey = KEY_G

-- Colors

cfg.colors = {
    ['red'] = Color(244, 32, 32),
    ['blue'] = Color(35, 60, 201),
    ['yellow'] = Color(205, 195, 47),
    ['green'] = Color(39, 182, 72),
}


cfg.defaultIconPath = ''

cfg.defaultUseSound = ''

cfg.defaultCamera = { 0, 0, 0 }

-- surface.CreateFont('', {})
