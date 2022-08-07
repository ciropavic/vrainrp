--------------------------------
------- Created by Hamza -------
------ Reworked by D4NDI -------
-------------------------------- 

Config = {}

Config.KeyToOpenCarGarage = 38			-- default 38 is E
Config.KeyToOpenHeliGarage = 38			-- default 38 is E
Config.KeyToOpenBoatGarage = 38			-- default 38 is E

Config.MedellinDatabaseName = 'medellin'	-- set the exact name from your jobs database for police


--Police Car Garage:
Config.CarZones = {
	MedellinCarGarage = {
		Pos = {
			{x = -3198.560546875,  y = 811.92626953125, z = 8.9224052429199}
		}
	}
}

--Police Heli Garage:
Config.HeliZones = {
	PoliceHeliGarage = {
		Pos = {
			{x = -183.73226928711, y = -1287.1171875, z = 31.295959472656}
		}
	}
}

--Police Boat Garage:
Config.BoatZones = {
	PoliceBoatGarage = {
		Pos = {
		}
	}
}

-- Police Car Garage Blip Settings:
Config.CarGarageSprite = 357
Config.CarGarageDisplay = 4
Config.CarGarageScale = 0.65
Config.CarGarageColour = 49
Config.CarGarageName = "Medellin Garázs"
Config.EnableCarGarageBlip = false

-- Police Heli Garage Blip Settings:
Config.HeliGarageSprite = 43
Config.HeliGarageDisplay = 4
Config.HeliGarageScale = 0.65
Config.HeliGarageColour = 38
Config.HeliGarageName = "Police Heli Garage"
Config.EnableHeliGarageBlip = false

-- Police Boat Garage Blip Settings:
Config.BoatGarageSprite = 427
Config.BoatGarageDisplay = 4
Config.BoatGarageScale = 0.65
Config.BoatGarageColour = 38
Config.BoatGarageName = "Police Boat Garage"
Config.EnableBoatGarageBlip = true

-- Police Car Garage Marker Settings:
Config.MedellinCarMarker = 23 												-- marker type
Config.MedellinCarMarkerColor = { r = 255, g = 0, b = 55, a = 100 } 			-- rgba color of the marker
Config.MedellinCarMarkerScale = { x = 1.5, y = 1.5, z = 1.0 }  				-- the scale for the marker on the x, y and z axis
Config.CarDraw3DText = "~g~[E]~s~ ~r~Garázs megnyitása~s~"			-- set your desired text here

-- Police Heli Garage Marker Settings:
Config.MedellinHeliMarker = 27 												-- marker type
Config.MedellinHeliMarkerColor = { r = 255, g = 0, b = 55, a = 100 } 		-- rgba color of the marker
Config.MedellinHeliMarkerScale = { x = 1.5, y = 1.5, z = 1.0 }  				-- the scale for the marker on the x, y and z axis
Config.HeliDraw3DText = "~g~[E]~s~ ~r~Garázs megnyitása~s~"		-- set your desired text here

-- Police Boat Garage Marker Settings:
Config.MedellinBoatMarker = 27 												-- marker type
Config.MedellinBoatMarkerColor = { r = 50, g = 50, b = 204, a = 100 } 		-- rgba color of the marker
Config.MedellinBoatMarkerScale = { x = 3.0, y = 3.0, z = 1.0 }  				-- the scale for the marker on the x, y and z axis
Config.BoatDraw3DText = "Press ~g~[E]~s~ to open ~y~garage boat"		-- set your desired text here

-- -- Police Cars:
Config.MedellinVehicles = {
	{ model = 'g63', label = 'AMG G63', price = 0 },
	{ model = 'x6m', label = 'BMW X6M', price = 0 },
	{ model = 'patriot', label = 'Patriot', price = 0},
	{ model = 'rs7', label = 'Audi RS7', price = 0},
	{ model = 'sanchez', label = 'Sanchez', price = 0 }
}

-- Police Helicopters:
Config.MedellinHelicopters = {
	{ model = 'ram2500', label = 'Dodge RAM', price = 0 }
}

-- Police Boats:
Config.MedellinBoats = {
	{ model = 'libertyboat', label = 'Police PredatorXV', price = 0 }
}

-- Commands:
Config.RepairCommand = ''
Config.CleanCommand = ''

-- Menu Labels & Titles:
Config.LabelStoreVeh = "Jármú leadása"
Config.LabelGetVeh = "Jármű kivétele"
Config.TitleMedellinGarage = "GARÁZS"
Config.TitleValues = "Érték"

-- ESX.ShowNotifications:
Config.VehicleParked = "A jármű le lett parkolva!"
Config.NoVehicleNearby = "Nem található jármű a közelben!"
Config.CarOutFromPolGar = "Sikeresen lekérted a járművet!"
Config.HeliOutFromPolGar = "Sikeresen lekérted a járművet!"
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
