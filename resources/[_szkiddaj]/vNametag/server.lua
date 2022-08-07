assert(load(exports.vCore:require({ "identifier" })))();

local ESX;
local PlayerList = {} -- { admin: { duty: boolean; name: string; role: number }; char_name: string; }[];

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj; end);

ESX.RegisterServerCallback('vNametag:fetchPlayersData', function(source, callback)
    callback(PlayerList);
end);

function update()
    for _, id in ipairs(GetPlayers()) do 
        id = tonumber(id);
        
        if (not PlayerList[id]) then 
            PlayerList[id] = nil;
        end 
        
        PlayerList[id] = GetPlayerName(id);

        local playerAdminLevel = exports.vAdmin:getPlayerAdminLevel(id);
        if (playerAdminLevel and playerAdminLevel > 0) then 
            PlayerList[id] = {
                admin = {
                    duty = exports.vAdmin:isAdminInDuty(id), 
                    name = exports.vAdmin:getPlayerAdminName(id), 
                    role = exports.vAdmin:getPlayerAdminLevel(id)
                },
    
                char_name = exports.vName:getPlayerCharacterName(id) or GetPlayerName(id),
            };
        else 
            PlayerList[id] = {   
                char_name = exports.vName:getPlayerCharacterName(id) or GetPlayerName(id),
            };
        end 
    end 
end 

local adminNameStates = {};
exports.vAdmin:addCommand(
    "anevek", 
    {
        description = "Admin nevek be-ki kapcsolása.",
        required = { admin = 2, off_admin = 5 }, 
        args = { }, 
        alias = { "anames" },
    }, 
    function(player)
        -- print('asd')
        local identifiers = GetPlayerIdentifiers(player.__netId);

        if (not identifiers?.steam) then 
            return false;
        end 
        
        if (not adminNameStates[identifiers.steam]) then 
            adminNameStates[identifiers.steam] = true;
            exports.vAdmin:outputToAdmins(exports.vAdmin:getPlayerAdminName(player.__netId) .. " bekapcsolta az aneveket.", 2);
            TriggerClientEvent("vNametag::setANames", player.__netId, true);
        else 
            adminNameStates[identifiers.steam] = nil;
            exports.vAdmin:outputToAdmins(exports.vAdmin:getPlayerAdminName(player.__netId) .. " kikapcsolta az aneveket.", 2);
            TriggerClientEvent("vNametag::setANames", player.__netId, false);
        end 
    end 
);

function forceHideANames(player)
    local identifiers = GetPlayerIdentifiers(player);
    if (not identifiers?.steam) then 
        return false;
    end 

    if (adminNameStates[identifiers.steam]) then 
        TriggerClientEvent("vNametag::setANames", player, false);
        return true;
    end 

    return false;
end 
exports("forceHideANames", forceHideANames);

Citizen.CreateThread(function()
    while (true) do 
        if (ESX ~= nil) then 
            update();
        end 

        Wait(2000);
    end 
end);