interactionDistance = 3.5 --The radius you have to be in to interact with the vehicle.
lockDistance = 8 --The radius you have to be in to lock your vehicle.

engineoff = false
saved = false

ESX = nil
local PlayerData              = {}

local isRunningWorkaround = false

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


function StartWorkaroundTask()
	if isRunningWorkaround then
		return
	end

	local timer = 0
	local playerPed = PlayerPedId()
	isRunningWorkaround = true

	while timer < 100 do
		Citizen.Wait(0)
		timer = timer + 1

		local vehicle = GetVehiclePedIsTryingToEnter(playerPed)

		if DoesEntityExist(vehicle) then
			local lockStatus = GetVehicleDoorLockStatus(vehicle)

			if lockStatus == 4 then
				ClearPedTasks(playerPed)
			end
		end
	end

	isRunningWorkaround = false
end

function ToggleVehicleLock()
	local playerPed = PlayerPedId()
	local coords = GetEntityCoords(playerPed)
	local vehicle

	Citizen.CreateThread(function()
		StartWorkaroundTask()
	end)

	if IsPedInAnyVehicle(playerPed, false) then
		vehicle = GetVehiclePedIsIn(playerPed, false)
	else
		vehicle = GetClosestVehicle(coords, 8.0, 0, 71)
	end

	if not DoesEntityExist(vehicle) then
		return
	end

	ESX.TriggerServerCallback('euk-carlock:requestPlayerCars', function(isOwnedVehicle)

		if isOwnedVehicle then
			local lockStatus = GetVehicleDoorLockStatus(vehicle)
			
			if lockStatus == 1 then -- unlocked
				lockAnimation()
				--exports['mythic_notify']:SendAlert('Error', 'Locked'..' '..(GetVehicleNumberPlateText(vehicle)))
                
				SetVehicleLights(vehicle, 2)
                Wait(250)
                SetVehicleLights(vehicle, 0)
				Wait(250)
				StartVehicleHorn (vehicle, 500, "NORMAL", -1)
				PlayVehicleDoorCloseSound(vehicle, 1)
				SetVehicleDoorsLocked(vehicle, 2)
				
				Citizen.Wait(450)
				PlaySoundFrontend(-1, 'Hack_Success', 'DLC_HEIST_BIOLAB_PREP_HACKING_SOUNDS', 0)
				exports['vrain_notify']:showNotify('Bezártad '..(GetVehicleNumberPlateText(vehicle))..' rendszámú járművedet.', 'info', 4000)
				
			elseif lockStatus == 2 then -- locked
				lockAnimation()
				--exports['mythic_notify']:SendAlert('Success', 'Unlocked'..' '..(GetVehicleNumberPlateText(vehicle)))
				
                SetVehicleLights(vehicle, 2)
                Wait(250)
                SetVehicleLights(vehicle, 0)
				Wait(250)
				StartVehicleHorn (vehicle, 500, "NORMAL", -1)
				PlayVehicleDoorOpenSound(vehicle, 0)
				SetVehicleDoorsLocked(vehicle, 1)
				
				Citizen.Wait(450)
				PlaySoundFrontend(-1, 'Hack_Success', 'DLC_HEIST_BIOLAB_PREP_HACKING_SOUNDS', 0)
				exports['vrain_notify']:showNotify('Kinyitottad '..(GetVehicleNumberPlateText(vehicle))..' rendszámú járművedet.', 'info', 4000)
			end
		end

	end, ESX.Math.Trim(GetVehicleNumberPlateText(vehicle)))
end

function lockAnimation()
    local ply = PlayerPedId()
    RequestAnimDict("anim@heists@keycard@")
    while not HasAnimDictLoaded("anim@heists@keycard@") do
        Wait(0)
    end
    TaskPlayAnim(ply, "anim@heists@keycard@", "exit", 8.0, 1.0, -1, 16, 0, 0, 0, 0)
    Wait(600)
    ClearPedTasks(ply)
