--------------------------------
------- Created by Hamza -------
------ Reworked by D4NDI -------
--------------------------------

ESX = nil

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end
	while ESX.GetPlayerData().job == nil do
		Citizen.Wait(10)
	end
	PlayerData = ESX.GetPlayerData()
end)

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
	ESX.PlayerData = xPlayer
end)

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
	ESX.PlayerData.job = job
end)

-- Function for 3D text:
function DrawText3Ds(x,y,z, text)
    local onScreen,_x,_y=World3dToScreen2d(x,y,z)
    local px,py,pz=table.unpack(GetGameplayCamCoords())

    SetTextScale(0.32, 0.32)
    SetTextFont(4)
    SetTextProportional(1)
    SetTextColour(255, 255, 255, 255)
    SetTextEntry("STRING")
    SetTextCentre(1)
    AddTextComponentString(text)
    DrawText(_x,_y)
    local factor = (string.len(text)) / 500
    DrawRect(_x,_y+0.0125, 0.015+ factor, 0.03, 0, 0, 0, 80)
end

-- Blip on Map for Car Garages:
Citizen.CreateThread(function()
	if Config.EnableCarGarageBlip == true then	
		for k,v in pairs(Config.CarZones) do
			for i = 1, #v.Pos, 1 do
				local blip = AddBlipForCoord(v.Pos[i].x, v.Pos[i].y, v.Pos[i].z)
				SetBlipSprite(blip, Config.CarGarageSprite)
				SetBlipDisplay(blip, Config.CarGarageDisplay)
				SetBlipScale  (blip, Config.CarGarageScale)
				SetBlipColour (blip, Config.CarGarageColour)
				SetBlipAsShortRange(blip, true)
				BeginTextCommandSetBlipName("STRING")
				AddTextComponentString(Config.CarGarageName)
				EndTextCommandSetBlipName(blip)
			end
		end
	end	
end)

-- Blip on Map for Heli Garages:
Citizen.CreateThread(function()
	if Config.EnableHeliGarageBlip == true then
		for k,v in pairs(Config.HeliZones) do
			for i = 1, #v.Pos, 1 do
				local blip = AddBlipForCoord(v.Pos[i].x, v.Pos[i].y, v.Pos[i].z)
				SetBlipSprite(blip, Config.HeliGarageSprite)
				SetBlipDisplay(blip, Config.HeliGarageDisplay)
				SetBlipScale  (blip, Config.HeliGarageScale)
				SetBlipColour (blip, Config.HeliGarageColour)
				SetBlipAsShortRange(blip, true)
				BeginTextCommandSetBlipName("STRING")
				AddTextComponentString(Config.HeliGarageName)
				EndTextCommandSetBlipName(blip)
			end
		end
	end
end)

-- Blip on Map for Boat Garages:
Citizen.CreateThread(function()
	if Config.EnableBoatGarageBlip == true then
		for k,v in pairs(Config.BoatZones) do
			for i = 1, #v.Pos, 1 do
				local blip = AddBlipForCoord(v.Pos[i].x, v.Pos[i].y, v.Pos[i].z)
				SetBlipSprite(blip, Config.BoatGarageSprite)
				SetBlipDisplay(blip, Config.BoatGarageDisplay)
				SetBlipScale  (blip, Config.BoatGarageScale)
				SetBlipColour (blip, Config.BoatGarageColour)
				SetBlipAsShortRange(blip, true)
				BeginTextCommandSetBlipName("STRING")
				AddTextComponentString(Config.BoatGarageName)
				EndTextCommandSetBlipName(blip)
			end
		end
	end
end)

local insideMarker = false

