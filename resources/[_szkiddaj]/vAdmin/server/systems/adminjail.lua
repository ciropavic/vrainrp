local JailCoords = vector3(459.44177246094, -997.8197631836, 24.89892578125);
local JailDimensionLimits = { min = 10, max = 65535 };

local ReleaseCoords = vector3(-258.61978149414, -978.11865234375, 31.20068359375);

local __OnlineJailedPlayers = {};

local isJailDimensionFree = function(dimension)
    if (type(dimension) ~= "number") then 
        return false;
    end 

    for player, jail in pairs(__OnlineJailedPlayers) do        
        if (jail.dimension == dimension) then 
            return player;
        end 
    end 

    return nil;
end 

local findFreeDimension = function()
    for i = JailDimensionLimits.min, JailDimensionLimits.max do 
        if (isJailDimensionFree(i) == nil) then 
            return i;
        end 
    end 

    return false;
end 

function sendPlayerToJail(playerId, remainTime, jailType, adminId, adminName, reason)
    if (not playerId) then 
        return false;
    end 
    
    local player = exports.vCore:getPlayerEntityFromId(tonumber(playerId));
    if (not player) then 
        return false;
    end 
    
    local identifier = (tonumber(playerId) and (GetPlayerIdentifiers(tonumber(playerId)) or {})[MainIdentifier] or nil);
    if (not identifier) then 
        return false;
    end 
    
    local dimension = findFreeDimension();
    if (not dimension) then  
        return false;
    end 
    
    local waitUntil = os.time() + remainTime * 60;

    player.setPosition(JailCoords.x, JailCoords.y, JailCoords.z);
    player.setDimension(dimension);
    player.setInvincible(true);

    __OnlineJailedPlayers[identifier] = {
        player = playerId,
        admin = {
            id = adminId,
            name = adminName
        }, 
        release_at = waitUntil, 
        type = jailType, 
        dimension = dimension, 
        reason = reason, 
    };

    TriggerClientEvent("vAdmin::setJailState", playerId, { left = remainTime * 60 });
end 
exports("sendPlayerToJail", sendPlayerToJail);

function releasePlayerFromJail(playerId)
    if (not playerId) then 
        return;
    end 

    local player = exports.vCore:getPlayerEntityFromId(tonumber(playerId));
    if (not player) then 
        return false;
    end 

    local identifier = (tonumber(playerId) and (GetPlayerIdentifiers(tonumber(playerId)) or {}).license or nil);
    if (not identifier) then 
        return;
    end 

    player.setPosition(ReleaseCoords.x, ReleaseCoords.y, ReleaseCoords.z);
    player.setDimension(0);
    player.setInvincible(false);

    TriggerClientEvent("vAdmin::setJailState", playerId, false);

    __OnlineJailedPlayers[identifier] = nil;
end 

Citizen.CreateThread(function()
    while(true) do 
        for playerId, jail in pairs(__OnlineJailedPlayers) do 
            if (
                jail.player and 
                #(GetEntityCoords(GetPlayerPed(jail.player)) - JailCoords) > 15
            ) then 
                SetEntityCoords(GetPlayerPed(jail.player), JailCoords, false, false, false, false);
                -- exports.vChat:outputChatBox(jail.player, "hova mesz hmhmhmhm?!?!?!", "error", "error");
            end 
        end 

        Wait(1000);
    end 
end);

Citizen.CreateThread(function()
    while(true) do 
        for playerIdentifier, jail in pairs(__OnlineJailedPlayers) do 
            if (jail.release_at < os.time()) then 
                MySQL.update('UPDATE `users` SET `adminjail` = ? WHERE `identifier` = ?', { nil, playerIdentifier }, function(affectedRows)
                    outputToAdmins(getPlayerName(jail.player) .. " adminjail ideje lejárt.", 1); 
                    exports.vChat:outputChatBox(jail.player, "Lejárt az adminjailed.", "info", "info");
                    releasePlayerFromJail(jail.player);
                end);
            end 
        end 

        Wait(1000);
    end 
end);

Command(
    "unajail", 
    {
        description = "Játékos adminjailből kivétele.",
        required = { admin = 2, off_admin = 2 },
        args = {
            { type = "player" }
        }, 
        alias = { "adminjail" },
    }, 
    function(player, targetPlayer, minutes, jailType, reason)
        local identifier = (GetPlayerIdentifiers(targetPlayer.__netId) or {}).license;
        if (not identifier) then 
            return exports.vChat:outputChatBox(targetPlayer.__netId, "Nem találtam az embi licensét lol.", "error", "error");
        end

        if (not __OnlineJailedPlayers[identifier]) then
            return exports.vChat:outputChatBox(player.__netId, "Nincs börtönben.", "error", "error");
        end 

        local adminIdentifier = (GetPlayerIdentifiers(player.__netId) or {})[MainIdentifier];
        if (not adminIdentifier) then 
            return exports.vChat:outputChatBox(player.__netId, "Nem találtam a licensed lol.", "error", "error");
        end

        print('kivetel', __OnlineJailedPlayers[identifier].admin, adminIdentifier)
        if (
            __OnlineJailedPlayers[identifier].admin ~= adminIdentifier and 
            getPlayerAdminLevel(player.__netId) < AdminLevels.foadmin
        ) then 
            return exports.vChat:outputChatBox(player.__netId, "Nem te raktad be a játékost, így nem tudod kivenni.", "error", "error");
        end 

        MySQL.update('UPDATE `users` SET `adminjail` = ? WHERE `identifier` = ?', { nil, identifier }, function(affectedRows)
            outputToAdmins(getPlayerAdminName(player.__netId) .. " kivette " .. getPlayerName(targetPlayer.__netId) .. " játékost adminjailből.", 1); 
            exports.vChat:outputChatBox(targetPlayer.__netId, getPlayerAdminName(player.__netId) .. " kivett az adminjailből.", "info", "info"); 
            releasePlayerFromJail(targetPlayer.__netId);
        end);
    end
);

Command(
    "jailed", 
    {
        description = "Kiírja a jailben lévő játékosokat.", 
        required = { admin = 1, off_admin = 5 },
        args = {  }
    },
    function(admin)
        exports.vChat:outputChatBox(admin.__netId, "Jailben lévő játékosok: ", "info", "info");
        local inJail = 0;

        for player, jail in pairs(__OnlineJailedPlayers) do 
            exports.vChat:outputChatBox(admin.__netId, getPlayerName(jail.player) .. " | Berakta: " .. jail.admin.name .. " | Indok: " .. jail.reason .. " | Maradt: " .. formatTime(jail.release_at - os.time()), "server", "f4fd");
            inJail += 1;
        end 

        if (inJail == 0) then 
            exports.vChat:outputChatBox(admin.__netId, "Nincs senki adminjailben.", "error", "error");
        end 
    end 
);