local doors = {}

local initDoors = function()
    for doorId, door in ipairs(Config.Doors) do
        doors[door.hash] = { locked = door.locked, model = door.model, coords = door.coords }
    end
end

-- Initialize doors at server startup 
AddEventHandler("onResourceStart", function()
    initDoors()
end)

-- Synchronize doors to the client who logs in
AddEventHandler("playerJoining", function()
    TriggerClientEvent("doors_script:client:init", source, doors)
end)

-- Synchronize doors with online clients
RegisterServerEvent("doors_script:server:update_door")
AddEventHandler("doors_script:server:update_door", function(doorHash, doorState)
    doors[doorHash].locked = doorState
    TriggerClientEvent("doors_script:client:update_door", -1, doorHash, doorState)
end)