local ESX = nil;

local Visible = true;
local PlayerData;

function update()
    if (PlayerData) then 
        local ped = GetPlayerPed(-1);
        local data = PlayerData;

        data.health = GetEntityHealth(ped) - 100 - (GetEntityMaxHealth(ped) == 200 and 0 or 25);
        data.armour = GetPedArmour(ped) or 0;

        TriggerEvent('esx_status:getStatus', 'hunger', function(status)
            data.starving = status.getPercent();
        end);

        TriggerEvent('esx_status:getStatus', 'thirst', function(status)
            data.thirst = status.getPercent();
        end);

        while (data.starving == nil or data.thirst == nil) do 
            Wait(50);
        end

        SendNUIMessage({
            action = 'update',
            data = data
        });
    end 
end 

function updateData(data)
    PlayerData = data;
end 

function updateAvatar(avatarUrl)
    SendNUIMessage({
        action = 'avatar',
        url = avatarUrl
    });
end 

function updateCharacterName(name)
    SendNUIMessage({
        action = 'name',
        url = name
    });
end 

-- Toggle
function setState(state)
    Visible = state;

    SendNUIMessage({
        action = 'toggle',
        display = state
    });
end 
AddEventHandler('vHud:toggle', setState);
exports('setState', setState);

function getState()
    return Visible;
end 
exports('getState', getState);

function main()
    Citizen.CreateThread(function()
        while (true) do
            ESX.TriggerServerCallback('vHud:getPlayerStatus', updateData); 
            Wait(1500);
        end
    end);

    Citizen.CreateThread(function()
        while (true) do
            update();
            Wait(200);
        end
    end);

    CreateThread(function()
        local toggled = false;

        while (true) do 
            if (Visible and IsPauseMenuActive() and not toggled) then
                toggled = true;
                
                SendNUIMessage({
                    action = 'toggle',
                    display = state
                });
            end 

            if (IsPauseMenuActive()) then 
                if (not toggled) then 
                    toggled = true;

                    SendNUIMessage({
                        action = 'toggle',
                        display = false
                    });
                end 
            else 
                if (toggled) then 
                    toggled = false;

                    SendNUIMessage({
                        action = 'toggle',
                        display = true
                    });
                end 
            end 

            Wait(250);
        end 
    end);
end 

Citizen.CreateThread(function()
    while (ESX == nil) do 
        TriggerEvent("esx:getSharedObject", function(obj) ESX = obj end);
        Wait(50);
    end

    main();
end);

local DefaultElements = {1, 2, 3, 4, 5, 6, 7, 8, 9, 13, 15, 17, 18, 20, 21, 22};
Citizen.CreateThread(function()
    while true do 
        for i = 1, #DefaultElements do 
            HideHudComponentThisFrame(DefaultElements[i]);
        end

        Wait(0);
    end
end);