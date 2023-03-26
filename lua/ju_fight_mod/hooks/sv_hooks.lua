
hook.Add('PlayerInitialSpawn', 'JuPlyDataCreateRow', function(ply, transition)
    if ply:IsBot() or ju.fight.data.GetAllPlyVars(ply) then return end

    ju.fight.data.CreateNewRow(ply)
end)