end

function ToggleVehicleLockFaction()
	local player = GetPlayerPed(-1)
    local coords = GetEntityCoords(player)
	local vehicle

	Citizen.CreateThread(function()
		StartWorkaroundTask()
	end)

	if IsPedInAnyVehicle(player, false) then
		vehicle = GetVehiclePedIsIn(player, false)
	else
		vehicle = GetClosestVehicle(coords, 8.0, 0, 71)
	end

	if not DoesEntityExist(vehicle) then
		return
	end
	local lockStatus = GetVehicleDoorLockStatus(vehicle)
	if PlayerData.job ~= nil and PlayerData.job.name == 'police' then
		if lockStatus == 1 then -- unlocked
			lockAnimation()
			SetVehicleLights(vehicle, 2)
			Wait(250)
			SetVehicleLights(vehicle, 0)
			Wait(250)
			StartVehicleHorn (vehicle, 500, "NORMAL", -1)
			PlayVehicleDoorCloseSound(vehicle, 1)
			SetVehicleDoorsLocked(vehicle, 2)
			Citizen.Wait(450)
			PlaySoundFrontend(-1, 'Hack_Success', 'DLC_HEIST_BIOLAB_PREP_HACKING_SOUNDS', 0)
			exports['vrain_notify']:showNotify('Bezártad '..(GetVehicleNumberPlateText(vehicle))..' rendszámú járművedet.', 'info', 5000)

		elseif lockStatus == 2 then -- locked
			lockAnimation()
			SetVehicleLights(vehicle, 2)
			Wait(250)
			SetVehicleLights(vehicle, 0)
			Wait(250)
			StartVehicleHorn (vehicle, 500, "NORMAL", -1)
			PlayVehicleDoorOpenSound(vehicle, 0)
			SetVehicleDoorsLocked(vehicle, 1)
			Citizen.Wait(450)
			PlaySoundFrontend(-1, 'Hack_Success', 'DLC_HEIST_BIOLAB_PREP_HACKING_SOUNDS', 0)
			exports['vrain_notify']:showNotify('Kinyitottad '..(GetVehicleNumberPlateText(vehicle))..' rendszámú járművedet.', 'info', 5000)
		end
	else
		exports['vrain_notify']:showNotify('Nincsen kulcsod ehhez a járműhöz.', 'error', 5000)
	end
end

function ToggleVehicleLockLacoFaction()
	local player = GetPlayerPed(-1)
    local coords = GetEntityCoords(player)
	local vehicle

	Citizen.CreateThread(function()
		StartWorkaroundTask()
	end)

	if IsPedInAnyVehicle(player, false) then
		vehicle = GetVehiclePedIsIn(player, false)
	else
		vehicle = GetClosestVehicle(coords, 8.0, 0, 71)
	end

	if not DoesEntityExist(vehicle) then
		return
	end
	local lockStatus = GetVehicleDoorLockStatus(vehicle)
	if PlayerData.job ~= nil and PlayerData.job.name == 'lacosanostra' then
		if lockStatus == 1 then -- unlocked
			lockAnimation()
			SetVehicleLights(vehicle, 2)
			Wait(250)
			SetVehicleLights(vehicle, 0)
			Wait(250)
			StartVehicleHorn (vehicle, 500, "NORMAL", -1)
			PlayVehicleDoorCloseSound(vehicle, 1)
			SetVehicleDoorsLocked(vehicle, 2)
			Citizen.Wait(450)
			PlaySoundFrontend(-1, 'Hack_Success', 'DLC_HEIST_BIOLAB_PREP_HACKING_SOUNDS', 0)
			exports['vrain_notify']:showNotify('Bezártad '..(GetVehicleNumberPlateText(vehicle))..' rendszámú járművedet.', 'info', 5000)

		elseif lockStatus == 2 then -- locked
			lockAnimation()
			SetVehicleLights(vehicle, 2)
			Wait(250)
			SetVehicleLights(vehicle, 0)
			Wait(250)
			StartVehicleHorn (vehicle, 500, "NORMAL", -1)
			PlayVehicleDoorOpenSound(vehicle, 0)
			SetVehicleDoorsLocked(vehicle, 1)
			Citizen.Wait(450)
			PlaySoundFrontend(-1, 'Hack_Success', 'DLC_HEIST_BIOLAB_PREP_HACKING_SOUNDS', 0)
			exports['vrain_notify']:showNotify('Kinyitottad '..(GetVehicleNumberPlateText(vehicle))..' rendszámú járművedet.', 'info', 5000)
		end
	else
		exports['vrain_notify']:showNotify('Nincsen kulcsod ehhez a járműhöz.', 'error', 5000)
	end
