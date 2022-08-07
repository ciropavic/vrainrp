ESX                = nil
local playervehiclelist = {}
local fistReque = true

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

-- Event to evaluate where should every vehicle be saved in the table.
RegisterServerEvent('esx_jb_stopvehicledespawn:savevehicle')
AddEventHandler('esx_jb_stopvehicledespawn:savevehicle', function(id, model, x, y, z, heading, vehicleProps)
	local vehiclestable = LoadVehiclesFile()
	saveVehicleToFile(id, model, x, y, z, heading, vehicleProps)
end)

RegisterServerEvent('esx_jb_stopvehicledespawn:getvehicletable')
AddEventHandler('esx_jb_stopvehicledespawn:getvehicletable', function()
	local _source = source
	local vehiclelist = LoadVehiclesFile()

	for vehicleid, vehicle in pairs(vehiclelist) do
		networkid = tonumber(vehicleid)
		vehentityid = NetworkGetEntityFromNetworkId(networkid)
		if not DoesEntityExist(vehentityid) and not fistReque then
			Wait(200)
			--print("user kérés, id kérés:" .. networkid .. " entity" .. vehentityid .. " ")
			TriggerClientEvent('esx_jb_stopvehicledespawn:vehiclecheck', _source, networkid, vehicle)
		elseif not DoesEntityExist(vehentityid) and fistReque then
			Wait(5000)
			--print("első start, id kérés:" .. networkid .. " entity" .. vehentityid .. "")
			TriggerClientEvent('esx_jb_stopvehicledespawn:vehiclecheck', _source, networkid, vehicle)
			--TriggerEvent('esx_jb_stopvehicledespawn:MakeNewNetworkedCar', _source, networkid)
		end
	end
	fistReque = false
end)

RegisterServerEvent("esx_jb_stopvehicledespawn:replacevehicleid")
AddEventHandler("esx_jb_stopvehicledespawn:replacevehicleid", function(oldid, newid)
	replacevehicleid(oldid, newid)
end)

RegisterServerEvent("esx_jb_stopvehicledespawn:MakeNewNetworkedCar")
AddEventHandler("esx_jb_stopvehicledespawn:MakeNewNetworkedCar", function(targetclient, oldid)
	--print("jött: " .. source .. " target: " .. targetclient)
	local vehiclelist = LoadVehiclesFile()
	oldid = tostring(oldid)
	--print(targetclient .. " " .. oldid)
	if vehiclelist[oldid] ~= nil then
		TriggerClientEvent("esx_jb_stopvehicledespawn:SpawnNewNetworkedCar", targetclient, vehiclelist[oldid])
		deleteVehicleId(oldid)
	end
end)


RegisterServerEvent("esx_jb_stopvehicledespawn:vehicleenteredingarage")
AddEventHandler("esx_jb_stopvehicledespawn:vehicleenteredingarage", function(networkid)
	local _source = source
	local vehiclelist = LoadVehiclesFile()
	networkid = tostring(networkid)
	if vehiclelist[networkid] ~= nil then
		deleteVehicleId(networkid)
	end
end)

RegisterServerEvent("esx_jb_stopvehicledespawn:deleteFromListAndPutInPound")
AddEventHandler("esx_jb_stopvehicledespawn:deleteFromListAndPutInPound", function(networkid)
	local vehiclelist = LoadVehiclesFile()
	networkid = tostring(networkid)
	if vehiclelist[networkid] ~= nil then
		for k,v in pairs (playervehiclelist) do
			local vehprop = json.decode(v.vehicle)
			if string.upper(vehprop.plate) == string.upper(vehiclelist[networkid].vehicleProps.plate) then
				MySQL.Async.execute(
					"UPDATE owned_vehicles set state = 1, pounded = 1 where plate = @plate and owner = @identifier",
					{
						['@identifier'] = v.owner,
						['@plate'] = v.plate
					}
				)
				break
			end
		end
		deleteVehicleId(networkid)
	end
end)


ESX.RegisterServerCallback('getplatelist', function(source, cb)
	local platelist = {}
	MySQL.Async.fetchAll('SELECT * FROM owned_vehicles',{},function(vehicleplatelist)
			playervehiclelist = vehicleplatelist
			for k,v in pairs(vehicleplatelist) do
				local vehprop = json.decode(v.vehicle)
				local plate = vehprop.plate
				plate = tostring(plate)
				platelist[plate] = true
			end
		cb(platelist)
	end)
end)
