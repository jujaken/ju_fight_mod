
ju = ju or {}
ju.fight = ju.fight or {}
ju.fight.cfg = ju.fight.cfg or {}
ju.fight.classes = ju.fight.classes or {}
ju.fight.listAbilities = ju.fight.listAbilities or {}
ju.fight.enums = ju.fight.enums or {}


local rDir = 'ju_fight_mod/'

local addSv = SERVER and include or function() end
local addCl = SERVER and AddCSLuaFile or include
local addSh = function(...)
    addSv(...)
    addCl(...)
end

local addFile = function(name, dir)
    local prefix = string.Left(name, 3)
    local path = dir..name

    if prefix == 'sv_' then
        addSv(path)
        return
    end

    if prefix == 'cl_' then
        addCl(path)
        return
    end

    addSh(path)
end

local addDir = function(name)
    local dir = rDir..name..'/'
    local files, _ = file.Find(dir..'*', 'LUA')
    
    for _, v in ipairs(files) do
        if !string.EndsWith(v, '.lua') then return end
        addFile(v, dir)
    end
end

-- includes:

addSh(rDir..'cfg.lua')
addDir('core')

addDir('classes/bases')
addDir('classes')

addDir('extensions')

addSh(rDir..'skills.lua')

addDir('vgui')
addDir('hooks')

addSh(rDir..'commands.lua')


ju.fight.console.log "~~~\tJuliandrKen (Julik#8946) fighting mod was loaded. Let's go!\t~~~"