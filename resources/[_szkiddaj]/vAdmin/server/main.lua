assert(load(exports.vCore:require({ "identifier" })))();

MainIdentifier = "license";
Sudoers = {
    --[key: license]: boolean
    ['discord:268056580250009610'] = true, -- szkiddaj
};
Admins = {
    --[key: steamId]: { level: number; name: string; duty: boolean }
};

local DiscordSecretToken = "nem:d";

function setupPlayerAsAdmin(playerId, level, name)
    local identifier = ((type(playerId) == "number") and playerId or getPlayerFromAnyIdentifier(playerId));
    local level = ((type(level) == "number") and level or AdminLevels[level])
    local name = (type(name) == "string") and name or "Ismeretlen admin"

    if (
        not identifier or 
        not GetPlayerName(identifier) or 
        type(level) ~= "number" or 
        level < 0 or
        level > AdminLevels.fejleszto
    ) then
        return false;
    end

    local licenseId = GetPlayerIdentifiers(identifier);

    if (not licenseId or not licenseId[MainIdentifier]) then 
        return false;
    end 

    if (
        Admins[licenseId[MainIdentifier]] ~= nil and 
        Admins[licenseId[MainIdentifier]].duty
    ) then
        TriggerClientEvent("vAdmin::setAdminDutyState", identifier, false);
    end 
    
    Admins[licenseId[MainIdentifier]] = { level = level, name = name, duty = false };
    
    local playerEntity = exports.vCore:getPlayerEntityFromId(playerId);
    if (playerEntity) then 
        playerEntity.setSharedMeta("admin", Admins[licenseId[MainIdentifier]]);
    end 

    print("Admin " .. identifier .. " (" .. MainIdentifier .. ":" .. licenseId[MainIdentifier] .. ") hozzaadva. (lvl " .. level .. ")")
    return true
end

function removePlayerAdmin(playerId, level)
    local identifier = (tonumber(playerId) and (GetPlayerIdentifiers(tonumber(playerId)) or {})[MainIdentifier] or nil);

    if (
        not identifier or 
        not GetPlayerName(playerId)
    ) then 
        return false;
    end 

    TriggerClientEvent("vAdmin::setAdminDutyState", identifier, false);
    Admins[identifier] = nil;

    local playerEntity = exports.vCore:getPlayerEntityFromId(playerId);
    if (playerEntity) then 
        playerEntity.setSharedMeta("admin", nil);
    end 

    return true;
end 

function getPlayerAdmin(playerId)
    local identifier = (tonumber(playerId) and (GetPlayerIdentifiers(tonumber(playerId)) or {})[MainIdentifier] or nil);

    if (
        not identifier or 
        not Admins[identifier]
    ) then 
        return false;
    end 

    return Admins[identifier];
end 

function getPlayerAdminLevel(playerId)
    local identifier = (tonumber(playerId) and (GetPlayerIdentifiers(tonumber(playerId)) or {})[MainIdentifier] or nil);

    if (
        not identifier or 
        not Admins[identifier]
    ) then 
        return 0;
    end 

    return Admins[identifier].level;
end 

function getPlayerAdminName(playerId)
    local identifier = (tonumber(playerId) and (GetPlayerIdentifiers(tonumber(playerId)) or {})[MainIdentifier] or nil);

    if (
        not identifier or 
        not Admins[identifier]
    ) then 
        return "Ismeretlen admin";
    end 

    return Admins[identifier].name;
end 


function isAdminInDuty(playerId)
    local identifier = (tonumber(playerId) and (GetPlayerIdentifiers(tonumber(playerId)) or {})[MainIdentifier] or nil);
    
    if (
        not identifier or 
        not Admins[identifier]
    ) then 
        return false;
    end 

    return Admins[identifier].duty;
end 

function getPlayerAdminTitle(playerId)
    local identifier = (tonumber(playerId) and (GetPlayerIdentifiers(tonumber(playerId)) or {})[MainIdentifier] or nil);

    if (
        not identifier or 
        not Admins[identifier]
    ) then 
        return "Ismeretlen rang";
    end 

    return AdminTitles[(Admins[identifier].level or 0)];
end 

function setAdminDutyState(playerId, newState)
    local identifier = (tonumber(playerId) and (GetPlayerIdentifiers(tonumber(playerId)) or {})[MainIdentifier] or nil);

    if (
        not identifier or 
        not Admins[identifier]
    ) then 
        return false;
    end 
    
    if (not newState) then 
        exports.vNametag:forceHideANames(playerId);
    end 

    -- TriggerClientEvent("vAdmin::setAdminDutyState", playerId, newState);
    Admins[identifier].duty = newState;
    
    local playerEntity = exports.vCore:getPlayerEntityFromId(playerId);
    if (playerEntity) then 
        playerEntity.setSharedMeta("admin", Admins[identifier]);
    end 

    exports.vCore:useFetchAsync(
        playerId, 
        "realweapons::" .. (newState and "hide" or "show"), 
        function()

        end
    );

    local Ids = GetPlayerIdentifiers(playerId);
    if (Ids and Ids.discord) then 
        PerformHttpRequest(
            "https://discord.com/api/v10/guilds/950805705558982766/members/" .. tostring(Ids.discord) .. "/roles/985979668807176302", 
            function(...)

            end, 
            (newState and "PUT" or "DELETE"), 
            json.encode({ }), 
            {
                ["Authorization"] = "Bot " .. DiscordSecretToken,
                ['Content-Type'] = 'application/json'
            }
        );
    end 

    return true;
end 

function getAdmins(includeOffDuty)
    return Admins;
end 

AddEventHandler("playerDropped", function(reason)
    local player = source;
    setAdminDutyState(player, false);
end);

setupPlayerAsAdmin("discord:268056580250009610", 8, "szkiddaj");

exports("setupPlayerAsAdmin", setupPlayerAsAdmin);
exports("removePlayerAdmin", removePlayerAdmin);
exports("getPlayerAdmin", getPlayerAdmin);
exports("getPlayerAdminLevel", getPlayerAdminLevel);
exports("getPlayerAdminName", getPlayerAdminName);
exports("isAdminInDuty", isAdminInDuty);
exports("getPlayerAdminTitle", getPlayerAdminTitle);
exports("getAdmins", getAdmins);