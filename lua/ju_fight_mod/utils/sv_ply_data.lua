
ju.fight.data = ju.fight.data or {}

-- Db init:

local types = {
    [1] = "INTEGER",
    [2] = "TEXT"
}

local plyTableName = 'ju_fight_mod_plys'

-- type, default
local plyVars = {
    ['mana_supplement'] = { ['type'] = 1, ['default'] = 0 },

    ['json_whitelist'] = { ['type'] = 2, ['default'] = '{}' },
}

function ju.fight.data.GetAll()
    return sql.Query('SELECT * FROM "'.. plyTableName ..'"')
end

function ju.fight.data.GetAllPlyVars(ply)
    return sql.QueryRow('SELECT * FROM "'.. plyTableName ..'" WHERE steam_id = "'.. ply:SteamID()..'"')
end

function ju.fight.data.SetPlyVarValue(ply, key, value)
    sql.Query('UPDATE "'.. plyTableName .. '" SET "'.. key .. '" = '.. value
        .. 'WHERE steam_id = "'.. ply:SteamID()..'"')
end


function ju.fight.data.DeletePlyData(ply)
    sql.Query('DELETE FROM "'.. plyTableName ..'" WHERE steam_id = "'.. ply:SteamID()..'"')
end

function ju.fight.data.CreateNewRow(ply)
    local sqlStr = 'INSERT INTO "'.. plyTableName .. '" ( '

    local columns = '"steam_id"'
    local values = 'VALUES ( "' .. ply:SteamID() .. '"'

    for k, v in pairs(plyVars) do
        
        if !v.default then return end

        columns = columns .. ', "' .. k ..'" '
        values = values .. ', "' .. v.default ..'" '

    end

    columns = columns .. ') '
    values = values .. ');'

    sqlStr = sqlStr .. columns .. values

    sql.Query(sqlStr)

    ju.fight.console.log('For player ' .. ply:Nick().. 
        ' ( ' .. ply:SteamID() .. " ) was created new row in db! It's cool. Yeah?")
end

local function makeAlterColumnStr(name, data)
    return 'ALTER TABLE "' .. plyTableName 
        .. '" ADD COLUMN "' .. name .. '" '
        .. types[data.type] .. ' ' 
        .. ((data.default) and (' NOT NULL DEFAULT "'.. data.default ..'"' ) or '') .. ' '
end

local function makePlyDb()
    local tableExists = sql.TableExists(plyTableName)
    if !tableExists then
        sql.Query('CREATE TABLE "' .. plyTableName 
        .. '" ( "id" INTEGER NOT NULL UNIQUE, "steam_id" TEXT NOT NULL UNIQUE, PRIMARY KEY("id" AUTOINCREMENT) )')

        ju.fight.console.log 'WAS CREATED NEW PLY DB!'
    end

    for k, v in pairs(plyVars) do
        sql.Query(makeAlterColumnStr(k, v))
    end
end


hook.Add('Initialize', 'JuPlyDataInit', function()
    makePlyDb()
end)

