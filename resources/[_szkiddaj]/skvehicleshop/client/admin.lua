RegisterNetEvent('skVehicleShop:adminMakeVehicle');
AddEventHandler('skVehicleShop:adminMakeVehicle', function(vehicleName)
    if (not IsModelInCdimage(vehicleName) or not IsModelAVehicle(vehicleName)) then 
        ESX.ShowNotification('Érvénytelen jármű model.');
        return;
    end 

    local coords = GetEntityCoords(GetPlayerPed(-1));
    local heading = GetEntityHeading(GetPlayerPed(-1));

    ESX.Game.SpawnVehicle(vehicleName, coords, heading, function(vehicle)
        local newPlate = GeneratePlate();
        local vehicleProps = ESX.Game.GetVehicleProperties(vehicle);

        vehicleProps.plate = newPlate;

        SetVehicleNumberPlateText(vehicle, newPlate);
        TriggerServerEvent('skVehicleshop:setAdminVehicleOwned', vehicleProps);
        SetVehicleColours(vehicle, previewVehicleColor, previewVehicleColor);
        SetVehicleDirtLevel(vehicle, 0);

        ESX.Game.SetVehicleProperties(vehicle, {
            pearlescentColor = 0,
        });
    end);
end);

RegisterNetEvent('skVehicleShop:deleteVehiclePermanent');
AddEventHandler('skVehicleShop:deleteVehiclePermanent', function()
    local playerPed = GetPlayerPed(-1);
    if (not IsPedInAnyVehicle(playerPed, false)) then 
        return;
    end 

    local vehicle = GetVehiclePedIsIn(playerPed, lastVehicle)

    local props = ESX.Game.GetVehicleProperties(vehicle);
    if (not props) then 
        return;
    end 

    ESX.Game.DeleteVehicle(vehicle);
    TriggerServerEvent('skVehicleShop:deleteVehiclePermanent', props);
end);

RegisterNetEvent('skVehicleShop:setVehicleToJob');
AddEventHandler('skVehicleShop:setVehicleToJob', function()
    local playerPed = GetPlayerPed(-1);
    if (not IsPedInAnyVehicle(playerPed, false)) then 
        return;
    end 

    local vehicle = GetVehiclePedIsIn(playerPed, lastVehicle)

    local props = ESX.Game.GetVehicleProperties(vehicle);
    if (not props) then 
        return;
    end 

    TriggerServerEvent('skVehicleshop:setVehicleToJob', props);
end);
