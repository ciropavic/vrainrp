ESX						= nil
local GUI				= {}
local PlayerData		= {}
local playervehiclesplates = {}


Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(10)
	end

	ESX.TriggerServerCallback('getplatelist', function(platelist)
		playervehiclesplates = platelist
	end)
end)

function savevehtofile(vehicle)
	local vehicleProps  = ESX.Game.GetVehicleProperties(vehicle)
	local plate = vehicleProps.plate
	plate = tostring(plate)
	
	local model = vehicleProps.model
	local x,y,z = table.unpack(GetEntityCoords(vehicle))
	local heading = GetEntityHeading(vehicle)
	
	networkid = NetworkGetNetworkIdFromEntity(vehicle)
	SetNetworkIdCanMigrate(networkid, true)
	SetNetworkIdExistsOnAllMachines(networkid, true)
	if playervehiclesplates[plate] then
		TriggerServerEvent('esx_jb_stopvehicledespawn:savevehicle', networkid, model, x, y, z, heading, vehicleProps)
	end
end

if saveOnEnter then
	Citizen.CreateThread(function()
		local inVehicle = false
		while true do
			local playerPed = GetPlayerPed(-1)
			if IsPedInAnyVehicle(playerPed) then
				local vehicle =GetVehiclePedIsIn(playerPed,false)
				if GetPedInVehicleSeat(vehicle, -1) == playerPed then
					if not inVehicle then
						savevehtofile(vehicle)
						inVehicle = true
					end
				else
					inVehicle = false
				end
				
			else
				inVehicle = false
			end
			Citizen.Wait(500)
		end
	end)
end

Citizen.CreateThread(function()
	local vehicle = 0
	local inVeh = false
	while true do
		local playerPed = GetPlayerPed(-1)
		if IsPedInAnyVehicle(playerPed) then
			local vehicle = GetVehiclePedIsIn(playerPed,false)
			if GetPedInVehicleSeat(vehicle, -1) == playerPed then
				inVeh = true
				savevehtofile(vehicle)
				SetVehicleHasBeenOwnedByPlayer(vehicle, true)
			else
				inVeh = false
			end
		elseif saveOnExit then
			if inVeh then
				local vehicle = GetVehiclePedIsIn(playerPed, true)
				savevehtofile(vehicle)
			end
			inVeh = false
		end

		Citizen.Wait(intervals.save*1000)
	end
end)

RegisterNetEvent('esx_jb_stopvehicledespawn:vehiclecheck')
AddEventHandler('esx_jb_stopvehicledespawn:vehiclecheck', function(networkid, vehicle)
	local players = ESX.Game.GetPlayersInArea(vector3(vehicle.x, vehicle.y, vehicle.z), 90.0)
	for i = 1, #players, 1 do
		TriggerServerEvent('esx_jb_stopvehicledespawn:MakeNewNetworkedCar', GetPlayerServerId(players[i]), networkid)
		--print(i .. " " .. players[i] .. " " .. GetPlayerServerId(players[i]) .. " - " .. GetPlayerName(players[i]) .. " : " .. GetPlayerIndex())
		break
	end
end)

RegisterNetEvent('esx_jb_stopvehicledespawn:SpawnNewNetworkedCar')
AddEventHandler('esx_jb_stopvehicledespawn:SpawnNewNetworkedCar', function(vehicle)
	local model = tonumber(vehicle.model)
	print("spawning...")
	ESX.Game.SpawnVehicle(model, {
	x = tonumber(vehicle.x),
	y = tonumber(vehicle.y),
	z = tonumber(vehicle.z)
	},tonumber(vehicle.heading), function(callback_vehicle)
		ESX.Game.SetVehicleProperties(callback_vehicle, vehicle.vehicleProps)
		SetVehicleOnGroundProperly(callback_vehicle)
		SetVehicleNeedsToBeHotwired(callback_vehicle, false)
		
		SetVehicleHasBeenOwnedByPlayer(callback_vehicle, true)

		--Close car when spawned
		SetVehicleDoorShut(callback_vehicle, 0, false)
		SetVehicleDoorShut(callback_vehicle, 1, false)
		SetVehicleDoorShut(callback_vehicle, 2, false)
		SetVehicleDoorShut(callback_vehicle, 3, false)
		SetVehicleDoorsLocked(callback_vehicle, 2)

		savevehtofile(callback_vehicle)
	end)
end)

Citizen.CreateThread(function()
	while true do
		if ESX == nil or not ESX.IsPlayerLoaded() then
			Citizen.Wait(200)
		else
			TriggerServerEvent('esx_jb_stopvehicledespawn:getvehicletable')
			Citizen.Wait(intervals.check*1000)
		end
	end
end)

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
  	if GetNumberOfPlayers() == 1 then
    	TriggerServerEvent("esx_jb_stopvehicledespawn:getvehicletable")
		ESX.TriggerServerCallback('euk-carlock:requestPlayerCars', function(isOwnedVehicle)
		end)
  	end
end)