-- Core Thread Function:
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(5)
		local coords = GetEntityCoords(PlayerPedId())
		local veh = GetVehiclePedIsIn(PlayerPedId(), false)
		local pedInVeh = IsPedInAnyVehicle(PlayerPedId(), true)
		
		if (ESX.PlayerData.job and ESX.PlayerData.job.name == Config.MiragliaDatabaseName) then
			for k,v in pairs(Config.CarZones) do
				for i = 1, #v.Pos, 1 do
					local distance = Vdist(coords, v.Pos[i].x, v.Pos[i].y, v.Pos[i].z)
					if (distance < 10.0) and insideMarker == false then
						DrawMarker(Config.MiragliaCarMarker, v.Pos[i].x, v.Pos[i].y, v.Pos[i].z-0.97, 0.0, 0.0, 0.0, 0.0, 0, 0.0, Config.MiragliaCarMarkerScale.x, Config.MiragliaCarMarkerScale.y, Config.MiragliaCarMarkerScale.y, Config.MiragliaCarMarkerColor.r,Config.MiragliaCarMarkerColor.g,Config.MiragliaCarMarkerColor.b,Config.MiragliaCarMarkerColor.a, false, true, 2, true, false, false, false)						
					end
					if (distance < 2.5 ) and insideMarker == false then
						DrawText3Ds(v.Pos[i].x, v.Pos[i].y, v.Pos[i].z, Config.CarDraw3DText)
						if IsControlJustPressed(0, Config.KeyToOpenCarGarage) then
							PoliceGarage('car')
							insideMarker = true
							Citizen.Wait(500)
						end
					end
				end
			end

			for k,v in pairs(Config.HeliZones) do
				for i = 1, #v.Pos, 1 do
					local distance = Vdist(coords, v.Pos[i].x, v.Pos[i].y, v.Pos[i].z)
					if (distance < 10.0) and insideMarker == false then
						DrawMarker(Config.MiragliaHeliMarker, v.Pos[i].x, v.Pos[i].y, v.Pos[i].z-0.95, 0.0, 0.0, 0.0, 0.0, 0, 0.0, Config.MiragliaHeliMarkerScale.x, Config.MiragliaHeliMarkerScale.y, Config.MiragliaHeliMarkerScale.z, Config.MiragliaHeliMarkerColor.r,Config.MiragliaHeliMarkerColor.g,Config.MiragliaHeliMarkerColor.b,Config.MiragliaHeliMarkerColor.a, false, true, 2, true, false, false, false)						
					end
					if (distance < 3.0 ) and insideMarker == false then
						DrawText3Ds(v.Pos[i].x, v.Pos[i].y, v.Pos[i].z, Config.HeliDraw3DText)
						if IsControlJustPressed(0, Config.KeyToOpenHeliGarage) then
							PoliceGarage('helicopter')
							insideMarker = true
							Citizen.Wait(500)
						end
					end
				end
			end

			for k,v in pairs(Config.BoatZones) do
				for i = 1, #v.Pos, 1 do
					local distance = Vdist(coords, v.Pos[i].x, v.Pos[i].y, v.Pos[i].z)
					if (distance < 20.0) and insideMarker == false then
						DrawMarker(Config.MiragliaBoatMarker, v.Pos[i].x, v.Pos[i].y, v.Pos[i].z, 0.0, 0.0, 0.0, 0.0, 0, 0.0, Config.MiragliaBoatMarkerScale.x, Config.MiragliaBoatMarkerScale.y, Config.MiragliaBoatMarkerScale.z, Config.MiragliaBoatMarkerColor.r,Config.MiragliaBoatMarkerColor.g,Config.MiragliaBoatMarkerColor.b,Config.MiragliaBoatMarkerColor.a, false, true, 2, true, false, false, false)						
					end
					if (distance < 3.0 ) and insideMarker == false then
						DrawText3Ds(v.Pos[i].x, v.Pos[i].y, v.Pos[i].z, Config.BoatDraw3DText)
						if IsControlJustPressed(0, Config.KeyToOpenBoatGarage) then
							PoliceGarage('boat')
							insideMarker = true
							Citizen.Wait(500)
						end
					end
				end
			end
		end
	end
end)

-- Police Garage Menu:
PoliceGarage = function(type)
	local elements = {
		{ label = Config.LabelStoreVeh, action = "store_vehicle" },
		{ label = Config.LabelGetVeh, action = "get_vehicle" },
	}
	
	ESX.UI.Menu.Open('default', GetCurrentResourceName(), "vrain_MiragliaGarage_menu",
		{
			title    = Config.TitleMiragliaGarage,
			align    = "center",
			elements = elements
		},
	function(data, menu)
		menu.close()
		local action = data.current.action
		if action == "get_vehicle" then
			if type == 'car' then
				VehicleMenu('car')
			elseif type == 'helicopter' then
				VehicleMenu('helicopter')
			elseif type == 'boat' then
				VehicleMenu('boat')
			end
		elseif data.current.action == 'store_vehicle' then
			local veh,dist = ESX.Game.GetClosestVehicle(playerCoords)
			if dist < 3 then
				DeleteEntity(veh)
				exports['vrain_notify']:showNotify(Config.VehicleParked, 'info', 4000)
			else
				exports['vrain_notify']:showNotify(Config.NoVehicleNearby, 'info', 4000)
			end
			insideMarker = false
		end
	end, function(data, menu)
		menu.close()
		insideMarker = false
	end, function(data, menu)
	end)
