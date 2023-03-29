
local GM = GM or GAMEMODE
local setmetatable = setmetatable

local FIGURE = {}

FIGURE.__index = FIGURE

function FIGURE:New(startVector)
    self.startVector = startVector

    return self
end

function FIGURE:Draw(sortFunc)
    local players

    if startVector then
        players = sortFunc(self.startVector)
    end

    for _, ply in ipairs(players) do
        net.Start()
        net.Send(ply)
    end
end

if SERVER then

else
    
end