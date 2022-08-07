ESX = nil;

TriggerEvent("esx:getSharedObject", function(lib) 
	ESX = lib;
end);

ESX.RegisterServerCallback('sCarshop:fetchCarshops', function(source, callback)
	callback(ServerConfig.Carshops);
end);

function hasPermissionToCarshop(carshopIndex, player)
	local xPlayer = ESX.GetPlayerFromId(player);
	local carshop = ServerConfig.Carshops[carshopIndex];

	if (carshop and xPlayer) then 
		local job = xPlayer.getJob();

		if (carshop.ownerType == 'job') then 
			return (
				job.name == carshop.owner and 

				(type(carshop.level) == 'string' and 
				carshop.level == job.grade)
							or 
				(type(carshop.level) == 'table' and 
				carshop.level[job.grade])
			);
		elseif (carshop.ownerType == 'player') then 
			local Ids = GetIdentifiers(player);

			return (
				Ids and 
				Ids.steam and 
				Ids.steam == carshop.owner
			);
		end 
	end 

	return false;
end 

function getCarshopVehicles(carshopId, callback)
	if (not carshopId or not callback) then 
		return;
	end 

	MySQL.Async.fetchAll(
		'SELECT * FROM carshop__shops WHERE id = @id LIMIT 1',
		{ id = carshopId }, 
		function(result)
			if (result and result[1]) then 
				callback(result[1]);
			else 
				callback(false);
			end 
		end
	);
end 

ESX.RegisterServerCallback('sCarshop:getCarshopVehicles', function(source, callback, carshopId)
	getCarshopVehicles(carshopId, function(result)
		callback(result);
	end);
end);

ESX.RegisterServerCallback('sCarshop:hasPermissionToCarshop', function(source, callback, carshopIndex)
	callback(
		hasPermissionToCarshop(carshopIndex, source)
	);
end);

local Identities = {
    steam = true
};

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
            playerIds[idType] = v;
        end 
    end

    return playerIds;
end 