end

-- Vehicle Spawn Menu:
VehicleMenu = function(type)
	local storage = nil
	local elements = {}
	local ped = GetPlayerPed(-1)
	local playerPed = PlayerPedId()
	local pos = GetEntityCoords(ped)
	
	if type == 'car' then
		for k,v in pairs(Config.MiragliaVehicles) do
			table.insert(elements,{label = v.label, name = v.label, model = v.model, price = v.price, type = 'car'})
		end
	elseif type == 'helicopter' then
		for k,v in pairs(Config.MiragliaHelicopters) do
			table.insert(elements,{label = v.label, name = v.label, model = v.model, price = v.price, type = 'helicopter'})
		end
	elseif type == 'boat' then
		for k,v in pairs(Config.MiragliaBoats) do
			table.insert(elements,{label = v.label, name = v.label, model = v.model, price = v.price, type = 'boat'})
		end
	end
		
	ESX.UI.Menu.Open('default', GetCurrentResourceName(), "vrain_MiragliaGarage_vehicle_garage",
		{
			title    = Config.TitleMiragliaGarage,
			align    = "center",
			elements = elements
		},
	function(data, menu)
		menu.close()
		insideMarker = false
		VehicleLoadTimer(data.current.model)
		local veh = CreateVehicle(data.current.model,pos.x,pos.y,pos.z,GetEntityHeading(playerPed),true,false)
		
		SetPedIntoVehicle(GetPlayerPed(-1),veh,-1)
		local vehicle = GetVehiclePedIsIn(playerPed, false)
		ESX.Game.SetVehicleProperties(vehicle, {
        plate = 'MIRA',
        modXenon = true, 
		modEngine = 3, 
		modBrakes = 2, 
		modTransmission = 2, 
		modSuspension = 3, 
		modTurbo = true, 
		modLivery = 0
		})
		
		SetVehicleExtra (vehicle, 1, true)
		SetVehicleExtra (vehicle, 2, true)
		SetVehicleExtra (vehicle, 3, true)
		SetVehicleExtra (vehicle, 4, true)
		SetVehicleExtra (vehicle, 5, true)
		SetVehicleExtra (vehicle, 6, true)
		SetVehicleExtra (vehicle, 7, true)
		SetVehicleExtra (vehicle, 8, true)
		SetVehicleExtra (vehicle, 9, true)
		SetVehicleExtra (vehicle, 10, true)
		SetVehicleExtra (vehicle, 11, true)
		SetVehicleExtra (vehicle, 12, true)
		SetVehicleCustomPrimaryColour (vehicle, 0, 0, 0)
		
		if type == 'car' then
			exports['vrain_notify']:showNotify(Config.CarOutFromPolGar, 'info', 4000)
		elseif type == 'helicopter' then
			ESX.ShowNotification(Config.HeliOutFromPolGar)
		elseif type == 'boat' then
			ESX.ShowNotification(Config.BoatOutFromPolGar)
		end
		
		TriggerEvent("fuel:setFuel",veh,100.0)
		SetVehicleDirtLevel(veh, 0.1)	
	end, function(data, menu)
		menu.close()
		insideMarker = false
	end, function(data, menu)
	end)
end

-- Load Timer Function for Vehicle Spawn:
function VehicleLoadTimer(modelHash)
	modelHash = (type(modelHash) == 'number' and modelHash or GetHashKey(modelHash))

	if not HasModelLoaded(modelHash) then
		RequestModel(modelHash)

		while not HasModelLoaded(modelHash) do
			Citizen.Wait(0)
			DisableAllControlActions(0)

			drawLoadingText(Config.VehicleLoadText, 255, 255, 255, 255)
		end
	end
end

-- Loading Text for Vehicles Function:
function drawLoadingText(text, red, green, blue, alpha)
	SetTextFont(4)
	SetTextScale(0.0, 0.5)
	SetTextColour(red, green, blue, alpha)
	SetTextDropshadow(0, 0, 0, 0, 255)
	SetTextDropShadow()
	SetTextOutline()
	SetTextCentre(true)

	BeginTextCommandDisplayText('STRING')
	AddTextComponentSubstringPlayerName(text)
	EndTextCommandDisplayText(0.5, 0.5)
end