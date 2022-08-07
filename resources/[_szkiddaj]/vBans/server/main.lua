local ESX;

TriggerEvent('esx:getSharedObject', function(lib) ESX = lib; end);

local Bans = {};
local CachedPlayers = {};
local PlayerCacheClear = 21600000;
local TempIds = {};

AddEventHandler('playerConnecting', function(name, kick)
    local ban = isPlayerBanned(source);
    if (ban) then 
        local remain;

        if (ban.expire == -1) then 
            remain = 'Örök';
        else 
            remain = ( ban.expire - getTime() ) / 1000 / 60 / 60;

            if (remain < 24) then 
                remain = math.ceil(remain) .. ' óra.';
            else 
                remain = math.ceil(remain / 24) .. ' nap.';
            end

            -- local totalTime = math.ceil((ban.expire - ban.start) / 1000 / 60 / 60);
            -- remain = remain .. " (Összesen " .. ((totalTime > 24) and (math.ceil(totalTime / 24) .. " napra") or (totalTime .. " órára")) .. " lettél bannolva.)";
        end 

        kick(
            string.format(
                Config.labels['already_banned'], 
                ban.admin, 
                ban.reason, 
                remain, 
                ban.id
            )
        );

        CancelEvent();
        return;
    end 

    local identifiers = GetIdentifiers(source);

    if (
        identifiers and
        not identifiers.steam or 
        identifiers.steam == 'n/a'
    ) then 
        kick(Config.labels['no_steam']);
        CancelEvent();
        return;
    end 

    TempIds[source] = {
        time = getTime(),
        identifiers = identifiers
    };
end);

RegisterNetEvent('playerJoining');
AddEventHandler('playerJoining', function(oldId)
    oldId = tonumber(oldId);
    if (oldId and TempIds[oldId]) then 
        CachedPlayers[tonumber(source)] = TempIds[oldId];
        TempIds[oldId] = nil;
    end 
end);

function banPlayerById(playerId, time, reason, admin, callback)
    if (
        type(playerId) ~= "number" or 
        not GetPlayerName(playerId)
    ) then 
        return false, "invalid_arguments";
    end 
    
    local playerIdentifiers = CachedPlayers[playerId];
    
    if (not playerIdentifiers) then 
        print("ASD2?")
        return false, "could_not_find_in_cache";
    end 

    DropPlayer(playerId, string.format(
        Config.labels['got_banned'], 
        admin, 
        reason
    ));

    banPlayer(playerIdentifiers, reason, admin, time, callback);
end 
exports("banPlayerById", banPlayerById);

function banPlayer(ids, reason, admin, time, callback)
    local identifiers = ids.identifiers;
    local reason = reason or 'Nincs indok';
    local admin = admin or 'Rendszer';
    local time = time or 24;

    MySQL.Async.execute(
        [[
            INSERT INTO bans 
                (identifiers, admin, reason, ban_date, expire_date)
            VALUES
                (@identifiers, @admin, @reason, NOW(), DATE_ADD(NOW(), interval @time hour))
        ]],
        {
            identifiers = json.encode(identifiers),
            admin = admin, 
            reason = reason, 
            time = (time ~= -1) and time or 87660,
        }, 
        function(data)
            reloadBans();

            if (PlayerOrIdentifiers and type(PlayerOrIdentifiers) == 'number') then 
                DropPlayer(PlayerOrIdentifiers, reason);
            end 

            if (callback ~= nil) then 
                callback(data);
            end 
        end
    );
end
exports("banPlayer", banPlayer);

function removeBanById(banId)
    if (
        type(banId) ~= "number"
    ) then 
        return false;
    end 

    local result = MySQL.Sync.execute(
        'UPDATE `bans` SET `state` = "disabled" WHERE id = @id AND `state` = "active"', 
        {
            ['@id'] = banId,
        }
    );

    return (type(result) == "number" and result == 1);
end 
exports("removeBanById", removeBanById);

function getCachedPlayerIdIdentifiers(playerId)
    return playerId and CachedPlayers[tonumber(playerId)] or false;
end 
exports("getCachedPlayerIdIdentifiers", getCachedPlayerIdIdentifiers);

function reloadBans()
    MySQL.Async.fetchAll(
        'SELECT * FROM `bans` WHERE `state` = "active"',
        { },
        function(data)
            local bans = {};

            for i,v in ipairs(data) do 
                table.insert(bans, {
                    id = v.id, 
                    identifiers = json.decode(v.identifiers),
                    admin = v.admin, 
                    reason = v.reason,
                    start = v.ban_date, 
                    expire = v.expire_date
                });
            end 

            Bans = bans;
        end
    );
end 

function isPlayerBanned(player)
    if (not player) then 
        return false;
    end 

    local playerIdentities = GetIdentifiers(player);

    if (not playerIdentities) then 
        return false;
    end 

    for banIndex, ban in ipairs(Bans) do 
        if (ban and ban.identifiers) then 
            for banIdType, banId in pairs(ban.identifiers) do 
                if (
                    playerIdentities[banIdType] and 
                    playerIdentities[banIdType] == banId 
                ) then 
                    if (ban.expire ~= -1 and ban.expire < getTime()) then 
                        MySQL.Async.execute('UPDATE bans SET `active` = "expired" WHERE id = @id LIMIT 1', { id = ban.id });
                        Bans[banIndex] = nil;
                        
                        return false;
                    end 
                    
                    return ban;
                end 
            end 
        else 
            MySQL.Async.execute('UPDATE bans SET `active` = "expired" WHERE id = @id LIMIT 1', { id = ban.id }, function() end);
            Bans[banIndex] = nil;
        end 
    end 

    return false;
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
            Config.identities[idType]
        ) then 
            playerIds[idType] = id;
        end 
    end

    return playerIds;
end 

-- function getPlayerServerIdFromSteam(steamId)
--     local players = ESX.GetPlayers();

--     for _, player in ipairs(players) do 
--         local identifiers = GetIdentifiers();

--         if (
--             identifiers and 
--             identifiers.steam and 
--             identifiers.steam == steamId
--         ) then 
--             return player;
--         end 
--     end 
-- end 

-- function allocatePlayerIds()
--     for steamId, v in pairs(CachedPlayers) do 
--         if (v.id == nil) then 
--             v.id = getPlayerServerIdFromSteam();
--         end 
--     end 
-- end 

function clearPlayersCache()
    local time = getTime();

    for player, value in pairs(CachedPlayers) do 
        if (time > value.time + PlayerCacheClear) then 
            CachedPlayers[player] = nil;
        end 
    end 
end 

function addPlayersOnStartup()
    for _, player in ipairs(GetPlayers()) do 
        player = tonumber(player);

        CachedPlayers[player] = {
            time = getTime(), 
            identifiers = GetIdentifiers(player)
        };
    end
end 

Citizen.CreateThread(function()
    while (true) do
        -- allocatePlayerIds();
        clearPlayersCache();

        Wait(5000);
    end 
end);

addPlayersOnStartup();
reloadBans();