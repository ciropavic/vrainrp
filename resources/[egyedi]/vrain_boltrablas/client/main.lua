local HasAlreadyEnteredMarker, isInRobberyZone, isRobberyStarted, isRobberyDone, isPedArmed, loopAlarm = false, false, false, false, false, false
local LastZone, CurrentAction, CurrentActionMsg
local CurrentActionData	= {}
local blipRobbery = nil

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
	ESX.PlayerData = xPlayer
end)

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
    ESX.PlayerData.job = job
end)

-- Start Robbery Timer
RegisterNetEvent('esx_advancedholdup:startRobTimer')
AddEventHandler('esx_advancedholdup:startRobTimer', function(zone)
	isInRobberyZone, isRobberyDone, IsRobberyStarted, loopAlarm = true, false, true, true
	RobberyZoneEvents(zone)
	TriggerEvent('esx_advancedholdup:loopAlarm', zone)

	local timer = Config.Zones[zone].TimeToRob

	Citizen.CreateThread(function()
		while timer > 0 and isInRobberyZone do
			Citizen.Wait(1000)

			if (timer > 0) then
				timer = timer - 1
			end
		end
	end)

	Citizen.CreateThread(function()
		while timer > 0 and isInRobberyZone do
			Citizen.Wait(1)
			drawTxt(0.85, 0.50, 1.0,1.0,0.4, _U('rob_progress', timer), 255, 255, 255, 255)
		end
	end)
end)

-- Robbery Zone Events
function RobberyZoneEvents(zone)
	Citizen.CreateThread(function()
		while isInRobberyZone do
			Citizen.Wait(100)
			local playerCoords = GetEntityCoords(PlayerPedId())
			local zoneTable = Config.Zones[zone]
			local distance = #(playerCoords - zoneTable.Coords)

			if distance > zoneTable.AreaSize then
				isInRobberyZone	= false

				if not isRobberyDone then
					PlaySoundFrontend(-1, 'HACKING_FAILURE', 0, 1)
					TriggerServerEvent('esx_advancedholdup:robberyCanceled', zone, true)
					Citizen.Wait(1000)
					loopAlarm = false
					IsRobberyStarted = false
				end
			end
		end
	end)
end

-- Robbery Police Notification
RegisterNetEvent('esx_advancedholdup:robPoliceNotif')
AddEventHandler('esx_advancedholdup:robPoliceNotif', function(zone, coords)
	Citizen.Wait(1)
	local data = {displayCode = '211', description = 'Boltrabl??s elkezdve', isImportant = 0, recipientList = {'police', 'sheriff', 'deltaforce'}, length = '10000', infoM = 'fa-info-circle', info = zone}
	local dispatchData = {dispatchData = data, caller = 'Riaszt??', coords = coords}
	TriggerServerEvent('wf-alerts:svNotify', dispatchData)
end)

-- Robbery Complete Notification
RegisterNetEvent('esx_advancedholdup:robCompNotif')
AddEventHandler('esx_advancedholdup:robCompNotif', function()
	isRobberyDone = true
	IsRobberyStarted = false
	PlaySoundFrontend(-1, 'HACKING_SUCCESS', 0, 1)
	exports['vrain_notify']:showNotify(_U('rob_complete'), 'success', 10000)
	Citizen.Wait(20000)
	loopAlarm = false
end)

-- Robbery Complete At Notification
RegisterNetEvent('esx_advancedholdup:robCompAtNotif')
AddEventHandler('esx_advancedholdup:robCompAtNotif', function(zone, complete)
	Citizen.Wait(1)

	if complete then
		local data = {displayCode = '211', description = 'Boltrabl??s v??grehajtva', isImportant = 0, recipientList = {'police', 'sheriff', 'deltaforce'}, length = '10000', infoM = 'fa-info-circle', info = zone}
		local dispatchData = {dispatchData = data, caller = 'Riaszt??', coords = Config.Zones[zone].Coords}
		TriggerServerEvent('wf-alerts:svNotify', dispatchData)
	else
		local data = {displayCode = '211', description = 'Boltrabl??s nem siker??lt', isImportant = 0, recipientList = {'police', 'sheriff', 'deltaforce'}, length = '10000', infoM = 'fa-info-circle', info = zone}
		local dispatchData = {dispatchData = data, caller = 'Riaszt??', coords = Config.Zones[zone].Coords}
		TriggerServerEvent('wf-alerts:svNotify', dispatchData)
	end
end)

