local menuOpen = false
local inZoneDrugShop = false
local inRangeMarkerDrugShop = false
local cfgMarker = Config.Marker;

--slow loop
CreateThread(function()
	while true do
		local playerPed = PlayerPedId()
		local coords = GetEntityCoords(playerPed)
		local distDrugShop = #(coords - Config.CircleZones.DrugDealer.coords)

		inRangeMarkerDrugShop = false
		if(distDrugShop <= Config.Marker.Distance) then
			inRangeMarkerDrugShop = true
		end

		if distDrugShop < 1 then
			inZoneDrugShop = true
		else
			inZoneDrugShop = false
			if menuOpen then
				menuOpen=false
				ESX.UI.Menu.CloseAll()
			end
		end

		Wait(500)
	end
end)

--drawk marker
CreateThread(function()
	while true do 
		if(inRangeMarkerDrugShop) then
			local coordsMarker = Config.CircleZones.DrugDealer.coords
			local color = cfgMarker.Color
			DrawMarker(cfgMarker.Type, coordsMarker.x, coordsMarker.y,coordsMarker.z - 1.0,
			0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 
			cfgMarker.Size, color.r,color.g,color.b,color.a,
			false, true, 2, false, nil, nil, false)
		end
		Wait(0)
	end
end)

--main loop
CreateThread(function ()
	while true do 
		if inZoneDrugShop then
			if(not menuOpen) then
				ESX.ShowHelpNotification(_U('dealer_prompt'),true)
				if IsControlJustPressed(0, 38) then
					OpenDrugShop()
				end
			end
		end

		Wait(15)
	end
end)

function OpenDrugShop()
	ESX.UI.Menu.CloseAll()
	local elements = {}
	menuOpen = true

	for k, v in pairs(ESX.GetPlayerData().inventory) do
		local price = Config.DrugDealerItems[v.name]

		if price and v.count > 0 then
			table.insert(elements, {
				label = ('%s - <span style="color:green;">%s</span>'):format(v.label, _U('dealer_item', ESX.Math.GroupDigits(price))),
				name = v.name,
				price = price,

				-- menu properties
				type = 'slider',
				value = 1,
				min = 1,
				max = v.count
			})
		end
	end

	ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'drug_shop', {
		title    = _U('dealer_title'),
		align    = 'right',
		elements = elements
	}, function(data, menu)
		TriggerServerEvent('esx_drugs:sellDrug', data.current.name, data.current.value)
	end, function(data, menu)
		menu.close()
		menuOpen = false
	end)
end

AddEventHandler('onResourceStop', function(resource)
	if resource == GetCurrentResourceName() then
		if menuOpen then
			ESX.UI.Menu.CloseAll()
		end
	end
end)

function OpenBuyLicenseMenu(licenseName)
	menuOpen = true
	local license = Config.LicensePrices[licenseName]

	local elements = {
		{
			label = _U('license_no'),
			value = 'no'
		},

		{
			label = ('%s - <span style="color:green;">%s</span>'):format(license.label, _U('dealer_item', ESX.Math.GroupDigits(license.price))),
			value = licenseName,
			price = license.price,
			licenseName = license.label
		}
	}

	ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'license_shop', {
		title    = _U('license_title'),
		align    = 'right',
		elements = elements
	}, function(data, menu)

		if data.current.value ~= 'no' then
			ESX.TriggerServerCallback('esx_drugs:buyLicense', function(boughtLicense)
				if boughtLicense then
					ESX.ShowNotification(_U('license_bought', data.current.licenseName, ESX.Math.GroupDigits(data.current.price)))
				else
					ESX.ShowNotification(_U('license_bought_fail', data.current.licenseName))
				end
			end, data.current.value)
		else
			menu.close()
		end

	end, function(data, menu)
		menu.close()
		menuOpen = false
	end)
end

function CreateBlipCircle(coords, text, radius, color, sprite)
	local blip = AddBlipForRadius(coords, radius)

	SetBlipHighDetail(blip, true)
	SetBlipColour(blip, 1)
	SetBlipAlpha (blip, 128)

	-- create a blip in the middle
	blip = AddBlipForCoord(coords)

	SetBlipHighDetail(blip, true)
	SetBlipSprite (blip, sprite)
	SetBlipScale  (blip, 1.0)
	SetBlipColour (blip, color)
	SetBlipAsShortRange(blip, true)

	BeginTextCommandSetBlipName("STRING")
	AddTextComponentSubstringPlayerName(text)
	EndTextCommandSetBlipName(blip)
end

CreateThread(function()
	for k,zone in pairs(Config.CircleZones) do
		CreateBlipCircle(zone.coords, zone.name, zone.radius, zone.color, zone.sprite)
	end
end)

