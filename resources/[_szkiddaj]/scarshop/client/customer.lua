--

function handleVehicleBuyResponse(response, errorMsg)
    if (response) then 
        SendNUIMessage({
            action = 'close'
        });

        ESX.Game.SpawnVehicle(response.model, Carshops[CarshopIndex].spawn.position, Carshops[CarshopIndex].spawn.heading, function(vehicle)
            TaskWarpPedIntoVehicle(GetPlayerPed(-1), vehicle, -1);

            local newPlate = GeneratePlate();
            local vehicleProps = ESX.Game.GetVehicleProperties(vehicle);
            vehicleProps.plate = newPlate;
            SetVehicleNumberPlateText(vehicle, newPlate);
            SetVehicleColours(vehicle, previewVehicleColor, previewVehicleColor);
            SetVehicleCustomPrimaryColour(vehicle, table.unpack(response.color));
            SetVehicleDirtLevel(vehicle, 0);
            ESX.Game.SetVehicleProperties(vehicle, {
                pearlescentColor = 0,
            });
            TriggerServerEvent('scarshop:setVehicleOwned', vehicleProps);
        end);
    else
        TriggerEvent('patrik_notify:notify', {
            text = (errorMsg) and errorMsg or 'Ismeretlen hiba.',
            type = "error",
            time = 3000, 
            layout = 'topCenter'
        });
    end
end 

RegisterNUICallback('buyvehicle', function(data)
    if (data and data.model and data.color) then
        ESX.TriggerServerCallback('sCarshop:buyVehicle', handleVehicleBuyResponse, CarshopIndex, data.model, data.color);
    end 
end);