-- Loop Alarm
RegisterNetEvent('esx_advancedholdup:loopAlarm')
AddEventHandler('esx_advancedholdup:loopAlarm', function(zone)
	while loopAlarm do
		PlaySoundFromCoord(-1, 'scanner_alarm_os', Config.Zones[zone].Coords, 'dlc_xm_iaa_player_facility_sounds', 1, 100, 0)
		Citizen.Wait(1000)
	end
end)

-- Create Blip
RegisterNetEvent('esx_advancedholdup:createBlip')
AddEventHandler('esx_advancedholdup:createBlip', function(coords)
	blipRobbery = AddBlipForCoord(coords)
	SetBlipSprite(blipRobbery, 161)
	SetBlipScale(blipRobbery, 2.0)
	SetBlipColour(blipRobbery, 3)
	PulseBlip(blipRobbery)
end)

-- Remove Blip
RegisterNetEvent('esx_advancedholdup:removeBlip')
AddEventHandler('esx_advancedholdup:removeBlip', function()
	--Citizen.Wait(20000)
	RemoveBlip(blipRobbery)
end)

-- Entered Marker
AddEventHandler('esx_advancedholdup:hasEnteredMarker', function(zone)
	CurrentAction = 'start_robbery'
	CurrentActionMsg = _U('press_to_rob')
	CurrentActionData = {zone = zone} -- zone = zone
end)

-- Exited Marker
AddEventHandler('esx_advancedholdup:hasExitedMarker', function(zone)
	CurrentAction = nil
end)

-- Enter / Exit marker events & Draw Markers
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		local playerCoords = GetEntityCoords(PlayerPedId())
		local isInMarker, isEnoughPolice, letSleep, currentZone = false, false, true

		if IsPedArmed(PlayerPedId(), 4) then
			isPedArmed = true
			
			for k,v in pairs(Config.Zones) do
				local distance = #(playerCoords - v.Coords)

				if distance < Config.DrawDistance then
					letSleep = false

					if v.Marker.Type ~= -1 then
						DrawMarker(v.Marker.Type, v.Coords, 0.0, 0.0, 0.0, 0, 0.0, 0.0, v.Marker.x, v.Marker.y, v.Marker.z, v.Marker.r, v.Marker.g, v.Marker.b, 100, false, false, 2, false, false, false, false)
					end

					if distance < v.Marker.x then
						isInMarker, isEnoughPolice, currentZone = true, true, k
					end
				end
			end

			if (isInMarker and not HasAlreadyEnteredMarker and isEnoughPolice) or (isInMarker and LastZone ~= currentZone and isEnoughCops) then
				HasAlreadyEnteredMarker, LastZone = true, currentZone
				TriggerEvent('esx_advancedholdup:hasEnteredMarker', currentZone)
			end
		else
			isPedArmed = false
		end

		if (not isInMarker or not isEnoughPolice or not isPedArmed) and HasAlreadyEnteredMarker then
			HasAlreadyEnteredMarker = false
			TriggerEvent('esx_advancedholdup:hasExitedMarker', LastZone)
		end

		if not isPedArmed or letSleep then
			Citizen.Wait(500)
		end
	end
end)

-- Key Controls
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)

		if CurrentAction then
			ESX.ShowHelpNotification(CurrentActionMsg)

			if IsControlJustReleased(1, 38) and GetLastInputMethod(2) then
				if IsPedSittingInAnyVehicle(PlayerPedId()) then
					exports['vrain_notify']:showNotify(_U('rob_vehicle'), 'error', 10000)
				else
					if not IsRobberyStarted then
						ESX.TriggerServerCallback('esx_advancedholdup:checkRob', function(success)
							if success then
								local zone = CurrentActionData.zone
								TriggerServerEvent('esx_advancedholdup:robInProgress', zone)
							else
								exports['vrain_notify']:showNotify(_U('rob_cooldown'), 'error', 10000)
							end
						end)
					else
						exports['vrain_notify']:showNotify(_U('rob_in_prog'), 'error', 10000)
					end
				end

				CurrentAction = nil
			end
		else
			Citizen.Wait(500)
		end
	end
end)

-- Draw Text
function drawTxt(x, y, width, height, scale, text, r, g, b, a)
	SetTextFont(0)
	SetTextProportional(0)
	SetTextScale(scale, scale)
	SetTextColour(r, g, b, a)
	SetTextDropShadow(0, 0, 0, 0,255)
	SetTextEdge(1, 0, 0, 0, 255)
	SetTextDropShadow()
	SetTextOutline()
	SetTextEntry('STRING')
	AddTextComponentString(text)
	DrawText(x - width/2, y - height/2 + 0.005)
end
