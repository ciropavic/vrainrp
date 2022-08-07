Config = {}
Config.Locale = 'en'

Config.DrawDistance	= 10
Config.CoolDown = 120 -- How long in Mins before a New Robbery can be Started

Config.Zones = {
	-- 24/7
	["24/7 (Senora Freeway)"] = {
		Coords = vector3(2674.8884277344,3288.7817382813,55.241130828857),
		Marker = {Type = 20, r = 20, g = 250, b = 100, x = 0.8, y = 1.0, z = 1.0},
		AreaSize = 15,
		Reward = 25001,
		Robbed = 0, -- DO NOT CHANGE
		TimeToRob = 600, -- Default 300 (5Mins)
		TimeBeforeNewRob = 7200, -- Default 1800 (30Mins)
		PoliceRequired = 3
	},
	["LTD Gasoline (North Rockford Drive)"] = {
		Coords = vector3(-1827.9627685547,800.44781494141,138.15322875977),
		Marker = {Type = 20, r = 20, g = 250, b = 100, x = 0.8, y = 1.0, z = 1.0},
		AreaSize = 15,
		Reward = 25001,
		Robbed = 0, -- DO NOT CHANGE
		TimeToRob = 600, -- Default 300 (5Mins)
		TimeBeforeNewRob = 7200, -- Default 1800 (30Mins)
		PoliceRequired = 3
	},
	["LTD Gasoline (Grapeseed Main Street)"] = {
		Coords = vector3(1706.9793701172,4918.6904296875,42.063682556152),
		Marker = {Type = 20, r = 20, g = 250, b = 100, x = 0.8, y = 1.0, z = 1.0},
		AreaSize = 15,
		Reward = 25001,
		Robbed = 0, -- DO NOT CHANGE
		TimeToRob = 600, -- Default 300 (5Mins)
		TimeBeforeNewRob = 7200, -- Default 1800 (30Mins)
		PoliceRequired = 3
	},
	["24/7 (Clinton Avenue)"] = {
		Coords = vector3(380.98559570313,331.75637817383,103.56636810303),
		Marker = {Type = 20, r = 20, g = 250, b = 100, x = 0.8, y = 1.0, z = 1.0},
		AreaSize = 15,
		Reward = 25001,
		Robbed = 0, -- DO NOT CHANGE
		TimeToRob = 600, -- Default 300 (5Mins)
		TimeBeforeNewRob = 7200, -- Default 1800 (30Mins)
		PoliceRequired = 3
	},
	["24/7 (Barbereno Road)"] = {
		Coords = vector3(-3248.8842773438,1007.1646118164,12.830710411072),
		Marker = {Type = 20, r = 20, g = 250, b = 100, x = 0.8, y = 1.0, z = 1.0},
		AreaSize = 15,
		Reward = 25001,
		Robbed = 0, -- DO NOT CHANGE
		TimeToRob = 600, -- Default 300 (5Mins)
		TimeBeforeNewRob = 7200, -- Default 1800 (30Mins)
		PoliceRequired = 3
	},
	["24/7 (Palomino Freeway)"] = {
		Coords = vector3(2550.4448242188,387.91983032227,108.62294769287),
		Marker = {Type = 20, r = 20, g = 250, b = 100, x = 0.8, y = 1.0, z = 1.0},
		AreaSize = 15,
		Reward = 25001,
		Robbed = 0, -- DO NOT CHANGE
		TimeToRob = 600, -- Default 300 (5Mins)
		TimeBeforeNewRob = 7200, -- Default 1800 (30Mins)
		PoliceRequired = 3
	},
	["24/7 (Algonquin Boulevard)"] = {
		Coords = vector3(1397.0168457031,3610.8649902344,34.980911254883),
		Marker = {Type = 20, r = 20, g = 250, b = 100, x = 0.8, y = 1.0, z = 1.0},
		AreaSize = 15,
		Reward = 25001,
		Robbed = 0, -- DO NOT CHANGE
		TimeToRob = 600, -- Default 300 (5Mins)
		TimeBeforeNewRob = 7200, -- Default 1800 (30Mins)
		PoliceRequired = 3
	},
	["24/7 (Little Seoul)"] = {
		Coords = vector3(-707.64105224609,-903.69665527344,19.215589523315),
		Marker = {Type = 20, r = 20, g = 250, b = 100, x = 0.8, y = 1.0, z = 1.0},
		AreaSize = 15,
		Reward = 25001,
		Robbed = 0, -- DO NOT CHANGE
		TimeToRob = 600, -- Default 300 (5Mins)
		TimeBeforeNewRob = 7200, -- Default 1800 (30Mins)
		PoliceRequired = 3
	},
	["24/7 (Paleto Bay)"] = {
		Coords = vector3(1737.0825195313,6418.837890625,35.037265777588),
		Marker = {Type = 20, r = 20, g = 250, b = 100, x = 0.8, y = 1.0, z = 1.0},
		AreaSize = 15,
		Reward = 25001,
		Robbed = 0, -- DO NOT CHANGE
		TimeToRob = 600, -- Default 300 (5Mins)
		TimeBeforeNewRob = 7200, -- Default 1800 (30Mins)
		PoliceRequired = 3
	},
	["24/7 (Innocence Boulevard)"] = {
		Coords = vector3(31.347131729126,-1340.087890625,29.497045516968),
		Marker = {Type = 20, r = 20, g = 250, b = 100, x = 0.8, y = 1.0, z = 1.0},
		AreaSize = 15,
		Reward = 25001,
		Robbed = 0, -- DO NOT CHANGE
		TimeToRob = 600, -- Default 300 (5Mins)
		TimeBeforeNewRob = 7200, -- Default 1800 (30Mins)
		PoliceRequired = 3
	},
	["24/7 (Route 68)"] = {
		Coords = vector3(543.65399169922,2663.4877929688,42.156539916992),
		Marker = {Type = 20, r = 20, g = 250, b = 100, x = 0.8, y = 1.0, z = 1.0},
		AreaSize = 15,
		Reward = 25001,
		Robbed = 0, -- DO NOT CHANGE
		TimeToRob = 600, -- Default 300 (5Mins)
		TimeBeforeNewRob = 7200, -- Default 1800 (30Mins)
		PoliceRequired = 3
	},
	["24/7 (Alhambra Drive)"] = {
		Coords = vector3(1962.0848388672,3749.7097167969,32.34379196167),
		Marker = {Type = 20, r = 20, g = 250, b = 100, x = 0.8, y = 1.0, z = 1.0},
		AreaSize = 15,
		Reward = 25001,
		Robbed = 0, -- DO NOT CHANGE
		TimeToRob = 600, -- Default 300 (5Mins)
		TimeBeforeNewRob = 7200, -- Default 1800 (30Mins)
		PoliceRequired = 3
	},
	["Robs Liquor (Great Ocean Highway)"] = {
		Coords = vector3(-2959.171875,387.62530517578,14.043139457703),
		Marker = {Type = 20, r = 20, g = 250, b = 100, x = 0.8, y = 1.0, z = 1.0},
		AreaSize = 15,
		Reward = 25001,
		Robbed = 0, -- DO NOT CHANGE
		TimeToRob = 600, -- Default 300 (5Mins)
		TimeBeforeNewRob = 7200, -- Default 1800 (30Mins)
		PoliceRequired = 3
	},
	["Robs Liquor (San Andreas Avenue)"] = {
		Coords = vector3(-1220.3698730469,-916.10699462891,11.326217651367),
		Marker = {Type = 20, r = 20, g = 250, b = 100, x = 0.8, y = 1.0, z = 1.0},
		AreaSize = 15,
		Reward = 25001,
		Robbed = 0, -- DO NOT CHANGE
		TimeToRob = 600, -- Default 300 (5Mins)
		TimeBeforeNewRob = 7200, -- Default 1800 (30Mins)
		PoliceRequired = 3
	},
	["LTD Gasoline (Grove Street)"] = {
		Coords = vector3(-41.403831481934,-1749.2423095703,29.420993804932),
		Marker = {Type = 20, r = 20, g = 250, b = 100, x = 0.8, y = 1.0, z = 1.0},
		AreaSize = 15,
		Reward = 25001,
		Robbed = 0, -- DO NOT CHANGE
		TimeToRob = 600, -- Default 300 (5Mins)
		TimeBeforeNewRob = 7200, -- Default 1800 (30Mins)
		PoliceRequired = 3
	},
	["Robs Liquor (El Rancho Blvd)"] = {
		Coords = vector3(1126.7105712891,-980.58422851563,45.415649414063),
		Marker = {Type = 20, r = 20, g = 250, b = 100, x = 0.8, y = 1.0, z = 1.0},
		AreaSize = 15,
		Reward = 25001,
		Robbed = 0, -- DO NOT CHANGE
		TimeToRob = 600, -- Default 300 (5Mins)
		TimeBeforeNewRob = 7200, -- Default 1800 (30Mins)
		PoliceRequired = 3
	},
	["LTD Gasoline (Mirror Park)"] = {
		Coords = vector3(1161.5435791016,-313.2131652832,69.205139160156),
		Marker = {Type = 20, r = 20, g = 250, b = 100, x = 0.8, y = 1.0, z = 1.0},
		AreaSize = 15,
		Reward = 25001,
		Robbed = 0, -- DO NOT CHANGE
		TimeToRob = 600, -- Default 300 (5Mins)
		TimeBeforeNewRob = 7200, -- Default 1800 (30Mins)
		PoliceRequired = 3
	},
}
