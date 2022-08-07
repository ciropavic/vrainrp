ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterNetEvent('project:getvehicleinfos')
AddEventHandler('project:getvehicleinfos', function(plate, vehicle) 
    local xPlayer = ESX.GetPlayerFromId(source)
    local playername = GetPlayerName(source)
    local job = xPlayer.job.name

    local infos = MySQL.Sync.fetchAll("SELECT * FROM owned_vehicles WHERE plate = @plate", {
        ['@plate'] = plate
    })

    local sqlowner = infos[1]["owner"]
    local igowner = GetPlayerIdentifiers(source)[2]

    if plate == "LSPD" then
        if job == "police" then
            TriggerClientEvent('project:opencar', source, vehicle)
        end
    elseif plate == "LACO" then
        if job == "lacosanostra" then
            TriggerClientEvent('project:opencar', source, vehicle)
        end
    elseif plate = "BALL" then
        if job == "ballas" then
            TriggerClientEvent('project:opencar', source, vehicle)
        end
    elseif plate == "EMS" then
        if job == "ambulance" then
            TriggerClientEvent('project:opencar', source, vehicle)
        end
    elseif plate == "LOST" then
        if job == "lostnegro" then
            TriggerClientEvent('project:opencar', source, vehicle)
        end
    elseif plate == "MOTO" then
        if job == "motogang" then
            TriggerClientEvent('project:opencar', source, vehicle)
        end
    elseif plate == "NDRA" then
        if job == "ndrangheta" then
            TriggerClientEvent('project:opencar', source, vehicle)
        end
    elseif plate == "MIRA" then
        if job == "miraglia" then
            TriggerClientEvent('project:opencar', source, vehicle)
        end
    elseif plate == "LOSTMC" then
        if job == "lostmc" then
            TriggerClientEvent('project:opencar', source, vehicle)
        end
    elseif plate == "NARCOS" then
        if job == "narcoscartell" then
            TriggerClientEvent('project:opencar', source, vehicle)
        end
    elseif plate == "PEARLS" then
        if job == "pearlsrestaurant" then
            TriggerClientEvent('project:opencar', source, vehicle)
        end
    elseif sqlowner == igowner then
        TriggerClientEvent('project:opencar', source, vehicle)
    end

end)