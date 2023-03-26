
local PLAYER = FindMetaTable('Player')

-- PLAYER._manaDefault = 100
-- PLAYER._mana = 100

PLAYER.selectedAbilitySlot = 1
PLAYER.lastAbility = nil

function PLAYER:GetMaxMana()
    
end

function PLAYER:GetMana()
    
end

function PLAYER:CanSpendMana(num)
    return self:GetMana() - num >= 0
end

function PLAYER:GetSelectedAbility()
    
end

function PLAYER:SetSelectedAbility(ablilityId)
    
end

function PLAYER:CanSelectedAbility(ablilityId)
    
end

if SERVER then
    
    -- The database stores the addition to `ju.fight.cfg.defaultMana`!
    function PLAYER:SetMaxManaSupplement(newValue)
        
    end
        
    function PLAYER:SetMana(newValue)
        
    end

    function PLAYER:AddMana(addValue)
        
    end

else
    
end