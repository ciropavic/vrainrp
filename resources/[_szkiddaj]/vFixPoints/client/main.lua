local ESX;

local inVehicle;
local inMarker;
local repairPrice;

function handleServerResponse(result)
    if (result and DoesEntityExist(inVehicle)) then 
        local fuelLevel = GetVehicleFuelLevel(inVehicle);
        SetVehicleEngineHealth(inVehicle, 1000);
        SetVehicleEngineOn(inVehicle, true, true);
        SetVehicleDirtLevel(inVehicle, 0);
        SetVehicleFixed(inVehicle);
        SetVehicleFuelLevel(inVehicle, fuelLevel);

        TriggerEvent('patrik_notify:notify', {
            text = 'Sikeresen megszereltetted a járműved $' .. repairPrice .. '-ért.',
            type = "success",
            time = 3000, 
            layout = 'topCenter'
        });
    else 
        TriggerEvent('patrik_notify:notify', {
            text = 'Sikertelen szerelés.',
            type = "error",
            time = 3000, 
            layout = 'topCenter'
        });
    end 
end 

function onInteraction()
    if (not IsPedInAnyVehicle(PlayerPedId(), false)) then 
        inMarker = nil;
        inVehicle = nil;

        return;
    end 

    if (IsControlJustPressed(0, 38)) then 
        local repairTime = (repairPrice < Config.MaxRepairInterval) and repairPrice or Config.MaxRepairInterval; 
        local playerPed = GetPlayerPed(-1);

        exports.progressBars:startUI(repairTime, 'Jármű javítása..');

        DisableAllControlActions(0);
        DisableAllControlActions(1);
        FreezeEntityPosition(playerPed, true);
        FreezeEntityPosition(GetVehiclePedIsIn(playerPed, false), true);

        Wait(repairTime);

        EnableAllControlActions(0);
        EnableAllControlActions(1);
        FreezeEntityPosition(playerPed, false);
        FreezeEntityPosition(GetVehiclePedIsIn(playerPed, false), false);

        ESX.TriggerServerCallback('sFixPoints:fixVehicle', handleServerResponse, inVehicle, repairPrice);
    end 
end

AddEventHandler(Config.resource .. ':onMarkerHit', function(markerId, ped, isLocalPlayer, markerData)
    if (not inMarker and isLocalPlayer and IsPedInAnyVehicle(ped, false)) then 
        local vehicle = GetVehiclePedIsIn(ped, false);

        if (vehicle) then 
            repairPrice = calculateVehicleRepairPrice(vehicle);

            if (repairPrice and repairPrice > 0) then 
                repairPrice = math.ceil(repairPrice);
                inVehicle = vehicle;
                inMarker = markerData.index;

                exports.vInteraction:addInteraction("E", "Javítás megkezdése", onInteraction, { interval = 2000 });
            else 
                exports.vChat:outputChatBox("Ez a jármű nincs megtörve.", "error", "error");
            end 
        end 
    end 
end);

AddEventHandler(Config.resource .. ':onMarkerLeave', function(markerId, ped, isLocalPlayer, markerData)
    if (inMarker and isLocalPlayer) then 
        inVehicle = nil;
        inMarker = nil;
    end 
end);

Citizen.CreateThread(function()
    while (ESX == nil) do 
        TriggerEvent("esx:getSharedObject", function(obj) ESX = obj end);
        Wait(50);
    end
end);

function main()
    -- Init markers

    if (Config.points and #Config.points > 0) then 
        for i = 1, #Config.points do 
            local point = Config.points[i];
            
            local x, y, z = table.unpack(point.position);
            local type = (point.type ~= nil) and point.type or Config.DefaultType;
            local size = (point.size ~= nil) and point.size or Config.DefaultSize;
            local r, g, b, a = table.unpack( (point.color ~= nil) and point.color or Config.DefaultColor );

            TriggerEvent(
                Config.resource .. ':CreateMarker',
                'fixmarker_' .. i, 
                x, 
                y, 
                z - 1,
                type,
                size, 
                r, 
                g,
                b, 
                a, 
                { index = i }
            );
        end 
    end 
end 

main();

-- Utils

local partsPriceMultipliers = {
    engine = 0.00035,
    body = 0.00025,

    window = 0.0065,
    door = 0.025,
    tire = 0.01,
};

function calculateVehicleRepairPrice(vehicle)
    local calculatedPrice = 0;
    local vehiclePrice = exports.skvehicleshop:getVehiclePrice(GetEntityModel(vehicle));
    local vehicleDamages = getVehicleStatus(vehicle);

    if (not vehicleDamages or not vehiclePrice) then 
        return false;
    end 

    -- Add body health damage
    calculatedPrice = calculatedPrice + ( -(vehicleDamages.health - 1000.0) * (vehiclePrice * partsPriceMultipliers.engine) )

    -- Add body health damage
    calculatedPrice = calculatedPrice + ( -(vehicleDamages.bodyHealth - 1000.0) * (vehiclePrice * partsPriceMultipliers.body) )

    -- Add window damages
    calculatedPrice = calculatedPrice + ( #vehicleDamages.windows * (vehiclePrice * partsPriceMultipliers.window) );

    -- Add doors damages
    calculatedPrice = calculatedPrice + ( #vehicleDamages.doors * (vehiclePrice * partsPriceMultipliers.door) );

    -- Add tire damages
    calculatedPrice = calculatedPrice + ( #vehicleDamages.tires * (vehiclePrice * partsPriceMultipliers.tire) );

    return calculatedPrice;
end 

function getVehicleStatus(vehicle)
    if (
        not DoesEntityExist(vehicle) and 
        GetEntityType(vehicle) ~= 2
    ) then 
        return false;
    end 
 
    local status = {};

    status.health = GetVehicleEngineHealth(vehicle);
    status.bodyHealth = GetVehicleBodyHealth(vehicle);
    status.fuelLevel = GetVehicleFuelLevel(vehicle);

    status.windows = {};
    if (AreAllVehicleWindowsIntact(vehicle) == false) then 
        for id = 1, 13 do 
            local windowId = IsVehicleWindowIntact(vehicle, id);

            if (windowId == false) then
                table.insert(status.windows, windowId);
            end 
        end
    end 
    
    status.doors = {};
    for id = 1, 13 do 
        local doorId = IsVehicleDoorDamaged(vehicle, id);

        if (doorId) then
            table.insert(status.doors, doorId);
        end 
    end

    status.tires = {};
    for id = 1, 13 do 
        local tireId = IsVehicleTyreBurst(vehicle, id, false);

        if (tireId) then
            table.insert(status.tires, tireId);
        end 
    end

    return status;
end 
