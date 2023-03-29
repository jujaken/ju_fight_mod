local util = util
local net = net

if SERVER then
    util.AddNetworkString('JuSetFightMod')

    net.Receive('JuSetFightMod', function(len, ply)
        local newValue = net.ReadBool()

        
    end)
    
else
     
    function ju.fight.SetFightModState(bValue)
        
        if bValue then
            local fightModState = vgui.Create('JuAbilityHud')
            fightModState:Center()
            
            ju.fight.fightModState = fightModState

            print ' FIGHT MOD ! '

            return
        end
        
        if IsValid(ju.fight.fightModState) then
            local fightModState = ju.fight.fightModState

            fightModState:Remove()
            fightModState = nil
        end

    end


    net.Receive('JuSetFightMod', function(len)
        ju.fight.SetFightModState(net.ReadBool())
    end)

end