end

function ToggleVehicleLockBallFaction()
	local player = GetPlayerPed(-1)
    local coords = GetEntityCoords(player)
	local vehicle

	Citizen.CreateThread(function()
		StartWorkaroundTask()
	end)

	if IsPedInAnyVehicle(player, false) then
		vehicle = GetVehiclePedIsIn(player, false)
	else
		vehicle = GetClosestVehicle(coords, 8.0, 0, 71)
	end

	if not DoesEntityExist(vehicle) then
		return
	end
	local lockStatus = GetVehicleDoorLockStatus(vehicle)
	if PlayerData.job ~= nil and PlayerData.job.name == 'ballas' then
		if lockStatus == 1 then -- unlocked
			lockAnimation()
			SetVehicleLights(vehicle, 2)
			Wait(250)
			SetVehicleLights(vehicle, 0)
			Wait(250)
			StartVehicleHorn (vehicle, 500, "NORMAL", -1)
			PlayVehicleDoorCloseSound(vehicle, 1)
			SetVehicleDoorsLocked(vehicle, 2)
			Citizen.Wait(450)
			PlaySoundFrontend(-1, 'Hack_Success', 'DLC_HEIST_BIOLAB_PREP_HACKING_SOUNDS', 0)
			exports['vrain_notify']:showNotify('Bezártad '..(GetVehicleNumberPlateText(vehicle))..' rendszámú járművedet.', 'info', 5000)

		elseif lockStatus == 2 then -- locked
			lockAnimation()
			SetVehicleLights(vehicle, 2)
			Wait(250)
			SetVehicleLights(vehicle, 0)
			Wait(250)
			StartVehicleHorn (vehicle, 500, "NORMAL", -1)
			PlayVehicleDoorOpenSound(vehicle, 0)
			SetVehicleDoorsLocked(vehicle, 1)
			Citizen.Wait(450)
			PlaySoundFrontend(-1, 'Hack_Success', 'DLC_HEIST_BIOLAB_PREP_HACKING_SOUNDS', 0)
			exports['vrain_notify']:showNotify('Kinyitottad '..(GetVehicleNumberPlateText(vehicle))..' rendszámú járművedet.', 'info', 5000)
		end
	else
		exports['vrain_notify']:showNotify('Nincsen kulcsod ehhez a járműhöz.', 'error', 5000)
	end
end

