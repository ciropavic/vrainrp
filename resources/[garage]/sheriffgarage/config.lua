--------------------------------
------- Created by Hamza -------
------ Reworked by D4NDI -------
-------------------------------- 

Config = {}

Config.KeyToOpenCarGarage = 38			-- default 38 is E
Config.KeyToOpenHeliGarage = 38			-- default 38 is E
Config.KeyToOpenBoatGarage = 38			-- default 38 is E

Config.SheriffDatabaseName = 'sheriff'	-- set the exact name from your jobs database for Sheriff


--Sheriff Car Garage:
Config.CarZones = {
	SheriffCarGarage = {
		Pos = {
			{x = -459.07086181641,  y = 6001.7700195313, z = 31.340524673462}
		}
	}
}

--Sheriff Heli Garage:
Config.HeliZones = {
	SheriffHeliGarage = {
		Pos = {
			{x = 449.01647949219, y = -981.30218505859, z = 43.691417694092}
		}
	}
}

--Sheriff Boat Garage:
Config.BoatZones = {
	SheriffBoatGarage = {
		Pos = {
		}
	}
}

-- Sheriff Car Garage Blip Settings:
Config.CarGarageSprite = 357
Config.CarGarageDisplay = 4
Config.CarGarageScale = 0.65
Config.CarGarageColour = 38
Config.CarGarageName = "Rendőr garázs"
Config.EnableCarGarageBlip = false

-- Sheriff Heli Garage Blip Settings:
Config.HeliGarageSprite = 43
Config.HeliGarageDisplay = 4
Config.HeliGarageScale = 0.65
Config.HeliGarageColour = 38
Config.HeliGarageName = "Sheriff Heli Garage"
Config.EnableHeliGarageBlip = false

-- Sheriff Boat Garage Blip Settings:
Config.BoatGarageSprite = 427
Config.BoatGarageDisplay = 4
Config.BoatGarageScale = 0.65
Config.BoatGarageColour = 38
Config.BoatGarageName = "Sheriff Boat Garage"
Config.EnableBoatGarageBlip = true

-- Sheriff Car Garage Marker Settings:
Config.SheriffCarMarker = 27 												-- marker type
Config.SheriffCarMarkerColor = { r = 50, g = 50, b = 204, a = 100 } 			-- rgba color of the marker
Config.SheriffCarMarkerScale = { x = 1.5, y = 1.5, z = 1.0 }  				-- the scale for the marker on the x, y and z axis
Config.CarDraw3DText = "~g~[E]~s~ ~y~Garázs megnyitása~s~"			-- set your desired text here

-- Sheriff Heli Garage Marker Settings:
Config.SheriffHeliMarker = 27 												-- marker type
Config.SheriffHeliMarkerColor = { r = 50, g = 50, b = 204, a = 100 } 		-- rgba color of the marker
Config.SheriffHeliMarkerScale = { x = 5.5, y = 5.5, z = 1.0 }  				-- the scale for the marker on the x, y and z axis
Config.HeliDraw3DText = "~g~[E]~s~ ~y~Garázs megnyitása~s~"		-- set your desired text here

-- Sheriff Boat Garage Marker Settings:
Config.SheriffBoatMarker = 27 												-- marker type
Config.SheriffBoatMarkerColor = { r = 50, g = 50, b = 204, a = 100 } 		-- rgba color of the marker
Config.SheriffBoatMarkerScale = { x = 3.0, y = 3.0, z = 1.0 }  				-- the scale for the marker on the x, y and z axis
Config.BoatDraw3DText = "Press ~g~[E]~s~ to open ~y~garage boat"		-- set your desired text here

-- -- Sheriff Cars:
Config.SheriffVehicles = {
	{ model = 'polchar', label = 'Dodge Charger', price = 0 },
	{ model = 'polraptor', label = 'Ford Raptor', price = 0 }
}

-- Sheriff Helicopters:
Config.SheriffHelicopters = {
	{ model = 'polmav', label = 'Helikopter', price = 0 }
}

-- Sheriff Boats:
Config.SheriffBoats = {
	{ model = 'libertyboat', label = 'Sheriff PredatorXV', price = 0 }
}

-- Commands:
Config.RepairCommand = ''
Config.CleanCommand = ''

-- Menu Labels & Titles:
Config.LabelStoreVeh = "Jármű leadása"
Config.LabelGetVeh = "Jármű kivétele"
Config.TitleSheriffGarage = "GARÁZS"
Config.TitleValues = "Érték"

-- ESX.ShowNotifications:
Config.VehicleParked = "A jármű le lett parkolva!"
Config.NoVehicleNearby = "Nem található jármű a közelben!"
Config.CarOutFromPolGar = "Sikeresen lekérted a járművet!"
Config.HeliOutFromPolGar = "Sikeresen lekérted a jármüvet!"
Config.BoatOutFromPolGar = "Bonito Operating!"
Config.VehRepNotify = "A jármű javítás alatt van, várj egy pillanatot!"
Config.VehRepDoneNotify = "A jármű meg lett javítva!"
Config.VehCleanNotify = "A jármű tisztítás alatt van, várj egy pillanatot!"
Config.VehCleanDoneNotify = "A járműved~s~ meg lett tisztítva!"

-- ProgressBars text
Config.Progress1 = "Javítás..."
Config.Progress2 = "Tisztítás..."

-- ProgressBar Timers, in seconds:
Config.RepairTime = 5					-- time to repair vehicle
Config.CleanTime = 3.5					-- time to clean vehicle

Config.VehicleLoadText = "Jármű ~r~betöltése..."			-- text on screen when vehicle model is being loaded

-- Distance from garage marker to the point where /fix and /clean shall work
Config.Distance = 20

Config.DrawDistance      = 100.0
Config.TriggerDistance 	 = 5.0
Config.Marker 			 = {Type = 21, r = 0, g = 127, b = 22}
