
if SERVER then

    local function getPlayerFromArgs(args)
        if !args then return end
        
        local ply = player.GetBySteamID(args[1])
    end 
    
    
    concommand.Add('ju_fight_get_all', function(ply, cmd, args, argStr)
        PrintTable(ju.fight.data.GetAll())
    end)
    
    concommand.Add('ju_fight_get_player_data', function(ply, cmd, args, argStr)
        local ply = getPlayerFromArgs(args)
        if !ply then return end
    
        PrintTable(ju.fight.data.GetAllPlyVars(ply))
    end)
    
    concommand.Add('ju_fight_set_player_data', function(ply, cmd, args, argStr)
        local ply = getPlayerFromArgs(args)
        if !ply then return end
    
        ju.fight.data.SetPlyVarValue(ply, args[2], args[3])
    
        ju.fight.console.log('Data' .. ply:Nick() .. ' (' .. ply:SteamID() .. ') was edited!')
    end)
    
    concommand.Add('ju_fight_set_player_data_offline', function(ply, cmd, args, argStr)
        ju.fight.data.SetPlyVarValue(args[1], args[2], args[3])
    
        ju.fight.console.log('Data' .. ply:Nick() .. ' (' .. ply:SteamID() .. ') was edited!')
    end)
    
    
    concommand.Add('ju_fight_delete_player_data', function(ply, cmd, args, argStr)
        local ply = getPlayerFromArgs(args)
        if !ply then return end
    
        ju.fight.data.DeletePlyData(ply)
    
        ju.fight.console.log('Data' .. ply:Nick() .. ' (' .. ply:SteamID() .. ') was deleted!')
    end)

else

    
    
end