function ToggleVehicleLockEmsFaction()
	local player = GetPlayerPed(-1)
    local coords = GetEntityCoords(player)
	local vehicle

	Citizen.CreateThread(function()
		StartWorkaroundTask()
	end)

	if IsPedInAnyVehicle(player, false) then
		vehicle = GetVehiclePedIsIn(player, false)
	else
		vehicle = GetClosestVehicle(coords, 8.0, 0, 71)
	end

	if not DoesEntityExist(vehicle) then
		return
	end
	local lockStatus = GetVehicleDoorLockStatus(vehicle)
	if PlayerData.job ~= nil and PlayerData.job.name == 'ambulance' then
		if lockStatus == 1 then -- unlocked
			lockAnimation()
			SetVehicleLights(vehicle, 2)
			Wait(250)
			SetVehicleLights(vehicle, 0)
			Wait(250)
			StartVehicleHorn (vehicle, 500, "NORMAL", -1)
			PlayVehicleDoorCloseSound(vehicle, 1)
			SetVehicleDoorsLocked(vehicle, 2)
			Citizen.Wait(450)
			PlaySoundFrontend(-1, 'Hack_Success', 'DLC_HEIST_BIOLAB_PREP_HACKING_SOUNDS', 0)
			exports['vrain_notify']:showNotify('Bezártad '..(GetVehicleNumberPlateText(vehicle))..' rendszámú járművedet.', 'info', 5000)

		elseif lockStatus == 2 then -- locked
			lockAnimation()
			SetVehicleLights(vehicle, 2)
			Wait(250)
			SetVehicleLights(vehicle, 0)
			Wait(250)
			StartVehicleHorn (vehicle, 500, "NORMAL", -1)
			PlayVehicleDoorOpenSound(vehicle, 0)
			SetVehicleDoorsLocked(vehicle, 1)
			Citizen.Wait(450)
			PlaySoundFrontend(-1, 'Hack_Success', 'DLC_HEIST_BIOLAB_PREP_HACKING_SOUNDS', 0)
			exports['vrain_notify']:showNotify('Kinyitottad '..(GetVehicleNumberPlateText(vehicle))..' rendszámú járművedet.', 'info', 5000)
		end
	else
		exports['vrain_notify']:showNotify('Nincsen kulcsod ehhez a járműhöz.', 'error', 5000)
	end
end

function ToggleVehicleLockLostFaction()
	local player = GetPlayerPed(-1)
    local coords = GetEntityCoords(player)
	local vehicle

	Citizen.CreateThread(function()
		StartWorkaroundTask()
	end)

	if IsPedInAnyVehicle(player, false) then
		vehicle = GetVehiclePedIsIn(player, false)
	else
		vehicle = GetClosestVehicle(coords, 8.0, 0, 71)
	end

	if not DoesEntityExist(vehicle) then
		return
	end
	local lockStatus = GetVehicleDoorLockStatus(vehicle)
	if PlayerData.job ~= nil and PlayerData.job.name == 'lostnegro' then
		if lockStatus == 1 then -- unlocked
			lockAnimation()
			SetVehicleLights(vehicle, 2)
			Wait(250)
			SetVehicleLights(vehicle, 0)
			Wait(250)
			StartVehicleHorn (vehicle, 500, "NORMAL", -1)
			PlayVehicleDoorCloseSound(vehicle, 1)
			SetVehicleDoorsLocked(vehicle, 2)
			Citizen.Wait(450)
			PlaySoundFrontend(-1, 'Hack_Success', 'DLC_HEIST_BIOLAB_PREP_HACKING_SOUNDS', 0)
			exports['vrain_notify']:showNotify('Bezártad '..(GetVehicleNumberPlateText(vehicle))..' rendszámú járművedet.', 'info', 5000)

		elseif lockStatus == 2 then -- locked
			lockAnimation()
			SetVehicleLights(vehicle, 2)
			Wait(250)
			SetVehicleLights(vehicle, 0)
			Wait(250)
			StartVehicleHorn (vehicle, 500, "NORMAL", -1)
			PlayVehicleDoorOpenSound(vehicle, 0)
			SetVehicleDoorsLocked(vehicle, 1)
			Citizen.Wait(450)
			PlaySoundFrontend(-1, 'Hack_Success', 'DLC_HEIST_BIOLAB_PREP_HACKING_SOUNDS', 0)
			exports['vrain_notify']:showNotify('Kinyitottad '..(GetVehicleNumberPlateText(vehicle))..' rendszámú járművedet.', 'info', 5000)
		end
	else
		exports['vrain_notify']:showNotify('Nincsen kulcsod ehhez a járműhöz.', 'error', 5000)
	end
end

