trafficDensity = 0.0
pedDensity = 0.0
Citizen.CreateThread(function()
	while true do
	    SetVehicleDensityMultiplierThisFrame(trafficDensity)
	    SetPedDensityMultiplierThisFrame(pedDensity)
	    SetRandomVehicleDensityMultiplierThisFrame(trafficDensity)
	    SetParkedVehicleDensityMultiplierThisFrame(0.0)
	    SetScenarioPedDensityMultiplierThisFrame(pedDensity, pedDensity)
	    
	Citizen.Wait(0)
	end
end)

function SetWeaponDrops()
	local handle, ped = FindFirstPed()
	local finished = false

	repeat
		if not IsEntityDead(ped) then
			SetPedDropsWeaponsWhenDead(ped, false)
		end
		finished, ped = FindNextPed(handle)
	until not finished

	EndFindPed(handle)
end

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(1000)
		SetWeaponDrops()
	end
end)