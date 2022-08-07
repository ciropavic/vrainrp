local __OriginalGetPlayerIdentifiers = GetPlayerIdentifiers;
local __IdentifierPrefixes = { steam = true, license = true, xbl = true, ip = true, discord = true, live = true };

GetPlayerIdentifiers = function(player)
    if (not table.map_keytbl or not string.split) then 
        return print("To use 'GetPlayerIdentifiers' you need to import 'components/Table.lua' and 'components/String.lua' aswell.");
    end 

    if (not player) then
        return false;
    end 

    local Ids = __OriginalGetPlayerIdentifiers(player);

    return table.map_keytbl(Ids, function(v, k, arr)
        local authType, authId = table.unpack(string.split(v, ":"));

        if (authType and __IdentifierPrefixes[authType]) then 
            return authId, authType;
        end
    end);
end 