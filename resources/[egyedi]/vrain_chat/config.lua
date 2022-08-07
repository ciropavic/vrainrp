Config = {}
--------------------------------
-- [Date Format]

Config.DateFormat = '%H:%M' -- To change the date format check this website - https://www.lua.org/pil/22.1.html

-- [Staff Groups]

Config.StaffGroups = {
	'superadmin',
	'admin',
	'adminseged'
}

--------------------------------
-- [Clear Player Chat]

Config.AllowPlayersToClearTheirChat = true

Config.ClearChatCommand = 'clear'

--------------------------------
-- [Staff]

Config.EnableStaffCommand = true

Config.StaffCommand = 'staff'

Config.AllowStaffsToClearEveryonesChat = true

Config.ClearEveryonesChatCommand = 'clearchat'

-- [Staff Only Chat]

Config.EnableStaffOnlyCommand = true

Config.StaffOnlyCommand = 'achat'

--------------------------------
-- [Advertisements]

Config.EnableAdvertisementCommand = true

Config.AdvertisementCommand = 'ad'

Config.AdvertisementPrice = 75

Config.AdvertisementCooldown = 3 -- in minutes

--------------------------------
-- [Twitch]

Config.EnableTwitchCommand = false

Config.TwitchCommand = 'twitch'

-- Types of identifiers: steam: | license: | xbl: | live: | discord: | fivem: | ip:
Config.TwitchList = {
	'steam:110000118a12j8a' -- Example, change this
}

--------------------------------
-- [Youtube]

Config.EnableYoutubeCommand = false

Config.YoutubeCommand = 'youtube'

-- Types of identifiers: steam: | license: | xbl: | live: | discord: | fivem: | ip:
Config.YoutubeList = {
	'steam:110000118a12j8a' -- Example, change this
}

--------------------------------
-- [Twitter]

Config.EnableTwitterCommand = true

Config.TwitterCommand = 'twitter'

--------------------------------
-- [Police]

Config.EnablePoliceCommand = true

Config.PoliceCommand = 'police'

Config.PoliceJobName = 'police'

--------------------------------
-- [DeltaForce]

Config.EnableDeltaForceCommand = true

Config.DeltaForceCommand = 'deltaforce'

Config.DeltaForceJobName = 'deltaforce'

--------------------------------
-- [Mechanic]

Config.MechanicCommand = 'mechanic'

Config.MechanicJobName = 'mechanic'

-------------------------------
-- [Ambulance]

Config.EnableAmbulanceCommand = true

Config.AmbulanceCommand = 'ambulance'

Config.AmbulanceJobName = 'ambulance'

--------------------------------
-- [Pearls]
Config.EnablePearlsCommand = true

Config.PearlsCommand = 'pearls'

Config.PearlsJobName = 'pearlsrestaurant'

--------------------------------
-- [HTWTgeci]

Config.HtwtCommand = 'htwt'

--------------------------------
-- [KTKTgeci]

Config.HtktCommand = 'htkt'

-- [Darkweb]

Config.DarkwebCommand = 'darkweb'

--------------------------------
-- [OOC]

Config.EnableOOCCommand = true

Config.OOCCommand = 'ooc'

Config.OOCDistance = 20.0

--------------------------------