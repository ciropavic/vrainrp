local ESX;
local SteamApiKey = GetConvar('steam_webApiKey', '');
local cachedPlayersData = {};
local cachedAvatars = {};

local AdminColors = exports.vAdmin:getAdminColors();

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj; end);

ESX.RegisterServerCallback('sscoreboard:fetchPlayers', function(source, callback)
    callback(cachedPlayersData);
end);

function update()
    local players = {};

    for i,v in ipairs(ESX.GetPlayers()) do
        local inDuty = exports.vAdmin:isAdminInDuty(v);
        local adminLevel = exports.vAdmin:getPlayerAdminLevel(v);

        local player = {
            id = v,
            name = (inDuty) 
                        and (exports.vAdmin:getPlayerAdminName(v) or GetPlayerName(v))
                        or (exports.vName:getPlayerCharacterName(v) or GetPlayerName(v)),
            role = (inDuty and {
                title = exports.vAdmin:getPlayerAdminTitle(v), 
                color = "#" .. ((AdminColors[adminLevel]) and AdminColors[adminLevel].hex or "ff5050"),
            } or nil),

            ping = GetPlayerPing(v), 
            avatar = false,
        };

        if (not cachedAvatars[v]) then 
            local playerIds = GetIdentifiers(v);
            if (not playerIds or not playerIds.steam) then 
                goto continue;
            end 
            
            local responded = false;
            local tries = 0;
            local url = ('https://api.steampowered.com/ISteamUser/GetPlayerSummaries/v0002/?key=%s&steamids=%s'):format(
                SteamApiKey, tonumber(playerIds.steam, 16)
            );

            PerformHttpRequest(url, function(error, text, headers)
                if (not error or error == 200) then 
                    local result = json.decode(text);
                    if (
                        result and 
                        #result.response.players >= 1
                    ) then 
                        local avatar = result.response.players[1].avatarfull;
                        
                        cachedAvatars[v] = avatar;
                        player.avatar = avatar;
                    else 
                        player.avatar = 'asd';
                    end 
                else 
                    player.avatar = 'asd';
                end 

                responded = true;
            end, GET, '');

            while (responded == false) do 
                tries = tries + 1;
                if (tries > 10) then 
                    player.avatar = 'asd';
                    break;
                end

                Wait(10);
            end 
        else 
            player.avatar = cachedAvatars[v];
        end 

        table.insert(players, player);

        ::continue::
    end 

    cachedPlayersData = players;
end 

Citizen.CreateThread(function()
    while (true) do 
        update();
        Wait(3000);
    end 
end);

Identities = {
    steam = true
};

string.split = function (inputstr, sep)
    local sep = (sep or ',');
    local t = {};

    for str in string.gmatch(inputstr, "([^"..sep.."]+)") do
        table.insert(t, str);
    end

    return t;
end

function GetIdentifiers(player)
    if (not player) then 
        return false;
    end 

    local playerIds = {};

    for k,v in ipairs(GetPlayerIdentifiers(player)) do
        local val = string.split(v, ':');
        local idType, id = val[1], val[2];

        if (
            idType and 
            id and 
            Identities[idType]
        ) then 
            playerIds[idType] = id;
        end 
    end

    return playerIds;
end 