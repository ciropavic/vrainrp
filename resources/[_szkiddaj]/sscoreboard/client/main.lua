local ESX;
local State = false;

local roles = {
    mod = { label = 'Admin', color = '#398c48' },
    admin = { label = 'Főadmin', color = '#ce7231' },
    superadmin = { label = 'Tulajdonos', color = '#932a2c' },
    developer = { label = 'Fejlesztő', color = '#396d8c' },
};

Citizen.CreateThread(function()
    while (ESX == nil) do 
        TriggerEvent("esx:getSharedObject", function(lib) ESX = lib; end);
        Wait(50);
    end

    while (true) do 
        update();
        Wait(5000);
    end 
end);

Citizen.CreateThread(function()
	while (true) do
        Wait(0);

        if (
            IsPauseMenuActive()
        ) then 
            goto continue;
        end 

		if (not State and IsControlJustReleased(0, 344)) then
            State = true;
			SendNUIMessage({ action = 'toggle', state = State });
            SetNuiFocus(State, State);
			Citizen.Wait(250);
		end

        ::continue::
	end
end)

RegisterNUICallback('close', function()
    State = false;
    SetNuiFocus(false, false);
end);

function update()
    ESX.TriggerServerCallback('sscoreboard:fetchPlayers', function(data)
        local players = processPlayersData(data);
        SendNuiMessage(json.encode({
            action = 'update',
            players = json.encode(players), 
            maxClients = MaxClients
        }));
    end);
end 

function processPlayersData(data)
    local players = {};

    local playerSrvId = GetPlayerServerId(PlayerId());
    for i,v in ipairs(data) do 
        local player = {};

        player.id = v.id;
        player.name = v.name;
        player.ping = v.ping or 0;
        player.avatar = v.avatar;
        player.isLocalPlayer = playerSrvId == v.id;

        if (v.role) then 
            player.name = player.name .. ' <span class="role" style="--color: ' .. v.role.color .. '"> (' .. v.role.title .. ')</span>';
        end 

        table.insert(players, player);
    end 

    table.sort(players, function(a, b)
        return (a.id < b.id);
    end);

    return players;
end 