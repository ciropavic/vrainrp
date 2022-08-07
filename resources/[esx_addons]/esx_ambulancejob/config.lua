Config                            = {}

Config.DrawDistance               = 10.0 -- How close do you need to be in order for the markers to be drawn (in GTA units).

Config.Marker                     = {type = 1, x = 0.8, y = 1.0, z = 0.5, r = 50, g = 50, b = 204, a = 100, rotate = false}

Config.ReviveReward               = 50  -- Revive reward, set to 0 if you don't want it enabled
Config.SaveDeathStatus              = true -- Save Death Status?
Config.LoadIpl                    = true -- Disable if you're using fivem-ipl or other IPL loaders

Config.Locale                     = 'en'

Config.EarlyRespawnTimer          = 60000 * 0.1  -- time til respawn is available
Config.BleedoutTimer              = 60000 * 20 -- time til the player bleeds out

Config.EnablePlayerManagement     = true -- Enable society managing (If you are using esx_society).

Config.RemoveWeaponsAfterRPDeath  = true
Config.RemoveCashAfterRPDeath     = true
Config.RemoveItemsAfterRPDeath    = true

-- Let the player pay for respawning early, only if he can afford it.
Config.EarlyRespawnFine           = false
Config.EarlyRespawnFineAmount     = 5000

Config.OxInventory                = ESX.GetConfig().OxInventory
Config.RespawnPoints = {
	{coords = vector3(314.10540771484, -589.97015380859, 43.284027099609), heading = 48.5}
}

Config.MoneyTakenPercent			= 0.33;
Config.IgnoredItemsWhenRemove		= {
	['bread'] = true,
};

Config.Hospitals = {

	CentralLosSantos = {

		Blip = {
			coords = vector3(324.346, -592.565, 43.283),
			sprite = 61,
			scale  = 1.2,
			color  = 2
		},

		Armoury = {
			vector3(311.3537902832,-596.61608886719,43.284019470215)
		},

		AmbulanceActions = {
			vector3(299.20693969727, -597.89123535156, 43.283992767334)
		},

		Pharmacies = {
		},

		Vehicles = {
			{
				Spawner = vector3(307.7, -1433.4, 30.0),
				InsideShop = vector3(446.7, -1355.6, 43.5),
				Marker = {type = 36, x = 1.0, y = 1.0, z = 1.0, r = 100, g = 50, b = 200, a = 100, rotate = true},
				SpawnPoints = {
					{coords = vector3(297.2, -1429.5, 29.8), heading = 227.6, radius = 4.0},
					{coords = vector3(294.0, -1433.1, 29.8), heading = 227.6, radius = 4.0},
					{coords = vector3(309.4, -1442.5, 29.8), heading = 227.6, radius = 6.0}
				}
			}
		},

		Helicopters = {
			{
				Spawner = vector3(317.5, -1449.5, 46.5),
				InsideShop = vector3(305.6, -1419.7, 41.5),
				Marker = {type = 34, x = 1.5, y = 1.5, z = 1.5, r = 100, g = 150, b = 150, a = 100, rotate = true},
				SpawnPoints = {
					{coords = vector3(313.5, -1465.1, 46.5), heading = 142.7, radius = 10.0},
					{coords = vector3(299.5, -1453.2, 46.5), heading = 142.7, radius = 10.0}
				}
			}
		},

		FastTravels = {
		},

		FastTravelsPrompt = {
			{
				From = vector3(331.98254394531,-595.55914306641,43.283985137939),
				To = {coords = vector3(339.05950927734,-584.01495361328,74.165565490723), heading = 0.0},
				Marker = {type = 20, x = 0.8, y = 1.0, z = 0.5, r = 180, g = 0, b = 0, a = 100, rotate = false},
				Prompt = _U('fast_travel')
			},

			{
				From = vector3(330.04968261719,-601.11352539063,43.283985137939),
				To = {coords = vector3(339.05950927734,-584.01495361328,74.165565490723), heading = 0.0},
				Marker = {type = 20, x = 0.8, y = 1.0, z = 0.5, r = 180, g = 0, b = 0, a = 100, rotate = false},
				Prompt = _U('fast_travel')
			},

			{
				From = vector3(327.22448730469,-603.50042724609,43.283985137939),
				To = {coords = vector3(339.05950927734,-584.01495361328,74.165565490723), heading = 0.0},
				Marker = {type = 20, x = 0.8, y = 1.0, z = 0.5, r = 180, g = 0, b = 0, a = 100, rotate = false},
				Prompt = _U('fast_travel')
			},

			{
				From = vector3(339.05950927734,-584.01495361328,74.165565490723),
				To = {coords = vector3(331.98254394531,-595.55914306641,43.283985137939), heading = 0.0},
				Marker = {type = 20, x = 0.8, y = 1.0, z = 0.5, r = 180, g = 0, b = 0, a = 100, rotate = false},
				Prompt = _U('fast_travel')
			}
		}

	}
}

Config.AuthorizedVehicles = {
	car = {
		ambulance = {
			{model = 'ambulance', price = 5000}
		},

		doctor = {
			{model = 'ambulance', price = 4500}
		},

		chief_doctor = {
			{model = 'ambulance', price = 3000}
		},

		boss = {
			{model = 'ambulance', price = 2000}
		}
	},

	helicopter = {
		ambulance = {},

		doctor = {
			{model = 'buzzard2', price = 150000}
		},

		chief_doctor = {
			{model = 'buzzard2', price = 150000},
			{model = 'seasparrow', price = 300000}
		},

		boss = {
			{model = 'buzzard2', price = 10000},
			{model = 'seasparrow', price = 250000}
		}
	}
}