function ToggleVehicleLockMotoFaction()
	local player = GetPlayerPed(-1)
    local coords = GetEntityCoords(player)
	local vehicle

	Citizen.CreateThread(function()
		StartWorkaroundTask()
	end)

	if IsPedInAnyVehicle(player, false) then
		vehicle = GetVehiclePedIsIn(player, false)
	else
		vehicle = GetClosestVehicle(coords, 8.0, 0, 71)
	end

	if not DoesEntityExist(vehicle) then
		return
	end
	local lockStatus = GetVehicleDoorLockStatus(vehicle)
	if PlayerData.job ~= nil and PlayerData.job.name == 'motogang' then
		if lockStatus == 1 then -- unlocked
			lockAnimation()
			SetVehicleLights(vehicle, 2)
			Wait(250)
			SetVehicleLights(vehicle, 0)
			Wait(250)
			StartVehicleHorn (vehicle, 500, "NORMAL", -1)
			PlayVehicleDoorCloseSound(vehicle, 1)
			SetVehicleDoorsLocked(vehicle, 2)
			Citizen.Wait(450)
			PlaySoundFrontend(-1, 'Hack_Success', 'DLC_HEIST_BIOLAB_PREP_HACKING_SOUNDS', 0)
			exports['vrain_notify']:showNotify('Bezártad '..(GetVehicleNumberPlateText(vehicle))..' rendszámú járművedet.', 'info', 5000)

		elseif lockStatus == 2 then -- locked
			lockAnimation()
			SetVehicleLights(vehicle, 2)
			Wait(250)
			SetVehicleLights(vehicle, 0)
			Wait(250)
			StartVehicleHorn (vehicle, 500, "NORMAL", -1)
			PlayVehicleDoorOpenSound(vehicle, 0)
			SetVehicleDoorsLocked(vehicle, 1)
			Citizen.Wait(450)
			PlaySoundFrontend(-1, 'Hack_Success', 'DLC_HEIST_BIOLAB_PREP_HACKING_SOUNDS', 0)
			exports['vrain_notify']:showNotify('Kinyitottad '..(GetVehicleNumberPlateText(vehicle))..' rendszámú járművedet.', 'info', 5000)
		end
	else
		exports['vrain_notify']:showNotify('Nincsen kulcsod ehhez a járműhöz.', 'error', 5000)
	end
end

function ToggleVehicleLockNdraFaction()
	local player = GetPlayerPed(-1)
    local coords = GetEntityCoords(player)
	local vehicle

	Citizen.CreateThread(function()
		StartWorkaroundTask()
	end)

	if IsPedInAnyVehicle(player, false) then
		vehicle = GetVehiclePedIsIn(player, false)
	else
		vehicle = GetClosestVehicle(coords, 8.0, 0, 71)
	end

	if not DoesEntityExist(vehicle) then
		return
	end
	local lockStatus = GetVehicleDoorLockStatus(vehicle)
	if PlayerData.job ~= nil and PlayerData.job.name == 'ndrangheta' then
		if lockStatus == 1 then -- unlocked
			lockAnimation()
			SetVehicleLights(vehicle, 2)
			Wait(250)
			SetVehicleLights(vehicle, 0)
			Wait(250)
			StartVehicleHorn (vehicle, 500, "NORMAL", -1)
			PlayVehicleDoorCloseSound(vehicle, 1)
			SetVehicleDoorsLocked(vehicle, 2)
			Citizen.Wait(450)
			PlaySoundFrontend(-1, 'Hack_Success', 'DLC_HEIST_BIOLAB_PREP_HACKING_SOUNDS', 0)
			exports['vrain_notify']:showNotify('Bezártad '..(GetVehicleNumberPlateText(vehicle))..' rendszámú járművedet.', 'info', 5000)

		elseif lockStatus == 2 then -- locked
			lockAnimation()
			SetVehicleLights(vehicle, 2)
			Wait(250)
			SetVehicleLights(vehicle, 0)
			Wait(250)
			StartVehicleHorn (vehicle, 500, "NORMAL", -1)
			PlayVehicleDoorOpenSound(vehicle, 0)
			SetVehicleDoorsLocked(vehicle, 1)
			Citizen.Wait(450)
			PlaySoundFrontend(-1, 'Hack_Success', 'DLC_HEIST_BIOLAB_PREP_HACKING_SOUNDS', 0)
			exports['vrain_notify']:showNotify('Kinyitottad '..(GetVehicleNumberPlateText(vehicle))..' rendszámú járművedet.', 'info', 5000)
		end
	else
		exports['vrain_notify']:showNotify('Nincsen kulcsod ehhez a járműhöz.', 'error', 5000)
	end
