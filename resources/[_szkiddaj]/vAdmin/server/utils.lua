function getPlayerName(player, exclude)
    if (not player or not GetPlayerName(player)) then 
        return 'Ismeretlen';
    end 

    local characterName = (exports.vName:getPlayerCharacterName(player) or 'Ismeretlen'):gsub("_", " ");
    local admin = getPlayerAdmin(player);

    return characterName .. ((admin and not exclude) and (' (' .. admin.name .. ' - ' .. player .. ')') or ' (' .. player .. ')');
end 

OutputDisabledAdmins = {
    --[key: number]: boolean
};
function outputToAdmins(text, minLevel, options)
    for _, player in ipairs(GetPlayers()) do 
        player = tonumber(player);

        if (
            player and 
            (getPlayerAdminLevel(player) or 0) >= minLevel and 
            not OutputDisabledAdmins[player]
        ) then 
            -- exports.vCore:outputChatBox(text, player, options);
            exports.vChat:outputChatBox(player, text, "server", "admin");
        end 
    end 
end
exports("outputToAdmins", outputToAdmins);

AddEventHandler("playerDropped", function()
    if (OutputDisabledAdmins[source] ~= nil) then 
        OutputDisabledAdmins[source] = nil;
    end 
end);

function getPlayerFromAnyIdentifier(playerId)
    if (type(playerId) == "string") then
        local playerResult = table.find(
            GetPlayers(),
            function(player)
                local playerIdentifiers = GetPlayerIdentifiers(player);

                return (playerId:find(":")) and
                    ((table.find_keytbl(
                        playerIdentifiers,
                        function(id, auth)
                            local authType, authId = table.unpack(string.split(playerId, ":"));
                            return (auth == authType and id == authId);
                        end
                    )) and
                        playerIdentifiers[MainIdentifier] or
                        nil) or
                    ((playerIdentifiers[MainIdentifier] and playerIdentifiers[MainIdentifier] == playerId) and playerIdentifiers[MainIdentifier] or
                        nil);
            end
        )

        playerResult = tonumber(playerResult); -- anyad fivem stringkent kell kezelni a playeridket

        if (playerResult and type(playerResult) == "number") then
            return playerResult;
        end
    end

    return false;
end

function getPlayerIdFromPed(pedId)
    for _, player in ipairs(GetPlayers()) do 
        if (GetPlayerPed(player) == pedId) then 
            return player;
        end 
    end 
end

function getVehiclePlate(vehicle)
    return (vehicle and DoesEntityExist(vehicle))
            and GetVehicleNumberPlateText(vehicle):gsub('[ \t]+%f[\r\n%z]', ''):gsub(" ", "-")
            or "Ismeretlen";
end 

function formatTime(seconds)
    local seconds = tonumber(seconds)
  
    if seconds <= 0 then
      return "00:00:00";
    else
      hours = string.format("%02.f", math.floor(seconds/3600));
      mins = string.format("%02.f", math.floor(seconds/60 - (hours*60)));
      secs = string.format("%02.f", math.floor(seconds - hours*3600 - mins *60));
      return hours..":"..mins..":"..secs
    end
end