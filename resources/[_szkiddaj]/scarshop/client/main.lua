ESX = nil;

Carshops = {};

MarkerWaitForInput = nil;
CarshopAccessType = nil; -- customer vagy manager
CarshopIndex = nil; -- ServerConfig Carshop array index

PreviewCamera = nil;
PreviewVehicle = nil;
CachedVehicleColor = { 255, 255, 255 };

IsPreviewVehicleLoading = false;

function fetchCarshops(carshops)
    if (carshops) then 
        Carshops = carshops;

        for i,v in ipairs(carshops) do 
            local sX, sY, sZ = table.unpack(v.customer.position);
            local size = (v.customer.size) and v.customer.size or ClientConfig.DefaultMarkerSize;
            local type = (v.customer.type) and v.customer.type or ClientConfig.DefaultMarkerType;
            local r, g, b, a = table.unpack( (v.customer.color) and v.customer.color or ClientConfig.DefaultMarkerColor );

            TriggerEvent(
                ClientConfig.resource .. ':CreateMarker',
                'carshop_customer_' .. i, 
                sX, sY, sZ - 1, type, size, r, g, b, a, 
                { index = i, type = 'customer' }
            );
            
            local blip = AddBlipForCoord(sX, sY, sZ);
            SetBlipSprite(blip, 326);
            SetBlipScale(blip, 1.0);
            SetBlipColour(blip, 2);
            SetBlipAsShortRange(blip, true);
            BeginTextCommandSetBlipName('STRING');
            AddTextComponentString(v.name or 'Autókereskedés');
            EndTextCommandSetBlipName(blip);
        end 
    end 
end 

-- Camera

function createPreviewCamera(vehicle, carshop)
    RenderScriptCams(false, false, 0, false, false);

    if (PreviewCamera and DoesCamExist(PreviewCamera)) then 
        DestroyCam(PreviewCamera);
        PreviewCamera = nil;
    end
    
    PreviewCamera = CreateCam('DEFAULT_SCRIPTED_CAMERA', true);
    SetCamCoord(PreviewCamera, carshop.camera);

    if (vehicle and DoesEntityExist(vehicle)) then 
        PointCamAtEntity(PreviewCamera, vehicle, 0.0, 0.0, 0.0, true);
    else 
        PointCamAtCoord(PreviewCamera, carshop.vehicle.point);
    end 

    SetCamActive(PreviewCamera, true);
    RenderScriptCams(true, true, 750, true, true);
end 

-- Vehicle

function createPreviewVehicle(model, carshop)
    if (IsPreviewVehicleLoading ~= false) then 
        return;
    end 

    IsPreviewVehicleLoading = model;

    if (PreviewVehicle and DoesEntityExist(PreviewVehicle)) then 
        DeleteVehicle(PreviewVehicle);
        PreviewVehicle = nil;
    end 

    ESX.Game.SpawnLocalVehicle(
        model, 
        carshop.vehicle.point, 
        carshop.vehicle.heading, 
        function(vehicle)
            if (PreviewVehicle and DoesEntityExist(PreviewVehicle)) then 
                DeleteVehicle(PreviewVehicle);
                previewVehicle = nil;
            end 

            PreviewVehicle = vehicle;
            IsPreviewVehicleLoading = false;
            SetVehicleCustomPrimaryColour(PreviewVehicle, table.unpack(CachedVehicleColor));
            SetVehicleCustomSecondaryColour(PreviewVehicle, table.unpack(CachedVehicleColor));
            SetVehicleDirtLevel(PreviewVehicle, 0);
            SetVehicleLivery(PreviewVehicle, 0);
            SetModelAsNoLongerNeeded(model);
            ESX.Game.SetVehicleProperties(PreviewVehicle, {
                pearlescentColor = 0,
            });
            
            if (PreviewCamera and DoesCamExist(PreviewCamera)) then 
                PointCamAtEntity(PreviewCamera, PreviewVehicle, 0.0, 0.0, 0.0, true);
            end 
        end
    );
end 

function openCarshop(isManager, vehicles)
    local carshop = Carshops[CarshopIndex];

    if (carshop and vehicles) then 
        local vehicles = validateVehicles(vehicles);
        
        if (vehicles and vehicles[1]) then   
            SendNUIMessage({
                action = 'open_customer', 
                vehicles = vehicles, 
            });
            SetNuiFocus(true, true);
        end 
    end 
end 

