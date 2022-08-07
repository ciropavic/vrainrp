local InGarage;
local PreviewVehicles;
local PreviewVehicleEntities;
local PreviewCamera;
local SpotIndex;
local IsControlsDisabled;
local VehicleCount;
local EnterPoint;
local LoadedIpls;

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
    while (InGarage) do 
        if (IsControlJustPressed(0, 174) and not IsControlsDisabled) then -- Left 
            local steppingNum = IsControlPressed(0, 21) and 3 or 1;
            local garage = SharedConfig.interiors.garage[Interiors[InGarage.id].interior];
            local transitionTime = 1250;

            if (garage?.points[SpotIndex - steppingNum] and PreviewVehicles[SpotIndex - steppingNum] ~= nil) then 
                SpotIndex -= steppingNum;
            else 
                transitionTime = 3000;
                SpotIndex = VehicleCount;
            end 

            local camPos = GetOffsetFromEntityInWorldCoords(
                PreviewVehicles[SpotIndex], 
                garage.points[SpotIndex].camera.offset.x, 
                garage.points[SpotIndex].camera.offset.y, 
                garage.points[SpotIndex].camera.offset.z
            ); 

            local newCamera = CreateCam('DEFAULT_SCRIPTED_CAMERA', true);
            SetCamCoord(newCamera, camPos);
            PointCamAtEntity(newCamera, PreviewVehicles[SpotIndex], 0.0, 0.0, 0.0, true);
            SetCamActiveWithInterp(newCamera, PreviewCamera, transitionTime, 1, 3, 1);

            local previousCamera = PreviewCamera;
            PreviewCamera = newCamera;
            
            Wait(transitionTime * 1.15);

            if (previousCamera and DoesCamExist(previousCamera)) then 
                DestroyCam(previousCamera);
                previousCamera = nil;
            end 
        elseif (IsControlJustPressed(0, 175) and not IsControlsDisabled) then -- Right
            local steppingNum = IsControlPressed(0, 21) and 3 or 1;
            local garage = SharedConfig.interiors.garage[Interiors[InGarage.id].interior];
            local transitionTime = 1250;

            if (garage?.points[SpotIndex + steppingNum] and PreviewVehicles[SpotIndex + steppingNum] ~= nil) then 
                SpotIndex += steppingNum;
            else 
                transitionTime = 3000;
                SpotIndex = steppingNum;
            end 

            local camPos = GetOffsetFromEntityInWorldCoords(
                PreviewVehicles[SpotIndex], 
                garage.points[SpotIndex].camera.offset.x, 
                garage.points[SpotIndex].camera.offset.y, 
                garage.points[SpotIndex].camera.offset.z
            ); 
    
            local newCamera = CreateCam('DEFAULT_SCRIPTED_CAMERA', true);
            SetCamCoord(newCamera, camPos);
            PointCamAtEntity(newCamera, PreviewVehicles[SpotIndex], 0.0, 0.0, 0.0, true);
            SetCamActiveWithInterp(newCamera, PreviewCamera, transitionTime, 1, 3, 1);
    
            local previousCamera = PreviewCamera;
            PreviewCamera = newCamera;
    
            Wait(transitionTime * 1.15);
    
            if (previousCamera and DoesCamExist(previousCamera)) then 
                DestroyCam(previousCamera);
                previousCamera = nil;
            end 
        elseif (IsControlJustPressed(0, 191) and not IsControlsDisabled) then -- Enter
            IsControlsDisabled = true;

            local vehicleProps = GetVehicleProperties(PreviewVehicles[SpotIndex]);
            local hasResponse = false;
            local keepControlsDisabled = false;
            local waited = 0;

            local gameVehicles = ESX.Game.GetVehicles();
            for i = 1, #gameVehicles do
                local vehicleEnt = gameVehicles[i];

                if (DoesEntityExist(vehicleEnt)) then
                    if (
                        SharedConfig.Trim(GetVehicleNumberPlateText(vehicleEnt)) == SharedConfig.Trim(vehicleProps.plate) and 
                        not PreviewVehicleEntities[vehicleEnt]
                    ) then
                        ESX.ShowNotification("This vehicle is on the streets, you can't take out 2 of the same vehicles.");
                        return;
                    end
                end
            end

            exports.vCore:useFetchAsync("vProperty::takeOutVehicle", function(success, error)
                if (success) then 
                    hasResponse = true;

                    DoScreenFadeOut(1500);
                    Wait(1550);
        
                    if (PreviewCamera and DoesCamExist(PreviewCamera)) then 
                        DestroyCam(PreviewCamera);
                        PreviewCamera = nil;
                    end 
        
                    if (PreviewVehicles) then 
                        for index, vehicle in pairs(PreviewVehicles) do 
                            if (DoesEntityExist(vehicle)) then 
                                DeleteVehicle(vehicle);
                            end
                        end
                    
                        PreviewVehicles = nil;
                    end 
        
                    Wait(500);
        
                    RenderScriptCams(false, false, 0, false, false);
                    SetEntityCoords(PlayerPedId(), EnterPoint, 0.0, 0.0, 0.0, false);
                    FreezeEntityPosition(PlayerPedId(), false);
                
                    InGarage = false;
        
                    for _, ipl in ipairs(LoadedIpls) do RemoveIpl(ipl); end 
        
                    if (not IsModelInCdimage(vehicleProps.model) or not IsModelAVehicle(vehicleProps.model)) then 
                        return;
                    end
                
                    RequestModel(vehicleProps.model);
                    while (not HasModelLoaded(vehicleProps.model)) do 
                        Wait(500);
                    end
                    
                    ESX.Game.SpawnVehicle(vehicleProps.model, EnterPoint, 0.0, function(vehicle)
                        SetVehicleProperties(vehicle, vehicleProps);
                        NetworkFadeInEntity(vehicle, true, true);
                        SetModelAsNoLongerNeeded(vehicleProps.model);
                        TaskWarpPedIntoVehicle(PlayerPedId(), vehicle, -1);
                        SetEntityAsMissionEntity(vehicle, true, true);

                        DoScreenFadeIn(500);
                        DisplayRadar(true);
                        TriggerEvent("ui:toogleUi", false);
                        exports.vChat:updateSetting("visible", true);
                        exports.vHud:setState(true);
                    end);
                else 
                    print(error);
                    hasResponse = true;
                    keepControlsDisabled = false;
                end 
            end, vehicleProps.plate);

            while (waited > 15 and not hasResponse) do 
                waited += 1;
                Wait(1000);
            end 

            if (not hasResponse and not keepControlsDisabled) then 
                IsControlsDisabled = false;
            end 
        elseif (IsControlJustPressed(0, 200) and not IsControlsDisabled) then  -- Escape
            IsControlsDisabled = true;

            DoScreenFadeOut(1500);
            Wait(1550);

            if (PreviewCamera and DoesCamExist(PreviewCamera)) then 
                DestroyCam(PreviewCamera);
                PreviewCamera = nil;
            end 

            if (PreviewVehicles) then 
                for index, vehicle in pairs(PreviewVehicles) do 
                    if (DoesEntityExist(vehicle)) then 
                        DeleteVehicle(vehicle);
                    end
                end
            
                PreviewVehicles = nil;
            end 

            RenderScriptCams(false, false, 0, false, false);
            SetEntityCoords(PlayerPedId(), EnterPoint, 0.0, 0.0, 0.0, false);
            FreezeEntityPosition(PlayerPedId(), false);
        
            DoScreenFadeIn(500);
            DisplayRadar(true);
            TriggerEvent("ui:toogleUi", false);
            exports.vChat:updateSetting("visible", true);
            exports.vHud:setState(true);
            InGarage = false;

            for _, ipl in ipairs(LoadedIpls) do RemoveIpl(ipl); end 
        end

        Wait(0);
    end 
