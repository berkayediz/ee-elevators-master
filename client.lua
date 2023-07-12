ESX = nil
QBCore = nil
PlayerData = nil
PlayerJob = nil
PlayerGrade = nil

-- Thread for initializing ESX or QBCore and setting up player job and grade
CreateThread(function()
    if Config.UseESX then
        ESX = exports["es_extended"]:getSharedObject()
        while not ESX.IsPlayerLoaded() do
            Wait(100)
        end

        PlayerData = ESX.GetPlayerData()
        PlayerJob = PlayerData.job.name
        PlayerGrade = PlayerData.job.grade

        RegisterNetEvent("esx:setJob", function(job)
            PlayerJob = job.name
            PlayerGrade = job.grade
        end)

    elseif Config.UseQBCore then

        QBCore = exports["qb-core"]:GetCoreObject()

        CreateThread(function()
            while true do
                PlayerData = QBCore.Functions.GetPlayerData()
                if PlayerData.citizenid ~= nil then
                    PlayerJob = PlayerData.job.name
                    PlayerGrade = PlayerData.job.grade.level
                    break
                end
                Wait(100)
            end
        end)

        RegisterNetEvent("QBCore:Client:OnJobUpdate", function(job)
            PlayerJob = job.name
            PlayerGrade = job.grade.level
        end)
    end
end)

-- Thread for setting up elevator zones and handling notifications
CreateThread(function()
    -- Iterate over elevator configurations
    for elevatorName, elevatorFloors in pairs(Config.Elevators) do
        -- Iterate over floors of each elevator
        for index, floor in pairs(elevatorFloors) do
            -- Check if ThirdEyeName is 'ox_target'
            if Config.ThirdEyeName == 'ox_target' then
                local info = {}
                info.elevator = elevatorName
                info.level = index
                -- Add box zone for ox_target
                exports.ox_target:addBoxZone({
                    coords = vec3(floor.coords.x, floor.coords.y, floor.coords.z),
                    size = vec3(5, 4, 3),
                    rotation = floor.heading,
                    debug = drawZones,
                    options = {
                        {
                            name = tostring(elevatorName .. index),
                            event = 'ox_target:debug',
                            icon = "fas fa-hand-point-up",
                            label = "Use Elevator From " .. floor.level,
                            onSelect = function()
                                TriggerEvent("ee_elevator:showFloors", info)
                            end
                        }
                    }
                })
            else
                -- Add box zone for other frameworks
                exports[Config.ThirdEyeName]:AddBoxZone(elevatorName .. index, floor.coords, 5, 4, {
                    name = elevatorName,
                    heading = floor.heading,
                    debugPoly = false,
                    minZ = floor.coords.z - 1.5,
                    maxZ = floor.coords.z + 1.5
                },
                {
                    options = {
                        {
                            event = "ee_elevator:showFloors",
                            icon = "fas fa-hand-point-up",
                            label = "Use Elevator From " .. floor.level,
                            elevator = elevatorName,
                            level = index
                        },
                    },
                    distance = 1.5
                })
            end
        end
    end

    -- Check if notification is enabled
    if Config.Notify.enabled then
        local wasNotified = false
        while true do
            local sleep = 3000
            local nearElevator = false
            local playerCoords = GetEntityCoords(PlayerPedId())
            -- Iterate over elevator configurations
            for elevatorName, elevatorFloors in pairs(Config.Elevators) do
                -- Iterate over floors of each elevator
                for index, floor in pairs(elevatorFloors) do
                    local distance = #(playerCoords - floor.coords)
                    if distance <= 10.0 then
                        sleep = 10
                        if distance <= Config.Notify.distance then
                            nearElevator = true
                            break
                        end
                    end
                end
            end
            -- Show notification if player is near an elevator
            if nearElevator then
                if not wasNotified then
                    NotifyHint()
                    wasNotified = true
                end
            else
                wasNotified = false
            end
            Wait(sleep)
        end
    end

end)

-- Thread for handling 3D text and interaction with elevators
CreateThread(function()
    while Config.Use3DText do
        local sleep = 2000
        local playerCoords = GetEntityCoords(PlayerPedId())
        -- Iterate over elevator configurations
        for elevatorName, elevatorFloors in pairs(Config.Elevators) do
            -- Iterate over floors of each elevator
            for index, floor in pairs(elevatorFloors) do
                local distance = #(playerCoords - floor.coords)
                if distance <= 10.0 then
                    sleep = 100
                    if distance <= 5 then
                        sleep = 0
                        -- Display 3D text and handle interaction
                        DrawText3Ds(floor.coords.x,floor.coords.y,floor.coords.z, "Press ~r~E~w~ to use Elevator From " .. floor.level)
                        if IsControlJustReleased(0, 38) then
                            local data = {}
                            data.elevator = elevatorName
                            data.level = index
                            TriggerEvent('ee_elevator:showFloors', data)
                        end
                    end
                end
            end
        end
        Wait(sleep)
    end
end)

-- Event handler for showing elevator floors menu
RegisterNetEvent("ee_elevator:showFloors", function(data)
    local elevator = {}
    local floor = {}
    if Config.UseESX then
        PlayerData = ESX.GetPlayerData()
    elseif Config.UseQBCore then
        PlayerData = QBCore.Functions.GetPlayerData()
    end
    -- Iterate over floors of the selected elevator
    for index, floor in pairs(Config.Elevators[data.elevator]) do
        if Config.NHMenu then
            -- Add floor as an option for nh-context menu
            table.insert(elevator, {
                header = floor.level,
                context = floor.label,
                disabled = isDisabled(index, floor, data),
                event = "ee_elevator:movement",
                args = { floor }
            })
        elseif Config.QBMenu then
            -- Add floor as an option for qb-menu
            table.insert(elevator, {
                header = floor.level,
                txt = floor.label,
                disabled = isDisabled(index, floor, data),
                params ={ 
                    event = "ee_elevator:movement",
                    args = floor
                }
            })
        elseif Config.OXLib then
            -- Add floor as an option for OXLib menu
            table.insert(elevator, {
                label = floor.level..' - '..floor.label,
                args = { value = floor.coords, value2 = isDisabled(index, floor, data)}
            })
        end
    end
    -- Trigger the appropriate menu event based on the selected framework
    if Config.NHMenu then
        TriggerEvent("nh-context:createMenu", elevator)