AddEventHandler(ClientConfig.resource .. ':onMarkerHit', function(_, ped, isLocalPlayer, data)
    if (isLocalPlayer and data) then 
        CarshopIndex = data.index;
        MarkerWaitForInput = true;

        waitForEnterInput();

        if (data.type == 'customer') then 
            CarshopIndex = data.index;
            CarshopAccessType = 'customer';
            MarkerWaitForInput = true;

        elseif (data.type == 'manager') then 
            ESX.TriggerServerCallback('sCarshop:hasPermissionToCarshop', function(hasPermission)
                if (hasPermission) then 
                    CarshopIndex = data.index;
                    CarshopAccessType = 'manager';
                    MarkerWaitForInput = true;
                end
            end, carshopIndex);
        end 
    end 
end);

AddEventHandler(ClientConfig.resource .. ':onMarkerLeave', function(_, ped, isLocalPlayer, data)
    if (isLocalPlayer and MarkerWaitForInput) then 
        MarkerWaitForInput = false;
        CarshopIndex = nil;
        CarshopAccessType = nil;
    end 
end);

function waitForEnterInput()
    while (MarkerWaitForInput) do 
        if (IsControlJustPressed(0, 38)) then 
            MarkerWaitForInput = false;
            ESX.TriggerServerCallback(
                'sCarshop:getCarshopVehicles',
                function(data)
                    if (data and data.vehicles) then 
                        DisplayRadar(false);
                        openCarshop(
                            (CarshopAccessType and CarshopAccessType == 'manager'), 
                            data.vehicles
                        );
                    end
                end, 
                CarshopIndex
            );
        end 

        Wait(1);
    end 
end 

function validateVehicles(vehicles)
    local validated = {};

    for i,v in ipairs(type(vehicles) == 'string' and json.decode(vehicles) or vehicles) do 
        if (
            v and 
            v.model and 
            IsModelInCdimage(v.model) and 
            IsModelAVehicle(v.model)
        ) then 
            for _, v2 in ipairs(SharedConfig.Vehicles) do 
                if (v.model == v2.model and not v2.ignore) then
                    table.insert(validated, {
                        model = v.model, 
                        count = v.count, 
                        price = v.price, 

                        name = v2.name, 
                        manufacturer = v2.manufacturer, 
                        type = v2.type, 
                        defaultPrice = v2.price,
                    }); 
                end 
            end 
        end 
    end 

    return validated;
end 

Citizen.CreateThread(function()
    while (ESX == nil) do 
        TriggerEvent("esx:getSharedObject", function(obj) ESX = obj end);
        Wait(50);
    end

    ESX.TriggerServerCallback('sCarshop:fetchCarshops', fetchCarshops);
end);

RegisterNUICallback('disablefocus', function()
    SetNuiFocus(false, false);
end);

RegisterNUICallback('updatecolor', function(data)
    if (data and data.color) then 
        CachedVehicleColor = data.color;
        SetVehicleCustomPrimaryColour(PreviewVehicle, table.unpack(data.color));
        SetVehicleCustomSecondaryColour(PreviewVehicle, table.unpack(data.color));

        ESX.Game.SetVehicleProperties(PreviewVehicle, {
            pearlescentColor = 0,
        });
    end 
end);

RegisterNUICallback('updatevehicle', function(data)
    local carshop = Carshops[CarshopIndex];

    if (carshop and data and data.model) then 
        if (data.loadCam) then 
            createPreviewCamera(nil, carshop);
        end 

        createPreviewVehicle(data.model, carshop);
    end 
end);

function closeShop()
    if (PreviewCamera and DoesCamExist(PreviewCamera)) then 
        DestroyCam(PreviewCamera);
        PreviewCamera = nil;
    end 

    if (PreviewVehicle and DoesEntityExist(PreviewVehicle)) then 
        DeleteVehicle(PreviewVehicle);
        PreviewVehicle = nil;
    end

    RenderScriptCams(false, true, 750, true, false);
    SetNuiFocus(false, false);

    DisplayRadar(true);

    IsPreviewVehicleLoading = false;
end 

RegisterNUICallback('closeshop', function()
    closeShop();
end);

-- -49.453426361084, -1112.6215820312, 25.985067367554

-- Admin.lua

RegisterNetEvent('sCarshop:adminMakeVehicle');
AddEventHandler('sCarshop:adminMakeVehicle', function(vehicleName)
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

RegisterNetEvent('sCarshop:deleteVehiclePermanent');
AddEventHandler('sCarshop:deleteVehiclePermanent', function()
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
    TriggerServerEvent('sCarshop:deleteVehiclePermanent', props);
end);

RegisterNetEvent('sCarshop:setVehicleToJob');
AddEventHandler('sCarshop:setVehicleToJob', function()
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

SetPedConfigFlag(PlayerPedId(), 35, false);