local pendingAdmingVehicleCreation = {};

-- Vegleges jarmu letrehozas

TriggerEvent("es:addGroupCommand", 'makeveh', 'superadmin', function(source, args, user)
	local targetPlayer = tonumber(args[1]);
	local vehicleName = args[2];

	if ( targetPlayer and GetPlayerName(targetPlayer) ) then 
		pendingAdmingVehicleCreation[source] = targetPlayer;
		TriggerClientEvent('sCarshop:adminMakeVehicle', source, vehicleName);
	else 
		TriggerClientEvent('chat:addMessage', source, { args = { "^1[SAS]:^7 ", "Nem találtam a játékost." }, type = 'warning' });
	end 
end);

RegisterServerEvent('skVehicleshop:setAdminVehicleOwned')
AddEventHandler('skVehicleshop:setAdminVehicleOwned', function(vehicleProps)
	if (pendingAdmingVehicleCreation[source]) then 
		local target = pendingAdmingVehicleCreation[source];
		local _source = source;
		local xPlayer = ESX.GetPlayerFromId(target);

		MySQL.Async.execute('INSERT INTO owned_vehicles (owner, plate, vehicle) VALUES (@owner, @plate, @vehicle)',
		{
			['@owner']   = xPlayer.identifier,
			['@plate']   = vehicleProps.plate,
			['@vehicle'] = json.encode(vehicleProps)
		}, function(rowsChanged)
			xPlayer.showNotification('Sikeresen létrehoztad a járművet.');
		end);
	end 
end);

-- Vegleges jarmu torles

local pendingVehicleDeletions = {};

TriggerEvent("es:addGroupCommand", 'permdv', 'superadmin', function(source, args, user)
	if ( not pendingVehicleDeletions[source] ) then 
		pendingVehicleDeletions[source] = true;
		TriggerClientEvent('sCarshop:deleteVehiclePermanent', source);
	end 
end);

RegisterServerEvent('sCarshop:deleteVehiclePermanent');
AddEventHandler('sCarshop:deleteVehiclePermanent', function(vehicleProps)
	local xPlayer = ESX.GetPlayerFromId(source);
	if (xPlayer and pendingVehicleDeletions[source]) then 
		local job = pendingVehicleDeletions[source];

		local query = [[
			DELETE FROM
				owned_vehicles
			WHERE 
				plate = @plate
			LIMIT 1
		]]

		MySQL.Async.execute(query,
		{
			plate = vehicleProps.plate,
		}, function(rowsChanged)
			xPlayer.showNotification('Sikeresen törölted a járművet.');
		end);

		pendingVehicleDeletions[source] = nil;
	end 
end);

-- Kocsi frakcikhoz adasa

local pendingVehicleJobParse = {};
local disallowedJobs = {
	unemployed = true,
	trucker = true,
	garbage = true,
};

TriggerEvent("es:addGroupCommand", 'setvehjob', 'superadmin', function(source, args, user)
	local job = args[1];

	if ( job and not disallowedJobs[job] ) then 
		pendingVehicleJobParse[source] = job;
		TriggerClientEvent('sCarshop:setVehicleToJob', source);
	else 
		TriggerClientEvent('chat:addMessage', source, { args = { "^1[SAS]:^7 ", "/setvehjob [Job neve]" }, type = 'warning' });
	end 
end);

RegisterServerEvent('skVehicleshop:setVehicleToJob');
AddEventHandler('skVehicleshop:setVehicleToJob', function(vehicleProps)
	local xPlayer = ESX.GetPlayerFromId(source);
	if (xPlayer and pendingVehicleJobParse[source]) then 
		local job = pendingVehicleJobParse[source];

		local query = [[
			UPDATE
				`owned_vehicles`
			SET 
				`job` = %s
			WHERE
				`plate` = @plate
			LIMIT 1
		]]

		query = query:format(
			(job and job ~= 'null') and ("'"..job.."'") or 'NULL'
		);

		local plate = vehicleProps.plate:gsub(' ', '-');

		MySQL.Async.execute(query,
		{
			plate = plate,
			job = job,
		}, function(rowsChanged)
			xPlayer.showNotification('Sikeresen hozzáadtad a járművet a frakcióhoz.');
		end);

		pendingVehicleJobParse[source] = nil;
	end 
end);