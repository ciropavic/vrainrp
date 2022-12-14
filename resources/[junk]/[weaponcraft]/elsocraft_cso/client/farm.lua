local spawnedfarms = 0
local farmPlants = {}
local isPickingUp, isProcessing = false, false

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(500)
		local coords = GetEntityCoords(PlayerPedId())

		if GetDistanceBetweenCoords(coords, Config.CircleZones.FarmField.coords, true) < 50 then
			SpawnfarmPlants()
		end
	end
end)

function Processfarm(xfarm)
	isProcessing = true
	ESX.ShowNotification(_U('farm_processingstarted'))
  TriggerServerEvent('vrain_elsocraft:processfarm')
	if(xfarm <= 3) then
		xfarm = 0
	end
  local timeLeft = (Config.Delays.FarmProcessing * xfarm) / 1000
	local playerPed = PlayerPedId()

	while timeLeft > 0 do
		Citizen.Wait(1000)
		timeLeft = timeLeft - 1

		if GetDistanceBetweenCoords(GetEntityCoords(playerPed), Config.CircleZones.FarmProcessing.coords, false) > 4 then
			ESX.ShowNotification(_U('farm_processingtoofar'))
			TriggerServerEvent('vrain_elsocraft:cancelProcessing')
			TriggerServerEvent('vrain_elsocraft:outofbound')
			break
		end
	end

	isProcessing = false
end

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)

		local playerPed = PlayerPedId()
		local coords = GetEntityCoords(playerPed)
		local nearbyObject, nearbyID

		for i=1, #farmPlants, 1 do
			if GetDistanceBetweenCoords(coords, GetEntityCoords(farmPlants[i]), false) < 1 then
				nearbyObject, nearbyID = farmPlants[i], i
			end
		end

		if nearbyObject and IsPedOnFoot(playerPed) then
			if not isPickingUp then
				ESX.ShowHelpNotification(_U('farm_pickupprompt'))
			end

			if IsControlJustReleased(0, 38) and not isPickingUp then
				isPickingUp = true

				ESX.TriggerServerCallback('vrain_elsocraft:canPickUp', function(canPickUp)
					if canPickUp then
						exports.ox_inventory:Progress({
							duration = 60000,
							label = 'Alkatrész begyűjtése...',
							useWhileDead = false,
							canCancel = false,
							disable = {
								move = true,
								car = true,
								combat = true,
								mouse = false
							},
							anim = {
								dict = 'amb@prop_human_parking_meter@female@idle_a',
								clip = 'idle_b_female',
								flags = 49,
							},
						}, function(cancel)
							if not cancel then
								print("sikeres")
							end
						end)
						Citizen.Wait(60000)
						ClearPedTasks(playerPed)
						Citizen.Wait(1500)

						ESX.Game.DeleteObject(nearbyObject)

						table.remove(farmPlants, nearbyID)
						spawnedfarms = spawnedfarms - 1
						
						TriggerServerEvent('vrain_elsocraft:pickedUpfarm')
					else
						ESX.ShowNotification(_U('farm_inventoryfull'))
					end

					isPickingUp = false
				end, Config.Item1)
			end
		else
			Citizen.Wait(500)
		end
	end
end)

AddEventHandler('onResourceStop', function(resource)
	if resource == GetCurrentResourceName() then
		for k, v in pairs(farmPlants) do
			ESX.Game.DeleteObject(v)
		end
	end
end)

function SpawnfarmPlants()
	while spawnedfarms < 25 do
		Citizen.Wait(0)
		local farmCoords = GeneratefarmCoords()

		ESX.Game.SpawnLocalObject(Config.Prop, farmCoords, function(obj)
			PlaceObjectOnGroundProperly(obj)
			FreezeEntityPosition(obj, true)

			table.insert(farmPlants, obj)
			spawnedfarms = spawnedfarms + 1
		end)
	end
end

function ValidatefarmCoord(plantCoord)
	if spawnedfarms > 0 then
		local validate = true

		for k, v in pairs(farmPlants) do
			if GetDistanceBetweenCoords(plantCoord, GetEntityCoords(v), true) < 5 then
				validate = false
			end
		end

		if GetDistanceBetweenCoords(plantCoord, Config.CircleZones.FarmField.coords, false) > 50 then
			validate = false
		end

		return validate
	else
		return true
	end
end

function GeneratefarmCoords()
	while true do
		Citizen.Wait(1)

		local farmCoordX, farmCoordY

		math.randomseed(GetGameTimer())
		local modX = math.random(0, 5)

		Citizen.Wait(100)

		math.randomseed(GetGameTimer())
		local modY = math.random(0, 5)

		farmCoordX = Config.CircleZones.FarmField.coords.x + modX
		farmCoordY = Config.CircleZones.FarmField.coords.y + modY

		local coordZ = GetCoordZ(farmCoordX, farmCoordY)
		local coord = vector3(farmCoordX, farmCoordY, coordZ)

		if ValidatefarmCoord(coord) then
			return coord
		end
	end
end

function GetCoordZ(x, y)
	local groundCheckHeights = { 48.0, 49.0, 50.0, 51.0, 52.0, 53.0, 54.0, 55.0, 56.0, 57.0, 58.0 }

	for i, height in ipairs(groundCheckHeights) do
		local foundGround, z = GetGroundZFor_3dCoord(x, y, height)

		if foundGround then
			return z
		end
	end

	return 43.0
end
