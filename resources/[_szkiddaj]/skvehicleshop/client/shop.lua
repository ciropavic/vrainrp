local previewVehicle;
local previewVehicleColor;
local previewCamera;
local previewCameraIndex;
local loadingVehicle;

function openShop(id)
    local response = exports.vCore:useFetch("skVehicleshop:getShopVehicles", id);

    local data = json.decode(response);
    if (not data[1] or not data[1].model) then 
        return;
    end 

    DisplayRadar(false);
    exports.vHud:setState(false);
    exports.vChat:updateSetting("visible", false);

    local vehName = data[1].model;
    if (not IsModelInCdimage(vehName) or not IsModelAVehicle(vehName)) then 
        return;
    end

    RequestModel(vehName);
    while (not HasModelLoaded(vehName)) do 
        Wait(500);
    end

    local pos = config.shops[id].preview.car;
    previewVehicle = CreateVehicle(vehName, pos[1], pos[2], pos[3], config.shops[id].preview.heading, false, false);
    SetVehicleColours(previewVehicle, 112, 112);
    SetVehicleDirtLevel(previewVehicle, 0);
    ESX.Game.SetVehicleProperties(previewVehicle, {
        pearlescentColor = 0,
    });

    -- Kamera összerakás
    previewCameraIndex = 1;
    local cameras = config.shops[id].preview.cameras;
    if (not DoesCamExist(previewCamera)) then 
        previewCamera = CreateCam('DEFAULT_SCRIPTED_CAMERA', true);
    end

    SetCamActive(previewCamera, true);
    RenderScriptCams(true, true, 500, true, true);
    SetCamFov(previewCamera, 72.5);
    SetCamCoord(previewCamera, cameras[previewCameraIndex]);
    PointCamAtEntity(previewCamera, previewVehicle, 0.0, 0.0, 0.0, true);

    for i,v in ipairs(data) do 
        v.name = (config.carNames[v.model] or GetLabelText(GetDisplayNameFromVehicleModel(v.model))) or 'Ismeretlen';
    end

    SendNUIMessage({
        panel = 'shop',
        display = true,
        func = 'load',
        data = json.encode(data),
        cameraCount = #config.shops[id].preview.cameras,
    });

    SetNuiFocus(true, true);
    TriggerEvent('shud:toggle', false);
end 

AddEventHandler("onClientEntityMarkerEnter", function(marker, entity)
    local carshopId = marker.getMeta("carshopId");
    local carshopIsBoss = marker.getMeta("carshopIsBoss");

    if (
        entity.isLocalPlayer() and 
        carshopId and 
        not carshopIsBoss and 
        config.shops[carshopId]
    ) then 
        local id = carshopId;
        shopId = carshopId;

        exports.vInteraction:addInteraction("E", "Járműbolt megnyitása", function() openShop(id); end, { interval = 1000 });
    end 
end);

AddEventHandler("onClientEntityMarkerLeave", function(marker, entity)
    local carshopId = marker.getMeta("carshopId");
    local carshopIsBoss = marker.getMeta("carshopIsBoss");

    if (
        entity.isLocalPlayer() and 
        shopId ~= nil
    ) then 
        shopId = nil;
        exports.vInteraction:removeInteraction("E");
    end 
end);

RegisterNUICallback('close', function(data)
    if (data.panel == 'shop' or data.panel == 'both') then closeShop(); end
end);

RegisterNUICallback('changecam', function(data)
    local cameras = config.shops[shopId].preview.cameras;
    if (DoesCamExist(previewCamera) and cameras[data.index]) then 
        SetCamCoord(previewCamera, cameras[data.index][1], cameras[data.index][2], cameras[data.index][3]);
    end
end);

RegisterNUICallback('changevehicle', function(data)
    if (data and data.model) then 
        if (loadingVehicle) then 
            return;
        end 

        loadingVehicle = true;

        if (DoesEntityExist(previewVehicle)) then 
            DeleteVehicle(previewVehicle);
        end

        if (not IsModelInCdimage(data.model) or not IsModelAVehicle(data.model)) then 
            return;
        end

        RequestModel(data.model);
        while (not HasModelLoaded(data.model)) do 
            Wait(500);
        end

        local pos = config.shops[shopId].preview.car;
        previewVehicle = CreateVehicle(data.model, pos[1], pos[2], pos[3], config.shops[shopId].preview.heading, false, false);
        SetVehicleColours(previewVehicle, 112, 112);
        SetVehicleDirtLevel(previewVehicle, 0);
        ESX.Game.SetVehicleProperties(previewVehicle, {
            pearlescentColor = 0,
        });
        previewVehicleColor = 112;

        while (not DoesEntityExist(previewVehicle)) do 
            Wait(200); 
        end 

        loadingVehicle = false;
        PointCamAtEntity(previewCamera, previewVehicle, 0.0, 0.0, 0.0, true);
    end
end);

RegisterNUICallback('changecolor', function(data)
    if (data and data.color and DoesEntityExist(previewVehicle)) then 
        SetVehicleColours(previewVehicle, data.color, data.color);
        ESX.Game.SetVehicleProperties(previewVehicle, {
            pearlescentColor = 0,
        });
        previewVehicleColor = data.color;
    end
end);

RegisterNUICallback('buyvehicle', function(data)
    if (data and data.model) then 
        local success, response = exports.vCore:useFetch("skVehicleshop:buyVehicle", shopId, data.model);

        if (success) then 
            closeShop();

            ESX.Game.SpawnVehicle(data.model, config.shops[shopId].drop.pos, config.shops[shopId].drop.heading, function(vehicle)
                TaskWarpPedIntoVehicle(GetPlayerPed(-1), vehicle, -1);

                local newPlate = GeneratePlate();
                local vehicleProps = ESX.Game.GetVehicleProperties(vehicle);
                vehicleProps.plate = newPlate;
                SetVehicleNumberPlateText(vehicle, newPlate);
                TriggerServerEvent('skVehicleshop:setVehicleOwned', vehicleProps);
                SetVehicleColours(vehicle, previewVehicleColor, previewVehicleColor);
                SetVehicleDirtLevel(vehicle, 0);
                ESX.Game.SetVehicleProperties(vehicle, {
                    pearlescentColor = 0,
                });
            end);
        else 
            ESX.ShowNotification((response and response.reason) and response.reason or "Ismeretlen hiba");
        end
    end
end);

function closeShop()
    SendNUIMessage({
        panel = 'shop',
        display = false
    });
    SetNuiFocus(false, false);

    if (DoesCamExist(previewCamera)) then 
        SetCamActive(previewCamera, true);
        RenderScriptCams(false, true, 500, false, false);
        DestroyCam(previewCamera, false);
    end

    DisplayRadar(true);
    exports.vHud:setState(true);
    exports.vChat:updateSetting("visible", true);
    exports.vInteraction:removeInteraction("E");

    if (DoesEntityExist(previewVehicle)) then 
        Citizen.CreateThread(function()
            local alpha = 255;
            local allowed = true;
            while (allowed) do 
                if (alpha - 2 > 0) then 
                    alpha = alpha - 2;
                    SetEntityAlpha(previewVehicle, alpha, false);
                else 
                    alpha = 0;
                    allowed = false;
                    DeleteVehicle(previewVehicle);
                end 

                Wait(5);
            end
        end);
    end

    TriggerEvent('shud:toggle', true);
end
