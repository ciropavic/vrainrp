-- Kereskedés főni 
local shopId;

AddEventHandler("onClientEntityMarkerEnter", function(marker, entity)
    local carshopId = marker.getMeta("carshopId");
    local carshopIsBoss = marker.getMeta("carshopIsBoss");
    
    if (
        entity.isLocalPlayer() and 
        carshopId and 
        carshopIsBoss and 
        config.shops[carshopId]
    ) then 
        local id = carshopId;
        shopId = id;

        exports.vInteraction:addInteraction("F", "Járműbolt adminisztráció felület megnyitása", function()
            local isBoss = exports.vCore:useFetch("skVehicleshop:isJobBoss", shopId);

            ESX.UI.Menu.CloseAll();
            ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'vehicle_dealermenu', {
                    title = 'Járműkereskedés',
                    align = 'right',
                    elements = {
                        { label = 'Járműlista', value = 'vehiclelist' },
                        { label = 'Vásárlás', value = 'buy' },
                    }
                }, 
                function(menu)
                    if (menu.current.value == 'vehiclelist') then 
                        openDealerVehicles(data);
                    elseif (menu.current.value == 'buy') then 
                        openDealerShop(data);
                    end 
                end, 
        
                function(data, menu)
                    menu.close();
                end
            );
        end, { interval = 1000 });
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
        exports.vInteraction:removeInteraction("F");
    end 
end);

function openDealerVehicles()
    ESX.UI.Menu.CloseAll();
    ESX.TriggerServerCallback('skVehicleshop:getShopVehicles', function(vehicles)
        local vehicles = json.decode(vehicles);
        local vehicleElement = {};

        table.sort(vehicles, function(a, b)
            return string.lower(GetLabelText( GetDisplayNameFromVehicleModel(a.model) )) < string.lower( GetLabelText( GetDisplayNameFromVehicleModel(b.model) ) );
        end);

        for i,v in ipairs(vehicles) do 
            local vehicleName = GetLabelText( GetDisplayNameFromVehicleModel(v.model) );

            if (vehicleName == 'NULL') then 
                vehicleName = getVehicleName(v.model);
            end 

            table.insert(vehicleElement, {
                label = vehicleName .. ' - $' .. formatNumber(v.price, ',') .. ' (' .. v.count .. ' maradt)',
                value = v.model
            });
        end 

        ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'vehicle_dealermenu', {
            title = 'Járműkereskedés',
            align = 'right',
            elements = vehicleElement,
        }, function(menu)
            openDealerPriceChange(menu.current.value);
        end, function(data, menu)
            menu.close();
        end)
    end, shopId);
end 

function openDealerPriceChange(vehicleName)
    ESX.UI.Menu.Open('dialog', GetCurrentResourceName(), 'vehicleshop_dealerpricechanger', {
        title = 'Jármű ármódosítás'
    }, function(data, menu)
        local amount = tonumber(data.value);

        if (amount == nil) then
            ESX.ShowNotification('Érvénytelen összeg.');
        else
            ESX.TriggerServerCallback('skVehicleshop:changeVehiclePrice', function(success, msg)
                menu.close();
            
                if (success) then 
                    openDealerVehicles();
                end 
                
                ESX.ShowNotification(msg);

            end, shopId, vehicleName, amount);
        end
    end, function(data, menu)
        menu.close()
    end);
end 

function openDealerShop(data)
    ESX.UI.Menu.CloseAll();
    
    ESX.TriggerServerCallback('skVehicleshop:isJobBoss', function(isBoss)
        if (isBoss) then 
            local cars = config.buyableCars;
            for i,v in ipairs(cars) do 
                v.name = (config.carNames[v.model] or GetLabelText(GetDisplayNameFromVehicleModel(v.model))) or 'Ismeretlen';
            end
            SendNUIMessage({
                panel = 'import',
                display = true,
                func = 'open',
                data = cars,
            });
            SetNuiFocus(true, true);
        end
    end, shopId);
end 

RegisterNUICallback('buyvehiclesasdealer', function(data)
    ESX.TriggerServerCallback('skVehicleshop:validateDealerVehicleBuy', function(response)
        closeDealer();
    end, shopId, data.data);
end);

RegisterNUICallback('close', function(data)
    if (data.panel == 'dealer' or data.panel == 'both') then closeDealer(); end
end);

function closeDealer()
    SendNUIMessage({
        panel = 'import',
        display = false,
    });
    SetNuiFocus(false, false);
end