end

function ToggleVehicleLockMiraFaction()
	local player = GetPlayerPed(-1)
    local coords = GetEntityCoords(player)
	local vehicle

	Citizen.CreateThread(function()
		StartWorkaroundTask()
	end)

	if IsPedInAnyVehicle(player, false) then
		vehicle = GetVehiclePedIsIn(player, false)
	else
		vehicle = GetClosestVehicle(coords, 8.0, 0, 71)
	end

	if not DoesEntityExist(vehicle) then
		return
	end
	local lockStatus = GetVehicleDoorLockStatus(vehicle)
	if PlayerData.job ~= nil and PlayerData.job.name == 'miraglia' then
		if lockStatus == 1 then -- unlocked
			lockAnimation()
			SetVehicleLights(vehicle, 2)
			Wait(250)
			SetVehicleLights(vehicle, 0)
			Wait(250)
			StartVehicleHorn (vehicle, 500, "NORMAL", -1)
			PlayVehicleDoorCloseSound(vehicle, 1)
			SetVehicleDoorsLocked(vehicle, 2)
			Citizen.Wait(450)
			PlaySoundFrontend(-1, 'Hack_Success', 'DLC_HEIST_BIOLAB_PREP_HACKING_SOUNDS', 0)
			exports['vrain_notify']:showNotify('Bezártad '..(GetVehicleNumberPlateText(vehicle))..' rendszámú járművedet.', 'info', 5000)

		elseif lockStatus == 2 then -- locked
			lockAnimation()
			SetVehicleLights(vehicle, 2)
			Wait(250)
			SetVehicleLights(vehicle, 0)
			Wait(250)
			StartVehicleHorn (vehicle, 500, "NORMAL", -1)
			PlayVehicleDoorOpenSound(vehicle, 0)
			SetVehicleDoorsLocked(vehicle, 1)
			Citizen.Wait(450)
			PlaySoundFrontend(-1, 'Hack_Success', 'DLC_HEIST_BIOLAB_PREP_HACKING_SOUNDS', 0)
			exports['vrain_notify']:showNotify('Kinyitottad '..(GetVehicleNumberPlateText(vehicle))..' rendszámú járművedet.', 'info', 5000)
		end
	else
		exports['vrain_notify']:showNotify('Nincsen kulcsod ehhez a járműhöz.', 'error', 5000)
	end
end