end 

local function onGarageEnter(success, errorOrData)
    if (not success) then 
        return;
    end 

    local vehicles = errorOrData;

    EnterPoint = GetEntityCoords(PlayerPedId());
    IsControlsDisabled = false;
    PreviewCamera = nil;
    PreviewVehicles = {};
    PreviewVehicleEntities = {};
    LoadedIpls = {};
    SpotIndex = 1;
    VehicleCount = 0;

    TriggerEvent("ui:toogleUi", true);
    exports.vChat:updateSetting("visible", false);
    exports.vHud:setState(false);
    DisplayRadar(false);
    
    SendNUIMessage({ action = "LEAVE", payload = nil });

    DoScreenFadeOut(1500);
    Wait(1550);

    print("asd1")
    
    local garage = SharedConfig.interiors.garage[Interiors[InGarage.id].interior];
    
    if (garage.ipls and #garage.ipls > 0) then 
        for _, ipl in ipairs(garage.ipls) do 
            RequestIpl(ipl);
            table.insert(LoadedIpls, ipl);
        end 
    end 
    
    print("asd2")
    SetEntityCoords(PlayerPedId(), garage.playerTo, 0.0, 0.0, 0.0, false);
    FreezeEntityPosition(PlayerPedId(), true);
    
    for i = 1, #garage.points do 
        if (not vehicles[i]) then 
            break;
        end 
        
        local spot = garage.points[i];
        local vehicle = vehicles[i];
        
        print("asd3", vehicle.plate)
        if (not IsModelInCdimage(vehicle.props.model) or not IsModelAVehicle(vehicle.props.model)) then 
            print('segicseg')
            return;
        end
        
        RequestModel(vehicle.props.model);
        while (not HasModelLoaded(vehicle.props.model)) do 
            print(vehicle.plate .. " nem tolt beeeeeeeee")
            Wait(10);
        end
        
        print("asd4", vehicle.plate)
        ESX.Game.SpawnLocalVehicle(
            vehicle.props.model, 
            spot.vehicle.position, 
            spot.vehicle.heading, 
            function(vehicleEntity)
                PreviewVehicles[i] = vehicleEntity;
                PreviewVehicleEntities[vehicleEntity] = true;
                VehicleCount += 1;
                print("asd5", PreviewVehicles[i])
                
                SetVehicleOnGroundProperly(PreviewVehicles[i]);
                SetVehicleProperties(PreviewVehicles[i], vehicle.props);
                SetModelAsNoLongerNeeded(vehicle.props.model);
                FreezeEntityPosition(PreviewVehicles[i], true);
            end
        );
    end 
    
    while (PreviewVehicles[1] == nil) do 
        Wait(10);
    end 
    
    print("asd7")
    exports.vCore:iprint(PreviewVehicles);

    local camPos = GetOffsetFromEntityInWorldCoords(
        PreviewVehicles[SpotIndex], 
        garage.points[SpotIndex].camera.offset.x, 
        garage.points[SpotIndex].camera.offset.y, 
        garage.points[SpotIndex].camera.offset.z
    ); 

    PreviewCamera = CreateCam('DEFAULT_SCRIPTED_CAMERA', true);
    SetCamCoord(PreviewCamera, camPos);
    PointCamAtEntity(PreviewCamera, PreviewVehicles[1], 0.0, 0.0, 0.0, true);
    SetCamActive(PreviewCamera, true);
    RenderScriptCams(true, false, 0, false, false);

    Wait(250);
    DoScreenFadeIn(500);

    Citizen.CreateThread(handleGarageKeyControls);
end 

local function onDespawnVehicle(result, errorCode)
    print("VETLE?", errorCode)
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

    InGarage = false;
end

local function onPreGarageEnter(interior)
    if (InGarage) then 
        return;
    end 

    InGarage = interior;

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