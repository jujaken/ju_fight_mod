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
            ju.fight.fightModState = vgui.Create('JuAbilityHud') 
            return
        end
        
        if IsValid(ju.fight.fightModState) then
            ju.fight.fightModState:Remove()
            ju.fight.fightModState = nil
        end

    end


    net.Receive('JuSetFightMod', function(len)
        ju.fight.SetFightModState(net.ReadBool())
    end)

end