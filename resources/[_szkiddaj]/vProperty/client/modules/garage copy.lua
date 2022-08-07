local inGarage;
local PreviewVehicles;
local PreviewCamera;
local SpotIndex;

local function GetVehicleProperties(vehicle)
    if DoesEntityExist(vehicle) then
        local vehicleProps = ESX.Game.GetVehicleProperties(vehicle);

        vehicleProps["tyres"] = {};
        vehicleProps["windows"] = {};
        vehicleProps["doors"] = {};

        for id = 1, 7 do
            local tyreId = IsVehicleTyreBurst(vehicle, id, false);
        
            if tyreId then
                vehicleProps["tyres"][#vehicleProps["tyres"] + 1] = tyreId;
        
                if tyreId == false then
                    tyreId = IsVehicleTyreBurst(vehicle, id, true);
                    vehicleProps["tyres"][ #vehicleProps["tyres"]] = tyreId;
                end
            else
                vehicleProps["tyres"][#vehicleProps["tyres"] + 1] = false;
            end
        end

        for id = 1, 13 do
            local windowId = IsVehicleWindowIntact(vehicle, id);

            if windowId ~= nil then
                vehicleProps["windows"][#vehicleProps["windows"] + 1] = windowId;
            else
                vehicleProps["windows"][#vehicleProps["windows"] + 1] = true;
            end
        end
        
        for id = 0, 5 do
            local doorId = IsVehicleDoorDamaged(vehicle, id);
        
            if doorId then
                vehicleProps["doors"][#vehicleProps["doors"] + 1] = doorId;
            else
                vehicleProps["doors"][#vehicleProps["doors"] + 1] = false;
            end
        end

        vehicleProps["engineHealth"] = GetVehicleEngineHealth(vehicle);
        vehicleProps["bodyHealth"] = GetVehicleBodyHealth(vehicle);
        vehicleProps["fuelLevel"] = GetVehicleFuelLevel(vehicle);

        return vehicleProps;
    end
end 

local function SetVehicleProperties(vehicle, vehicleProps)
    ESX.Game.SetVehicleProperties(vehicle, vehicleProps);

    SetVehicleEngineHealth(vehicle, vehicleProps.engineHealth and vehicleProps.engineHealth + 0.0 or 1000.0);
    SetVehicleBodyHealth(vehicle, vehicleProps.bodyHealth and vehicleProps.bodyHealth + 0.0 or 1000.0);
    SetVehicleFuelLevel(vehicle, vehicleProps.fuelLevel and vehicleProps.fuelLevel + 0.0 or 1000.0);

    if vehicleProps.windows then
        for windowId = 1, 13, 1 do
            if (vehicleProps.windows[windowId] == false) then
                SmashVehicleWindow(vehicle, windowId)
            end
        end
    end

    if vehicleProps.tyres then
        for tyreId = 1, 7, 1 do
            if (vehicleProps.tyres[tyreId] ~= false) then
                SetVehicleTyreBurst(vehicle, tyreId, true, 1000)
            end
        end
    end

    if vehicleProps.doors then
        for doorId = 0, 5, 1 do
            if (vehicleProps.doors[doorId] ~= false) then
                SetVehicleDoorBroken(vehicle, doorId - 1, true)
            end
        end
    end
end

local function handleGarageKeyControls()
    while (inGarage ~= nil) do 
        if (IsControlJustPressed(0, 174)) then -- Left 
            local garage = SharedConfig.interiors.garage[Interiors[inGarage.id].interior];

            if (garage?.points[SpotIndex - 1] and PreviewVehicles[SpotIndex - 1] ~= nil) then 
                SetCamActiveWithInterp(PreviewCamera[SpotIndex - 1], PreviewCamera[SpotIndex], 2000, 1, 3, 1);
                SpotIndex -= 1;
            end 
        elseif (IsControlJustPressed(0, 175)) then -- Right
            local garage = SharedConfig.interiors.garage[Interiors[inGarage.id].interior];

            print("CUCC", SpotIndex, garage?.points[SpotIndex + 1], PreviewVehicles[SpotIndex + 1], PreviewCamera[SpotIndex + 1])

            if (garage?.points[SpotIndex + 1] and PreviewVehicles[SpotIndex + 1] ~= nil) then 
                SetCamActiveWithInterp(PreviewCamera[SpotIndex + 1], PreviewCamera[SpotIndex], 2000, 1, 3, 1);
                SpotIndex += 1;
            end 
        end

        Wait(0);
    end 
end 

local function onGarageEnter(success, errorOrData)
    if (not success) then 
        print('meghal', errorOrData);
        return;
    end 

    local vehicles = errorOrData;

    PreviewCamera = nil;
    PreviewVehicles = {};
    PreviewCamera = {};
    SpotIndex = 1;

    SendNUIMessage({ action = "LEAVE", payload = nil });
    DoScreenFadeOut(1500);

    local garage = SharedConfig.interiors.garage[Interiors[inGarage.id].interior];
    for i = 1, #garage.points do 
        if (not vehicles[i]) then 
            break;
        end 

        local spot = garage.points[i];
        local vehicle = vehicles[i];
    
        if (not IsModelInCdimage(vehicle.props.model) or not IsModelAVehicle(vehicle.props.model)) then 
            print('segicseg')
            return;
        end
        
        RequestModel(vehicle.props.model);
        while (not HasModelLoaded(vehicle.props.model)) do 
            Wait(500);
        end

        ESX.Game.SpawnLocalVehicle(
            vehicle.props.model, 
            spot.vehicle.position, 
            spot.vehicle.heading, 
            function(vehicleEntity)
                PreviewVehicles[i] = vehicleEntity;

                SetVehicleOnGroundProperly(PreviewVehicles[i]);
                SetVehicleProperties(PreviewVehicles[i], vehicle.props);
                SetModelAsNoLongerNeeded(vehicle.props.model);
                FreezeEntityPosition(PreviewVehicles[i], true);

                local camPos = GetOffsetFromEntityInWorldCoords(
                    PreviewVehicles[i], 
                    garage.points[i].camera.offset.x, 
                    garage.points[i].camera.offset.y, 
                    garage.points[i].camera.offset.z
                ); 
            
                PreviewCamera[i] = CreateCam('DEFAULT_SCRIPTED_CAMERA', true);
                SetCamCoord(PreviewCamera[i], camPos);
                PointCamAtEntity(PreviewCamera[i], PreviewVehicles[i], 0.0, 0.0, 0.0, true);
            end
        );
    end 

    Wait(1000);
    if (not PreviewVehicles[1]) then 
        return;
    end 

    SetCamActive(PreviewCamera[1], true);
    RenderScriptCams(true, false, 0, false, false);

    Wait(2000);
    DoScreenFadeIn(500);

    Citizen.CreateThread(handleGarageKeyControls);
end 

local function despawnVehicle(result, errorCode)
    local vehicle = GetVehiclePedIsUsing(PlayerPedId());
    if (result) then 
        TaskLeaveVehicle(PlayerPedId(), vehicle, 0);

        while (IsPedInVehicle(PlayerPedId(), vehicle, false)) do
            TaskLeaveVehicle(PlayerPedId(), vehicle, 0);
            Wait(0);
        end

        Wait(500);
        NetworkFadeOutEntity(vehicle, true, true);
        Wait(100);
        ESX.Game.DeleteVehicle(vehicle);

        TriggerEvent(
            "vrain_notify:showNotification", 
            SharedConfig.labels['vehicle_parked'], 
            "success", 
            3000
        );
    else        
        exports.vCore:iprint(errorCode);
        TriggerEvent(
            "vrain_notify:showNotification", 
            (errorCode and SharedConfig.labels[errorCode]) 
                    and SharedConfig.labels[errorCode]
                    or "Ismeretlen hiba.",
            "error", 
            3000
        );
    end 

    inGarage = false;
end

local function onPreGarageEnter(interior)
    if (inGarage) then 
        return;
    end 

    inGarage = interior;

    local vehicle = GetVehiclePedIsUsing(PlayerPedId());
    if (not vehicle or vehicle == 0) then 
        exports.vCore:useFetchAsync('sProperty:enter', onGarageEnter, interior.id, interior.type, 'spawn');
    else 
        local props = GetVehicleProperties(vehicle);
        exports.vCore:useFetchAsync('sProperty:enter', onDespawnVehicle, interior.id, interior.type, 'despawn', props);
    end 
end 

AddEventHandler("onResourceStop", function(resourceName)
    if (resourceName == GetCurrentResourceName()) then 
        DoScreenFadeIn(500);

        if (PreviewVehicles) then 
            for index, vehicle in pairs(PreviewVehicles) do 
                if (DoesEntityExist(vehicle)) then 
                    DeleteVehicle(vehicle);
                end
            end

            PreviewVehicles = nil;
        end 
    end 
end);

MarkerHandlers.enter.garage = onPreGarageEnter;

RequestIpl("vw_casino_carpark");
RequestIpl("vw_casino_garage");