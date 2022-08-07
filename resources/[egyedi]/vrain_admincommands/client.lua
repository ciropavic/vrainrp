ESX = nil

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end
end)

RegisterNetEvent('nl:fix')
AddEventHandler('nl:fix', function()
    local ped = GetPlayerPed(-1)
	local playerPed = GetPlayerPed(-1)
	if IsPedInAnyVehicle(playerPed, false) then
		local car = GetVehiclePedIsUsing(ped)
		SetVehicleFixed(car)
	end
end)

RegisterNetEvent('nl:clean')
AddEventHandler('nl:clean', function()
	local playerPed = GetPlayerPed(-1)
	if IsPedInAnyVehicle(playerPed, false) then
		local vehicle = GetVehiclePedIsIn(playerPed, false)
		SetVehicleDirtLevel(vehicle, 0)
	end
end)