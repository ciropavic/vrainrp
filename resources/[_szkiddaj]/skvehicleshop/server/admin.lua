local pendingAdmingVehicleCreation = {};

-- Vegleges jarmu letrehozas

exports.vAdmin:addCommand(
    "makeveh", 
    {
        description = "Közeli járművek törlése.", 
        required = { admin = 6, off_admin = 6 }, 
        args = { 
            { type = "player" },
            { type = "string", name = "Model" },
        },
    }, 
    function(player, targetPlayer, model)
        pendingAdmingVehicleCreation[player.__netId] = targetPlayer.__netId;
        TriggerClientEvent('skVehicleShop:adminMakeVehicle', player.__netId, model);
    end
);

RegisterServerEvent('skVehicleshop:setAdminVehicleOwned')
AddEventHandler('skVehicleshop:setAdminVehicleOwned', function(vehicleProps)
	print("ASD3")
	if (pendingAdmingVehicleCreation[source]) then 
		local target = pendingAdmingVehicleCreation[source];
		local _source = source;
		local xPlayer = ESX.GetPlayerFromId(target);
		print("ASD4", _source, vehicleProps.plate, xPlayer.getIdentifier())
		
		MySQL.Async.execute('INSERT INTO owned_vehicles (owner, plate, vehicle) VALUES (@owner, @plate, @vehicle)',
		{
			['@owner']   = xPlayer.getIdentifier(),
			['@plate']   = vehicleProps.plate,
			['@vehicle'] = json.encode(vehicleProps)
		}, function(rowsChanged)
			print("ASD5")
			xPlayer.showNotification('Sikeresen létrehoztad a járművet.');
		end);
	end 
end);

-- Vegleges jarmu torles

exports.vAdmin:addCommand(
    "permdv", 
    {
        description = "Közeli járművek törlése.", 
        required = { admin = 6, off_admin = 6 }, 
        args = { 
            { type = "string", name = "Rendszám (Szóközök helyett `-` használj!)" }
        },
    }, 
    function(player, plate)
		MySQL.Async.execute(
			[[
				DELETE FROM 
					owned_vehicles
				WHERE 
					plate = @plate
				LIMIT 1
			]],
			{
				plate = plate,
			}, 
			function(rows)
				if (rows and rows > 0) then 
					exports.vChat:outputChatBox(player.__netId, "Kész, most egy /delveh-t az autónál hogy törölje, kösz!");
				end 
			end
		);
    end
);

-- Kocsi frakcikhoz adasa

local pendingVehicleJobParse = {};
local disallowedJobs = {
	unemployed = true,
	trucker = true,
	garbage = true,
};

exports.vAdmin:addCommand(
    "setvehjob", 
    {
        description = "Közeli járművek törlése.", 
        required = { admin = 6, off_admin = 6 }, 
        args = { 
            { type = "string", name = "Job" }
        },
    }, 
    function(player, job)
        if (job and not disallowedJobs[job]) then 
			pendingVehicleJobParse[player.__netId] = job;
			TriggerClientEvent('skVehicleShop:setVehicleToJob', player.__netId);
		else 
			exports.vChat:outputChatBox(player.__netId, "Erre a jobra nem lehet járművet írni.", "error", "error");
		end 
    end
);

RegisterServerEvent('skVehicleshop:setVehicleToJob');
AddEventHandler('skVehicleshop:setVehicleToJob', function(vehicleProps)
	local player = source;
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

		MySQL.Async.execute(query,
		{
			plate = vehicleProps.plate,
			job = job,
		}, function(rowsChanged)
			-- xPlayer.showNotification('Sikeresen hozzáadtad a járművet a frakcióhoz.');
			exports.vChat:outputChatBox(player, "Sikeresen hozzáadtad a járművet a frakcióhoz.", "success", "success");
		end);

		pendingVehicleJobParse[source] = nil;
	end 
end);