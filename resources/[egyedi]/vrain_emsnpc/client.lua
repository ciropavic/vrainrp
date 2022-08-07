local ESX = nil

Citizen.CreateThread(function()
	while ESX == nil do
	   TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
	   Citizen.Wait(200)
	end
end)

local Active = false
local test = nil
local test1 = nil
local spam = true

local isDead = false


AddEventHandler('playerSpawned', function(spawn)
	isDead = false
end)

AddEventHandler('esx:onPlayerDeath', function(data)
	isDead = true
end)

CreateThread(function()
	while true do
		Wait(250)
		if IsEntityDead(PlayerPedId()) then
			isDead = true
		else
			isDead = false
		end
	end
end)



RegisterCommand("mento", function(source, args, raw)
	if isDead and spam then
		ESX.TriggerServerCallback('hhfw:docOnline', function(EMSOnline, hasEnoughMoney)

			if EMSOnline <= Config.Doctor and hasEnoughMoney and spam then
				SpawnVehicle(GetEntityCoords(PlayerPedId()))
				TriggerServerEvent('hhfw:charge')
				exports['vrain_notify']:showNotify('A mentőszolgálat érkezik', 'warn', 8000)
			else
				if EMSOnline > Config.Doctor then
					exports['vrain_notify']:showNotify('Túl sok elérhető mentős van, nem tudod használni ezt a funkciót!', 'error', 8000)
				elseif not hasEnoughMoney then
					Notify("Nincsen n�lad el�g p�nz (500$)")
					exports['vrain_notify']:showNotify('Nincsen nálad elegendő pénz. (500$)', 'error', 8000)
				else
					exports['vrain_notify']:showNotify('A mentőszolgálat úton van, várd meg őket.', 'error', 8000)
				end	
			end
		end)
	else
		exports['vrain_notify']:showNotify('Ezt a funkciót csak halottként tudod használni.', 'error', 8000)
	end
end)



function SpawnVehicle(x, y, z)  
	spam = false
	local vehhash = GetHashKey("dodgeEMS")                                                     
	local loc = GetEntityCoords(PlayerPedId())
	RequestModel(vehhash)
	while not HasModelLoaded(vehhash) do
		Wait(1)
	end
	RequestModel('s_m_m_doctor_01')
	while not HasModelLoaded('s_m_m_doctor_01') do
		Wait(1)
	end
	local spawnRadius = 40                                                    
    local found, spawnPos, spawnHeading = GetClosestVehicleNodeWithHeading(loc.x + math.random(-spawnRadius, spawnRadius), loc.y + math.random(-spawnRadius, spawnRadius), loc.z, 0, 3, 0)

	if not DoesEntityExist(vehhash) then
        mechVeh = CreateVehicle(vehhash, spawnPos, spawnHeading, true, false)                        
        ClearAreaOfVehicles(GetEntityCoords(mechVeh), 5000, false, false, false, false, false);  
        SetVehicleOnGroundProperly(mechVeh)
		SetVehicleNumberPlateText(mechVeh, "EMSNPC")
		SetEntityAsMissionEntity(mechVeh, true, true)
		SetVehicleEngineOn(mechVeh, true, true, false)
        
        mechPed = CreatePedInsideVehicle(mechVeh, 26, GetHashKey('s_m_m_doctor_01'), -1, true, false)              	
        
        mechBlip = AddBlipForEntity(mechVeh)                                                        	
        SetBlipFlashes(mechBlip, true)  
        SetBlipColour(mechBlip, 5)


		PlaySoundFrontend(-1, "Text_Arrive_Tone", "Phone_SoundSet_Default", 1)
		Wait(2000)
		TaskVehicleDriveToCoord(mechPed, mechVeh, loc.x, loc.y, loc.z, 20.0, 0, GetEntityModel(mechVeh), 524863, 2.0)
		test = mechVeh
		test1 = mechPed
		Active = true
    end
end

Citizen.CreateThread(function()
    while true do
      Citizen.Wait(200)
        if Active then
            local loc = GetEntityCoords(GetPlayerPed(-1))
			local lc = GetEntityCoords(test)
			local ld = GetEntityCoords(test1)
            local dist = Vdist(loc.x, loc.y, loc.z, lc.x, lc.y, lc.z)
			local dist1 = Vdist(loc.x, loc.y, loc.z, ld.x, ld.y, ld.z)
            if dist <= 10 then
				if Active then
					TaskGoToCoordAnyMeans(test1, loc.x, loc.y, loc.z, 1.0, 0, 0, 786603, 0xbf800000)
				end
				if dist1 <= 1 then 
					Active = false
					ClearPedTasksImmediately(test1)
					DoctorNPC()
				end
            end
        end
    end
end)


function DoctorNPC()
	RequestAnimDict("mini@cpr@char_a@cpr_str")
	while not HasAnimDictLoaded("mini@cpr@char_a@cpr_str") do
		Citizen.Wait(1000)
	end

	TaskPlayAnim(test1, "mini@cpr@char_a@cpr_str","cpr_pumpchest",1.0, 1.0, -1, 9, 1.0, 0, 0, 0)
	exports.ox_inventory:Progress({
		duration = 60000,
		label = 'Újraélesztés..',
		useWhileDead = true,
		canCancel = false,
		disable = {
			move = true,
			car = true,
			combat = true,
			mouse = false
		},
	}, function(cancel)
	end)
	Wait(Config.ReviveTime)
	ClearPedTasks(test1)
	Citizen.Wait(500)
	TriggerEvent('esx_ambulancejob:revive')
	StopScreenEffect('DeathFailOut')	
	exports['vrain_notify']:showNotify('Az ellátásod megtörtént, megkaptad a csekked: ('..Config.Price..'$)', 'success', 8000)
	RemovePedElegantly(test1)
	DeleteEntity(test)
	spam = true
end
