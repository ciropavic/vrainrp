-- Made by B1G (Carlos V.), edited by Inferno (Christopher M.)
local LastVehicle = nil
local LicencePlate = {}
LicencePlate.Index = false
LicencePlate.Number = false

-- Command to remove plate
RegisterCommand("removeplate", function()
    -- Check if the player has plates stored
    if not LicencePlate.Index and not LicencePlate.Number then
        -- Client's ped
        local PlayerPed = PlayerPedId()
        -- Client's coords
        local Coords = GetEntityCoords(PlayerPed)
        -- Closest vehicle
        local Vehicle = GetClosestVehicle(Coords.x, Coords.y, Coords.z, 3.5, 0, 70)
        -- Client's coords
        local VehicleCoords = GetEntityCoords(Vehicle)
        -- Distance between client's ped and closest vehicle
        local Distance = Vdist(VehicleCoords.x, VehicleCoords.y, VehicleCoords.z, Coords.x, Coords.y, Coords.z)
        -- If within range and Ped is in a vehicle
        if Distance < 3.5 and not IsPedInAnyVehicle(PlayerPed, false) then
            --Saves the last vehicle
			LastVehicle = Vehicle
			-- Notification and animation
            exports.ox_inventory:Progress({
                duration = 6000,
                label = 'Rendszámtábla eltávolítása..',
                useWhileDead = false,
                canCancel = false,
                disable = {
                    move = true,
                    car = true,
                    combat = true,
                    mouse = false
                },
                anim = {
                    dict = 'mini@repair',
                    clip = 'fixing_a_player',
                    flags = 49,
                },
            }, function(cancel)
            end)
            -- Wait 6 seconds
            Citizen.Wait(6000)
            -- Store plate index
            LicencePlate.Index = GetVehicleNumberPlateTextIndex(Vehicle)
            -- Store plate number
            LicencePlate.Number = GetVehicleNumberPlateText(Vehicle)
            -- Set the plate to nothing
            SetVehicleNumberPlateText(Vehicle, " ")
        else
            -- Notification
			-- exports["mythic_notify"]:SendAlert("error", "No vehicle nearby.") Mythic_Notification
			exports['vrain_notify']:showNotify('Nem található jármű a közelben.', 'error', 8000)

        end
    else
        -- Notification
		-- exports["mythic_notify"]:SendAlert("error", "You already have a licence plate on you.") Mythic_Notification
		exports['vrain_notify']:showNotify('Nem található nálad rendszámtábla.', 'error', 8000)
    end
end)

-- Command to put plate back
RegisterCommand("putplate", function()
    -- Check if the player has plates stored
    if LicencePlate.Index and LicencePlate.Number then
        -- Client's ped
        local PlayerPed = PlayerPedId()
        -- Client's coords
        local Coords = GetEntityCoords(PlayerPed)
        -- Closest vehicle
        local Vehicle = GetClosestVehicle(Coords.x, Coords.y, Coords.z, 3.5, 0, 70)
        -- Client's coords
        local VehicleCoords = GetEntityCoords(Vehicle)
        -- Distance between client's ped and closest vehicle
        local Distance = Vdist(VehicleCoords.x, VehicleCoords.y, VehicleCoords.z, Coords.x, Coords.y, Coords.z)
        -- If within range and Ped is in a vehicle
        if ( (Distance < 3.5) and not IsPedInAnyVehicle(PlayerPed, false) ) then
		if (Vehicle == LastVehicle) then
			--Cleans variable
				LastVehicle = nil
				-- Notification and animation
				exports.ox_inventory:Progress({
                    duration = 6000,
                    label = 'Rendszámtábla felrakása..',
                    useWhileDead = false,
                    canCancel = false,
                    disable = {
                        move = true,
                        car = true,
                        combat = true,
                        mouse = false
                    },
                    anim = {
                        dict = 'mini@repair',
                        clip = 'fixing_a_player',
                        flags = 49,
                    },
                }, function(cancel)
                end)
			-- Wait 6 seconds
			Citizen.Wait(6000)
			-- Set plate index to stored index
			SetVehicleNumberPlateTextIndex(Vehicle, LicencePlate.Index)
			-- Set plate number to stored number
			SetVehicleNumberPlateText(Vehicle, LicencePlate.Number)
			-- Reset stored values
			LicencePlate.Index = false
			LicencePlate.Number = false
		else
			-- Notification
			-- exports["mythic_notify"]:SendAlert("error", "This plate does not belong here")
            exports['vrain_notify']:showNotify('Ez a rendszámtábla nem ide tartozik.', 'error', 8000)
		end
        else
            -- Notification
			-- exports["mythic_notify"]:SendAlert("error", "No vehicle nearby.") Mythic_Notification
            exports['vrain_notify']:showNotify('Nem található jármű a közelben.', 'error', 8000)
        end
    else
        -- Notification
		-- exports["mythic_notify"]:SendAlert("error", "You already have a licence plate on you.") Mythic_Notification
            exports['vrain_notify']:showNotify('Nem található nálad rendszámtábla.', 'error', 8000)
    end
end)
