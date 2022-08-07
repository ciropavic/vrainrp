function addLog(channelOrUrl, data)
    local url = (type(channelOrUrl) == "string" and Config.logs[channelOrUrl])
                    and Config.logs[channelOrUrl]
                    or channelOrUrl;

    if (type(url) ~= "string") then 
        return false;
    end 

    local payload = {
        username = (data?.username or "vrain logs"), 
        embeds = (type(data?.embed) == "table") and { data?.embed } or nil, 
        content = data?.content
    };

    PerformHttpRequest(
        url, 
        function(...)
            
        end, 
        "POST", 
        json.encode(payload), 
        {
            ["Content-Type"] = "application/json"
        }
    );
end 
exports("addLog", addLog);

function addAdminLog(adminId, playerId, body)
    local adminIdentifiers = GetPlayerIdentifiers(adminId);
    if (not adminIdentifiers or not adminIdentifiers.steam) then 

    end 

    local playerIdentifiers = GetPlayerIdentifiers(playerId);
    if (not playerIdentifiers or not playerIdentifiers.steam) then 

    end 

    local embed = {
        {
            name = "Admin",
            value = "[" .. exports.vAdmin:getPlayerAdminName(adminId) .. "](https://steamcommunity.com/profiles/" .. GetSteamId64FromHex(adminIdentifiers.steam) .. ")",
            inline = true,
        },
    };
end 
exports("addAdminLog", addAdminLog);

function GetSteamId64FromHex(hex_id)
	local len = string.len(hex_id)
	local dec = 0
	for i=1,len do
		local val = string.sub(hex_id, i, i)
		if val == "a" or val == "A" then val = 10*16^tonumber(len-i)
		elseif val == "b" or val == "B" then val = 11*16^tonumber(len-i)
		elseif val == "c" or val == "C" then val = 12*16^tonumber(len-i)
		elseif val == "d" or val == "D" then val = 13*16^tonumber(len-i)
		elseif val == "e" or val == "E" then val = 14*16^tonumber(len-i)
		elseif val == "f" or val == "F" then val = 15*16^tonumber(len-i)
		else val = tonumber(val)*16^tonumber(len-i)
		end
		dec = dec+math.ceil(val)
	end
	return dec
end