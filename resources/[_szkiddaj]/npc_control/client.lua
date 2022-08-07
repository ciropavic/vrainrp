Citizen.CreateThread(function()
    while true do
        Citizen.Wait(50) 
		
        for ped in EnumeratePeds() do
            if DoesEntityExist(ped) then
				for i,model in pairs(cfg.peds) do
					if (GetEntityModel(ped) == GetHashKey(model)) then
						veh = GetVehiclePedIsIn(ped, false)
						SetEntityAsNoLongerNeeded(ped)
						SetEntityCoords(ped,10000,10000,10000,1,0,0,1)
						if veh ~= nil then
							SetEntityAsNoLongerNeeded(veh)
							SetEntityCoords(veh,10000,10000,10000,1,0,0,1)
						end
					end
				end
				for i,model in pairs(cfg.noguns) do
					if (GetEntityModel(ped) == GetHashKey(model)) then
						RemoveAllPedWeapons(ped, true)
					end
				end
				for i,model in pairs(cfg.nodrops) do
					if (GetEntityModel(ped) == GetHashKey(model)) then
						SetPedDropsWeaponsWhenDead(ped,false) 
					end
				end
			end
		end
    end
end)

Citizen.CreateThread(function()
    while true do
        SetPedDensityMultiplierThisFrame(0)
        SetScenarioPedDensityMultiplierThisFrame(0, 0)
        SetVehicleDensityMultiplierThisFrame(0)
        SetRandomVehicleDensityMultiplierThisFrame(0)
        SetParkedVehicleDensityMultiplierThisFrame(0.0)
        Citizen.Wait(0)
    end
end)
