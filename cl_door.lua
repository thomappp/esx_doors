local T = Config.Translate

local IsDoorOpen = function(DoorHash)
    local state = DoorSystemGetDoorState(DoorHash)
    return state == 0
end

local CanUseDoor = function(AllowedGroups)
    local playerGroup = ESX.PlayerData.job.name

    for _, groupName in pairs(AllowedGroups) do
        if groupName == playerGroup then
            return true
        end
    end

    return false
end

Citizen.CreateThread(function()
    while true do
        local playerWait = 100
        local userCoords = GetEntityCoords(PlayerPedId())
        
        for doorId, door in ipairs(Config.Doors) do
            local doorCoords = door.coords
            local distance = #(userCoords - doorCoords)
        
            if distance <= door.distance then
                if CanUseDoor(door.groups) then
                    playerWait = 10

                    local doorState = IsDoorOpen(door.hash)

                    if doorState then
                        ESX.ShowHelpNotification((T("press_to_lock")):format(Config.Control.controlName))
                    else
                        ESX.ShowHelpNotification((T("press_to_unlock")):format(Config.Control.controlName))
                    end

                    if IsControlJustReleased(0, Config.Control.controlId) then
                        TriggerServerEvent("doors_script:server:update_door", door.hash, doorState)
                    end
                end
            end
        end

        Citizen.Wait(playerWait)
    end
end)

RegisterNetEvent("doors_script:client:init")
AddEventHandler("doors_script:client:init", function(doors)    
    for doorHash, door in pairs(doors) do
        AddDoorToSystem(doorHash, door.model, door.coords)
        DoorSystemSetDoorState(doorHash, door.locked)
    end
end)

RegisterNetEvent("doors_script:client:update_door")
AddEventHandler("doors_script:client:update_door", function(doorHash, state)    
    DoorSystemSetDoorState(doorHash, state)
end)

-- Resynchronize doors after a respawn (after a death for example)
AddEventHandler("playerSpawned", function()
    for doorId, door in pairs(Config.Doors) do
        local doorHash = door.hash
        AddDoorToSystem(doorHash, door.model, door.coords)
        local doorState = IsDoorOpen(doorHash)
        DoorSystemSetDoorState(doorHash, not doorState)
    end
end)