ESX = nil;

local inMarker;

local previewCamera, previewVehicle;
local isVehicleLoaded = true;

function openGarage()
    if (inMarker and Config.points[inMarker]) then 
        isVehicleLoaded = false;

        ESX.TriggerServerCallback('sGarage:fetchPlayerVehicles', function(success, response)
            if (not success) then 
                return exports.vChat:outputChatBox(response, "error", "error");
            end 

            local vehicles = response;
            local garage = Config.points[inMarker];

            if (#vehicles < 1) then 
                return exports.vChat:outputChatBox(Config.labels.no_vehicle_parked_here, "error", "error");
            end 

            FreezeEntityPosition(GetPlayerPed(-1), true);

            -- build menu

            local elements = {};

            for i,v in ipairs(vehicles) do 
                local vehicleName = GetLabelText( GetDisplayNameFromVehicleModel( v.props.model ) );
                local plate = v.plate;

                if (vehicleName == 'NULL') then 
                    vehicleName = exports.skvehicleshop:getVehicleName(v.props.model);
                end 

                if (not vehicleName or vehicleName == 'NULL') then 
                    vehicleName = 'Ismeretlen';
                end 

                table.insert(elements, {
                    label = vehicleName .. ' ('..plate..')',
                    vehicle = v
                });
            end

            ESX.UI.Menu.CloseAll();
            ESX.UI.Menu.Open(
                'default', 
                Config.resource, 
                "sgarage_menu",
                {
                    title = 'Garázs - ' .. garage.name, 
                    align = 'right',
                    elements = elements,
                }, 
                function(data, menu)
                    ESX.TriggerServerCallback('sGarage:takeOutVehicle', function(success, result)
                        if (success) then 
                            spawnVehicle(data.current.vehicle.props);
                        else 
                            exports.vChat:outputChatBox(
                                string.format(
                                    (type(result) == "string") and Config.labels[result] or Config.labels[result.code], 
                                    (type(result) == "string") and nil or table.unpack(result.data or { })
                                ), 
                                "error", 
                                "error"
                            );

                            FreezeEntityPosition(GetPlayerPed(-1), false);
                            closeGarageMenu();
                        end 
                    end, data.current.vehicle.props);

                    closeGarageMenu();
                    menu.close();
                end, 
                function(data, menu)
                    if (not isVehicleLoaded) then 
                        return false;
                    end

                    menu.close();
                    FreezeEntityPosition(GetPlayerPed(-1), false);
                    closeGarageMenu();
                end,
                function(data, menu)
                    if (isVehicleLoaded) then 
                        isVehicleLoaded = false;
                        spawnPreviewVehicle(data.current.vehicle.plate, data.current.vehicle.props);
                    end 
                end
            );

            spawnPreviewVehicle(elements[1].vehicle.plate, elements[1].vehicle.props);

            -- Camera and other shits

            RenderScriptCams(false, false, 0, false, false);

            if (previewCamera and DoesCamExist(previewCamera)) then 
                DestroyCam(previewCamera);
                previewCamera = nil;
            end 

            if (previewVehicle and DoesEntityExist(previewVehicle)) then 
                DeleteVehicle(previewVehicle);
                previewVehicle = nil;
            end 

            previewCamera = CreateCam('DEFAULT_SCRIPTED_CAMERA', true);
            SetCamCoord(previewCamera, garage.preview.camera.position);

            while (previewVehicle == nil) do 
                Wait(100);
            end 

            PointCamAtEntity(previewCamera, previewVehicle, 0.0, 0.0, 0.0, true);
            SetCamActive(previewCamera, true);
            RenderScriptCams(true, true, 750, true, true);
        end, inMarker);
    end  
end 

function spawnVehicle(props)
    if (not inMarker and not Config.points[inMarker]) then 
        return;
    end 

    local garage = Config.points[inMarker];

    if (not IsModelInCdimage(props.model) or not IsModelAVehicle(props.model)) then 
        return;
    end

    RequestModel(props.model);
    while (not HasModelLoaded(props.model)) do 
        Wait(500);
    end
	
	local gameVehicles = ESX.Game.GetVehicles()

	for i = 1, #gameVehicles do
		local vehicle = gameVehicles[i];

        if (DoesEntityExist(vehicle)) then
			if (Config.Trim(GetVehicleNumberPlateText(vehicle)) == Config.Trim(props.plate) and vehicle ~= previewVehicle) then
                FreezeEntityPosition(PlayerPedId(), false);
                exports.vChat:outputChatBox(Config.labels.vehicle_already_exists, "error", "error");
                return;
			end
		end
	end

    local checkedSpawnPointsCount = 0;
    local checkedSpawnPoints = {};
    local targetSpawnPoint = nil;

    while (true) do
        local spawnPointIndex = math.random(1, #garage.spawns);
        local spawnPoint = garage.spawns[spawnPointIndex];

        if (checkedSpawnPointsCount >= #garage.spawns) then 
            break;
        end 

        if (not checkedSpawnPoints[spawnPointIndex]) then 
            if (ESX.Game.IsSpawnPointClear(spawnPoint.position, 5.0)) then
                targetSpawnPoint = spawnPoint;
                break;
            else 
                checkedSpawnPoints[spawnPointIndex] = true;
            end 
        end 
        
        Wait(100);
    end 

    if (targetSpawnPoint == nil) then 
        exports.vChat:outputChatBox(Config.labels.no_free_parking_space, "error", "error");
        return;
    end 
    
    ESX.Game.SpawnVehicle(props.model, targetSpawnPoint.position, targetSpawnPoint.heading, function(vehicle)
		SetVehicleProperties(vehicle, props);
        NetworkFadeInEntity(vehicle, true, true);
		SetModelAsNoLongerNeeded(props.model);
		TaskWarpPedIntoVehicle(PlayerPedId(), vehicle, -1);
        SetEntityAsMissionEntity(vehicle, true, true);
        FreezeEntityPosition(GetPlayerPed(-1), false);
        exports.vChat:outputChatBox(Config.labels.vehicle_taken_out, "success", "success");
        closeGarageMenu();
	end);
end 

function spawnPreviewVehicle(plate, props)
    if (inMarker and Config.points[inMarker]) then 
        local garage = Config.points[inMarker];

        if (previewVehicle and DoesEntityExist(previewVehicle)) then 
            DeleteVehicle(previewVehicle);
            previewVehicle = nil;
        end 

        if (not IsModelInCdimage(props.model) or not IsModelAVehicle(props.model)) then 
            return;
        end
    
        RequestModel(props.model);
        while (not HasModelLoaded(props.model)) do 
            Wait(500);
        end
        
        ESX.Game.SpawnLocalVehicle(
            props.model, 
            garage.preview.vehicle.position, 
            garage.preview.vehicle.heading, 
            function(vehicle)
                if (previewVehicle and DoesEntityExist(previewVehicle)) then 
                    DeleteVehicle(previewVehicle);
                    previewVehicle = nil;
                end 

                previewVehicle = vehicle;
                isVehicleLoaded = true;
                SetVehicleProperties(vehicle, props);
                SetModelAsNoLongerNeeded(props.model);
                FreezeEntityPosition(vehicle, true);
            end
        );
    end 
end 

function closeGarageMenu()
    if (previewCamera and DoesCamExist(previewCamera)) then 
        DestroyCam(previewCamera);
        previewCamera = nil;
    end 

    if (previewVehicle and DoesEntityExist(previewVehicle)) then 
        DeleteVehicle(previewVehicle);
        previewVehicle = nil;
    end

    RenderScriptCams(false, true, 750, true, false);
end 

-- Marker init, hitdetection 

AddEventHandler("onClientEntityMarkerEnter", function(marker, entity)
    local garageId = marker.getMeta("garageId");
    local garageType = marker.getMeta("garageType");

    print("MIEZ1")
    
    if (
        entity.isLocalPlayer() and 
        garageId and 
        Config.points[garageId] and
        garageType
    ) then 
        if (garageType == "spawn") then 
            inMarker = garageId;
            inMarkerType = garageType;
            
            exports.vInteraction:addInteraction(
                "E", 
                string.format(
                    (Config.labels and Config.labels.open_garage) and Config.labels.open_garage or 'Valasz jarmuvet.',
                    Config.points[inMarker].name
                ), 
                function(key) 
                    openGarage();
                end
            );
        elseif (garageType == "despawn") then 
            inMarker = garageId;
            inMarkerType = garageType;

            exports.vInteraction:addInteraction(
                "E", 
                string.format(
                    (Config.labels and Config.labels.put_vehicle) and Config.labels.put_vehicle or 'Valasz jarmuvet.',
                    Config.points[inMarker].name
                ),
                function(key) 
                    local vehicle = GetVehiclePedIsUsing(PlayerPedId());
                    if (vehicle and DoesEntityExist(vehicle) and GetPedInVehicleSeat(vehicle, -1) == PlayerPedId()) then 
                        print("vissza2")
                        local props = GetVehicleProperties(vehicle);
                        ESX.TriggerServerCallback('sGarage:putVehicleInGarage', function(success, result)
                            print("vissza3")
                            if (success) then
                                print("vissza4")
                                TaskLeaveVehicle(PlayerPedId(), vehicle, 0);
                                while (IsPedInVehicle(PlayerPedId(), vehicle, false)) do
                                    TaskLeaveVehicle(PlayerPedId(), vehicle, 0);
                                    Wait(0);
                                end
                                
                                Wait(500);
                                NetworkFadeOutEntity(vehicle, true, true);
                                Wait(100);
                                ESX.Game.DeleteVehicle(vehicle);
                                exports.vChat:outputChatBox(Config.labels.parked_vehicle, "success", "success");
                            else 
                                print("vissza5")
                                exports.vChat:outputChatBox(
                                    string.format(
                                        (type(result) == "string") and Config.labels[result] or Config.labels[result.code], 
                                        (type(result) == "string") and nil or table.unpack(result.data or { })
                                    ), 
                                    "error", 
                                    "error"
                                );
                            end 
                        end, props, inMarker);
                    end 
                end
            );
        end 
    end 
end);

AddEventHandler("onClientEntityMarkerLeave", function(marker, entity)
    if (
        entity.isLocalPlayer() and 
        inMarker ~= nil
    ) then 
        inMarker = nil;
        exports.vInteraction:removeInteraction("E");
    end 
end);

Citizen.CreateThread(function()
    while (ESX == nil) do 
        TriggerEvent("esx:getSharedObject", function(lib) 
			ESX = lib;
		end);

        Wait(100);
    end 

    if (Config and Config.points) then 
        for i,v in ipairs(Config.points) do 
            if (v.blip) then 
                local x, y, z = table.unpack(v.marker.position);

                local zoneBlip = AddBlipForRadius(x + 0.0, y + 0.0, z + 0.0, v.zone_size and v.zone_size + 0.0 or 80.0);
                SetBlipColour(zoneBlip, 2);
                SetBlipAlpha(zoneBlip, 128);

                local blip = AddBlipForCoord(x, y, z);
                SetBlipSprite(blip, v.blip.icon or 52);
                SetBlipScale(blip, 1.0);
                SetBlipColour(blip, 2);
                SetBlipAsShortRange(blip, true);
    
                if (v.color) then 
                    SetBlipAsFriendly(blip, true);
                    SetBlipColour(blip, v.blip.color or 0);
                end
    
                BeginTextCommandSetBlipName('STRING');
                AddTextComponentString((v.name .. ' garázs') or 'Nyilvános garázs');
                EndTextCommandSetBlipName(blip);
            end
        end 
    end 
end);

-- Utils

function GetVehicleProperties(vehicle)
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

function SetVehicleProperties(vehicle, vehicleProps)
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