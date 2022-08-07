Config = {}

Config.Locale = 'en' -- "de" or "en"

Config.Blip = true

Config.GiveBlack = false -- Enable BlackMoney? Else the Player becomes Regular Cash

Config.Item1 = 'furomotor' -- The Item that you Farm
Config.Item2 = 'applejuice' -- The Item that you become when you're Processing

Config.Prop = 'vw_prop_vw_barrel_01a' -- The Prop That Spawn on the Farming Place (https://forge.plebmasters.de/objects/)

Config.Animation = 'world_human_gardener_plant' -- The Animation That Plays when you start Farming (https://alexguirre.github.io/animations-list/)

Config.LicenseEnable = false -- enable processing licenses? The player will be required to buy a license in order to process drugs. Requires esx_license

Config.Delays = {
	FarmProcessing = 1000 * 7
}

Config.FarmDealerItems = {
	apfel_verarbeitet = 250
}

Config.LicensePrices = {
	farm_processing = {label = _U('license_farm'), price = 15000}
}

Config.CircleZones = {
	FarmField = {coords = vector3(-590.81597900391,5291.1577148438,70.214408874512), name = _U('blip_FarmField'), color = 1, sprite = 514, radius = 10},
}
