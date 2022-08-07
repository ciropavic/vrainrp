ESX = nil
CurrentVehicle = nil;

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

-- Blips
Citizen.CreateThread(function()	
	for k,v in pairs(locations) do

		local zoneblip = AddBlipForRadius(v.pos, 100.0)
		SetBlipColour(zoneblip, 2)
		SetBlipAlpha(zoneblip, 128)

    	local blip = AddBlipForCoord(v.pos)
		SetBlipSprite (blip, 225)
		SetBlipDisplay(blip, 4)
		SetBlipScale  (blip, 0.6)
		SetBlipColour (blip, 27)
		SetBlipAsShortRange(blip, true)
		BeginTextCommandSetBlipName("STRING")
		AddTextComponentString("~o~Jármübérlés")
		EndTextCommandSetBlipName(blip)
	end
end)


Citizen.CreateThread(function()
	while true do
		local pPed = GetPlayerPed(-1)
		local pCoords = GetEntityCoords(pPed)
		local pNear = false
		local pNearData = {}

		for k,v in pairs(locations) do
			if #(v.pos - pCoords) < 20 then
				pNear = true
				pNearData = v
				if #(v.pos - pCoords) < 3 then
					ESX.ShowHelpNotification(in_zone, true, false, 0)
					if IsControlJustReleased(1, 38) then
						if (CurrentVehicle ~= nil and DoesEntityExist(CurrentVehicle)) then 
							ESX.ShowNotification(already_has_vehicle, 1);
						else
							OpenLocationMenu(v)
						end 
					end
				end

				break -- Break look to improve perf
			end
		end

		if pNear then
			Wait(1)
			DrawMarker(36, pNearData.pos, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.5, 0.5, 0.5, 0, 255, 0, 170, 0, 1, 2, 0, nil, nil, 0)
		else
			Wait(500)
		end
	end
end)


local open = false
local menu = RageUI.CreateMenu("Bérlés", "~b~Jármübérlés")
menu.Closed = function()
    open = false
end


function OpenLocationMenu(self)
	if open then
		open = false
		return
	else
		CreatePreviewCam()
		RageUI.Visible(menu, true)
		exports.vChat:updateSetting("visible", false);
		FreezeEntityPosition(PlayerPedId(), true)
		open = true
		Citizen.CreateThread(function()
			while open do
				RageUI.IsVisible(menu, function()
					RageUI.Separator("↓ Válassz jármüvet ↓")
					for k,v in pairs(vehInLocation) do
						RageUI.Button(v.label..' [~g~'..v.price.."$~s~]", nil, {}, true, {
							onActive = function()
								UpdateCam(v.veh, self.preview.pos, self.preview.heading)
							end,
							onSelected = function()
								DeleteEntity(tempVeh)
								while DoesEntityExist(tempVeh) do Wait(500) end
								SpawnLocationVehicle(v.veh, k, self.outPos)
								open = false
							end,
						});
					end
				end)
				Wait(1)
			end

			exports.vChat:updateSetting("visible", true);
			FreezeEntityPosition(PlayerPedId(), false)
			RemoveCam()
		end)
	end
end


function SpawnLocationVehicle(veh, index, posPossible)
	ESX.ShowNotification(finding_spawn_pos, 0, 0)
	local pos = nil
	local free = false
	local possible = #posPossible
	local count = 0
	while not free do
		local choosen = posPossible[math.random(1, #posPossible)]
		count = count + 1
		if ESX.Game.IsSpawnPointClear(choosen.pos, 2) then
			pos = choosen
			free = true
		end
		if count >= possible then
			ESX.ShowNotification(no_place_possible, 0, 0)
			return
		end
		Wait(1)
	end

	RequestModel(GetHashKey(veh))
	while not HasModelLoaded(GetHashKey(veh)) do
		Wait(1)
	end


	CurrentVehicle = CreateVehicle(GetHashKey(veh), pos.pos, pos.heading, true, false)
	SetVehicleNumberPlateText(CurrentVehicle, "LOC-"..math.random(101,909))
	SetEntityAsMissionEntity(CurrentVehicle, 1, 1)

	TriggerServerEvent("esx_location:Buy", index)

	exports.vChat:updateSetting("visible", true);
	ESX.ShowNotification(vehicle_spawned, 1)
end