function ToggleVehicleLockLostmcFaction()
	local player = GetPlayerPed(-1)
    local coords = GetEntityCoords(player)
	local vehicle

	Citizen.CreateThread(function()
		StartWorkaroundTask()
	end)

	if IsPedInAnyVehicle(player, false) then
		vehicle = GetVehiclePedIsIn(player, false)
	else
		vehicle = GetClosestVehicle(coords, 8.0, 0, 71)
	end

	if not DoesEntityExist(vehicle) then
		return
	end
	local lockStatus = GetVehicleDoorLockStatus(vehicle)
	if PlayerData.job ~= nil and PlayerData.job.name == 'lostmc' then
		if lockStatus == 1 then -- unlocked
			lockAnimation()
			SetVehicleLights(vehicle, 2)
			Wait(250)
			SetVehicleLights(vehicle, 0)
			Wait(250)
			StartVehicleHorn (vehicle, 500, "NORMAL", -1)
			PlayVehicleDoorCloseSound(vehicle, 1)
			SetVehicleDoorsLocked(vehicle, 2)
			Citizen.Wait(450)
			PlaySoundFrontend(-1, 'Hack_Success', 'DLC_HEIST_BIOLAB_PREP_HACKING_SOUNDS', 0)
			exports['vrain_notify']:showNotify('Bezártad '..(GetVehicleNumberPlateText(vehicle))..' rendszámú járművedet.', 'info', 5000)

		elseif lockStatus == 2 then -- locked
			lockAnimation()
			SetVehicleLights(vehicle, 2)
			Wait(250)
			SetVehicleLights(vehicle, 0)
			Wait(250)
			StartVehicleHorn (vehicle, 500, "NORMAL", -1)
			PlayVehicleDoorOpenSound(vehicle, 0)
			SetVehicleDoorsLocked(vehicle, 1)
			Citizen.Wait(450)
			PlaySoundFrontend(-1, 'Hack_Success', 'DLC_HEIST_BIOLAB_PREP_HACKING_SOUNDS', 0)
			exports['vrain_notify']:showNotify('Kinyitottad '..(GetVehicleNumberPlateText(vehicle))..' rendszámú járművedet.', 'info', 5000)
		end
	else
		exports['vrain_notify']:showNotify('Nincsen kulcsod ehhez a járműhöz.', 'error', 5000)
	end
end

function ToggleVehicleLockNarcosFaction()
	local player = GetPlayerPed(-1)
    local coords = GetEntityCoords(player)
	local vehicle

	Citizen.CreateThread(function()
		StartWorkaroundTask()
	end)

	if IsPedInAnyVehicle(player, false) then
		vehicle = GetVehiclePedIsIn(player, false)
	else
		vehicle = GetClosestVehicle(coords, 8.0, 0, 71)
	end

	if not DoesEntityExist(vehicle) then
		return
	end
	local lockStatus = GetVehicleDoorLockStatus(vehicle)
	if PlayerData.job ~= nil and PlayerData.job.name == 'narcoscartel' then
		if lockStatus == 1 then -- unlocked
			lockAnimation()
			SetVehicleLights(vehicle, 2)
			Wait(250)
			SetVehicleLights(vehicle, 0)
			Wait(250)
			StartVehicleHorn (vehicle, 500, "NORMAL", -1)
			PlayVehicleDoorCloseSound(vehicle, 1)
			SetVehicleDoorsLocked(vehicle, 2)
			Citizen.Wait(450)
			PlaySoundFrontend(-1, 'Hack_Success', 'DLC_HEIST_BIOLAB_PREP_HACKING_SOUNDS', 0)
			exports['vrain_notify']:showNotify('Bezártad '..(GetVehicleNumberPlateText(vehicle))..' rendszámú járművedet.', 'info', 5000)

		elseif lockStatus == 2 then -- locked
			lockAnimation()
			SetVehicleLights(vehicle, 2)
			Wait(250)
			SetVehicleLights(vehicle, 0)
			Wait(250)
			StartVehicleHorn (vehicle, 500, "NORMAL", -1)
			PlayVehicleDoorOpenSound(vehicle, 0)
			SetVehicleDoorsLocked(vehicle, 1)
			Citizen.Wait(450)
			PlaySoundFrontend(-1, 'Hack_Success', 'DLC_HEIST_BIOLAB_PREP_HACKING_SOUNDS', 0)
			exports['vrain_notify']:showNotify('Kinyitottad '..(GetVehicleNumberPlateText(vehicle))..' rendszámú járművedet.', 'info', 5000)
		end
	else
		exports['vrain_notify']:showNotify('Nincsen kulcsod ehhez a járműhöz.', 'error', 5000)
	end
end

