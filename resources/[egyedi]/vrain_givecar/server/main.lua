ESX = nil
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

function givevehicle(_source, _args, vehicleType)
	if havePermission(_source) then
		if _args[1] == nil or _args[2] == nil then
			TriggerClientEvent('esx:showNotification', _source, '~r~/givevehicle playerID carModel [plate]')
		elseif _args[3] ~= nil then
			local playerName = GetPlayerName(_args[1])
			local plate = _args[3]
			if #_args > 3 then
				for i=4, #_args do
					plate = plate.." ".._args[i]
				end
			end	
			plate = string.upper(plate)
			TriggerClientEvent('esx_giveownedcar:spawnVehiclePlate', _source, _args[1], _args[2], plate, playerName, 'player', vehicleType)
		else
			local playerName = GetPlayerName(_args[1])
			TriggerClientEvent('esx_giveownedcar:spawnVehicle', _source, _args[1], _args[2], playerName, 'player', vehicleType)
		end
	else
		TriggerClientEvent('esx:showNotification', _source, '~r~You don\'t have permission to do this command!')
	end
end

--functions--

RegisterServerEvent('esx_giveownedcar:setVehicle')
AddEventHandler('esx_giveownedcar:setVehicle', function (vehicleProps, playerID, vehicleType)
	local _source = playerID
	local xPlayer = ESX.GetPlayerFromId(_source)

	MySQL.Async.execute('INSERT INTO owned_vehicles (owner, plate, vehicle, state, type, storedAt) VALUES (@owner, @plate, @vehicle, @state, @type, @storedAt)',
	{
		['@owner']   = xPlayer.identifier,
		['@plate']   = vehicleProps.plate,
		['@vehicle'] = json.encode(vehicleProps),
		['@state']  = 1,
		['type'] = vehicleType, 
		['@storedAt'] = os.time
	}, function ()
		if Config.ReceiveMsg then
			TriggerClientEvent('esx:showNotification', _source, _U('received_car', string.upper(vehicleProps.plate)))
		end
	end)
end)

RegisterServerEvent('esx_giveownedcar:printToConsole')
AddEventHandler('esx_giveownedcar:printToConsole', function(msg)
	print(msg)
end)

function havePermission(_source)
	local xPlayer = ESX.GetPlayerFromId(_source)
	local playerGroup = xPlayer.getGroup()
	local isAdmin = false
	for k,v in pairs(Config.AuthorizedRanks) do
		if v == playerGroup then
			isAdmin = true
			break
		end
	end
	
	if IsPlayerAceAllowed(_source, "giveownedcar.command") then isAdmin = true end
	
	return isAdmin
end