RegisterNetEvent('vrain_drugs:armour')
AddEventHandler('vrain_drugs:armour', function()
	local playerPed = GetPlayerPed(-1)
	exports['vrain_notify']:showNotify('Kaptál 5 kevlárt!', 'warn', 7000)
	AddArmourToPed(playerPed, 5)
	RequestAnimSet("MOVE_M@DRUNK@VERYDRUNK") 
	while not HasAnimSetLoaded("MOVE_M@DRUNK@VERYDRUNK") do
		Citizen.Wait(0)
	end
	TaskStartScenarioInPlace(playerPed, "WORLD_HUMAN_SMOKING_POT", 0, 1)
	Citizen.Wait(3000)
	ClearPedTasksImmediately(playerPed)
	SetTimecycleModifier("spectator6")
	SetPedMotionBlur(playerPed, true)
	SetPedMovementClipset(playerPed, "MOVE_M@DRUNK@VERYDRUNK", true)
	SetPedIsDrunk(playerPed, true)
	AnimpostfxPlay("ChopVision", 10000001, true)
	ShakeGameplayCam("DRUNK_SHAKE", 1.0)
	Citizen.Wait(15000)
	SetPedMoveRateOverride(PlayerId(),1.0)
	SetRunSprintMultiplierForPlayer(PlayerId(),1.0)
	SetPedIsDrunk(playerPed, false)		
	SetPedMotionBlur(playerPed, false)
	ResetPedMovementClipset(playerPed)
	AnimpostfxStopAll()
	ShakeGameplayCam("DRUNK_SHAKE", 0.0)
	SetTimecycleModifierStrength(0.0)
end)

RegisterNetEvent('vrain_drugs:smoke')
AddEventHandler('vrain_drugs:smoke', function()
	ExecuteCommand( "e smoke2" )
end)

RegisterNetEvent('kypo-drug-effect:onLsd')
AddEventHandler('kypo-drug-effect:onLsd', function()
	local playerPed = GetPlayerPed(-1)
	RequestAnimSet("MOVE_M@QUICK") 
	while not HasAnimSetLoaded("MOVE_M@QUICK") do
		Citizen.Wait(0)
	end
	exports['vrain_notify']:showNotify('Kaptál 30 kevlárt!', 'warn', 7000)
	AddArmourToPed(playerPed, 30)
	Citizen.Wait(3000)
	ClearPedTasksImmediately(playerPed)
	SetPedMotionBlur(playerPed, true)
	SetPedMovementClipset(playerPed, "MOVE_M@QUICK", true)
	SetPedIsDrunk(playerPed, true)
	SetTimecycleModifier("spectator5")
	AnimpostfxPlay("Rampage", 10000001, true)
	ShakeGameplayCam("DRUNK_SHAKE", 1.5)
	Citizen.Wait(15000)
	SetPedMoveRateOverride(PlayerId(),1.0)
	SetRunSprintMultiplierForPlayer(PlayerId(),1.0)
	SetPedIsDrunk(playerPed, false)		
	SetPedMotionBlur(playerPed, false)
	ResetPedMovementClipset(playerPed)
	AnimpostfxStopAll()
	ShakeGameplayCam("DRUNK_SHAKE", 0.0)
	SetTimecycleModifierStrength(0.0)
end)

RegisterNetEvent('kypo-drug-effect:onMeth')
AddEventHandler('kypo-drug-effect:onMeth', function()
	local playerPed = GetPlayerPed(-1)
	RequestAnimSet("move_m@drunk@slightlydrunk") 
	while not HasAnimSetLoaded("move_m@drunk@slightlydrunk") do
		Citizen.Wait(0)
	end
	exports['vrain_notify']:showNotify('Kaptál 50 kevlárt!', 'warn', 7000)
	AddArmourToPed(playerPed, 50)
	Citizen.Wait(3000)
	ClearPedTasksImmediately(playerPed)
	SetPedMotionBlur(playerPed, true)
	SetPedMovementClipset(playerPed, "move_m@drunk@slightlydrunk", true)
	SetPedIsDrunk(playerPed, true)
	SetTimecycleModifier("spectator5")
	AnimpostfxPlay("SuccessMichael", 10000001, true)
	ShakeGameplayCam("DRUNK_SHAKE", 1.5)
	Citizen.Wait(15000)
	SetPedMoveRateOverride(PlayerId(),1.0)
	SetRunSprintMultiplierForPlayer(PlayerId(),1.0)
	SetPedIsDrunk(playerPed, false)		
	SetPedMotionBlur(playerPed, false)
	ResetPedMovementClipset(playerPed)
	AnimpostfxStopAll()
	ShakeGameplayCam("DRUNK_SHAKE", 0.0)
	SetTimecycleModifierStrength(0.0)
end)