function ToggleVehicleLockPearlsFaction()
	local player = GetPlayerPed(-1)
    local coords = GetEntityCoords(player)
	local vehicle

	Citizen.CreateThread(function()
		StartWorkaroundTask()
	end)

	if IsPedInAnyVehicle(player, false) then
		vehicle = GetVehiclePedIsIn(player, false)
	else
		vehicle = GetClosestVehicle(coords, 8.0, 0, 71)
	end

	if not DoesEntityExist(vehicle) then
		return
	end
	local lockStatus = GetVehicleDoorLockStatus(vehicle)
	if PlayerData.job ~= nil and PlayerData.job.name == 'pearlsrestaurant' then
		if lockStatus == 1 then -- unlocked
			lockAnimation()
			SetVehicleLights(vehicle, 2)
			Wait(250)
			SetVehicleLights(vehicle, 0)
			Wait(250)
			StartVehicleHorn (vehicle, 500, "NORMAL", -1)
			PlayVehicleDoorCloseSound(vehicle, 1)
			SetVehicleDoorsLocked(vehicle, 2)
			Citizen.Wait(450)
			PlaySoundFrontend(-1, 'Hack_Success', 'DLC_HEIST_BIOLAB_PREP_HACKING_SOUNDS', 0)
			exports['vrain_notify']:showNotify('Bezártad '..(GetVehicleNumberPlateText(vehicle))..' rendszámú járművedet.', 'info', 5000)

		elseif lockStatus == 2 then -- locked
			lockAnimation()
			SetVehicleLights(vehicle, 2)
			Wait(250)
			SetVehicleLights(vehicle, 0)
			Wait(250)
			StartVehicleHorn (vehicle, 500, "NORMAL", -1)
			PlayVehicleDoorOpenSound(vehicle, 0)
			SetVehicleDoorsLocked(vehicle, 1)
			Citizen.Wait(450)
			PlaySoundFrontend(-1, 'Hack_Success', 'DLC_HEIST_BIOLAB_PREP_HACKING_SOUNDS', 0)
			exports['vrain_notify']:showNotify('Kinyitottad '..(GetVehicleNumberPlateText(vehicle))..' rendszámú járművedet.', 'info', 5000)
		end
	else
		exports['vrain_notify']:showNotify('Nincsen kulcsod ehhez a járműhöz.', 'error', 5000)
	end
end

Citizen.CreateThread(function()
	while true do
		local player = GetPlayerPed(-1)
		local vehicle = GetVehiclePedIsIn(player,true)
		local vehicleplate = ESX.Math.Trim(GetVehicleNumberPlateText(vehicle))
		Citizen.Wait(0)
		if IsControlJustReleased(0, 182) and IsInputDisabled(0) then
			if vehicleplate == 'LSPD' then
				ToggleVehicleLockFaction()
				Wait(400)
			elseif vehicleplate == 'LACO' then
				ToggleVehicleLockLacoFaction()
				Wait(400)
			elseif vehicleplate == 'BALL' then
				ToggleVehicleLockBallFaction()
				Wait(400)
			elseif vehicleplate == 'EMS' then
				ToggleVehicleLockEmsFaction()
				Wait(400)
			elseif vehicleplate == 'LOST' then
				ToggleVehicleLockLostFaction()
				Wait(400)
			elseif vehicleplate == 'MOTO' then
				ToggleVehicleLockMotoFaction()
				Wait(400)
			elseif vehicleplate == 'NDRA' then
				ToggleVehicleLockNdraFaction()
				Wait(400)
			elseif vehicleplate == 'MIRA' then
				ToggleVehicleLockMiraFaction()
				Wait(400)
			elseif vehicleplate == 'LOSTMC' then
				ToggleVehicleLockLostmcFaction()
				Wait(400)
			elseif vehicleplate == 'NARCOS' then
				ToggleVehicleLockNarcosFaction()
				Wait(400)
			elseif vehicleplate == 'PEARLS' then
				ToggleVehicleLockPearlsFaction()
				Wait(400)
			else
				ToggleVehicleLock()
				Wait(400)
			end
		end
	end
end)