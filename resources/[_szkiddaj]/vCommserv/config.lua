Config = {}

-- # Locale to be used. You can create your own by simple copying the 'en' and translating the values.
Config.Locale       				= 'en' -- Traduções disponives en / br

-- # By how many services a player's community service gets extended if he tries to escape
Config.ServiceExtensionOnEscape		= 8

-- # Don't change this unless you know what you are doing.
Config.ServiceLocation 				= {x =  199.16564941406, y = -948.021484375, z = 30.691501617432}

-- # Don't change this unless you know what you are doing.
Config.ReleaseLocation				= {x = 427.33, y = -979.51, z = 30.2}


-- # Don't change this unless you know what you are doing.
Config.ServiceLocations = {
	{ type = "cleaning", coords = vector3(187.60205078125, -945.69860839844, 30.691516876221) },
	{ type = "cleaning", coords = vector3(184.06539916992, -937.00457763672, 30.691493988037) },
	{ type = "cleaning", coords = vector3(176.57064819336, -952.53698730469, 30.691509246826) },
	{ type = "cleaning", coords = vector3(171.13870239258, -944.56823730469, 30.691514968872) },
	{ type = "cleaning", coords = vector3(170.58297729492, -932.89123535156, 30.691516876221) },
	{ type = "cleaning", coords = vector3(170.46812438965, -922.6865234375, 30.691438674927) },
	{ type = "cleaning", coords = vector3(177.57591247559, -913.8271484375, 30.691429138184) },
	{ type = "cleaning", coords = vector3(190.23652648926, -920.65350341797, 30.691417694092) },
	{ type = "cleaning", coords = vector3(203.34982299805, -924.45709228516, 30.691442489624) },
	{ type = "cleaning", coords = vector3(205.33558654785, -936.70849609375, 30.691438674927) },
	{ type = "gardening", coords = vector3(186.36325073242, -955.76300048828, 30.592874526978) },
	{ type = "gardening", coords = vector3(185.05459594727, -959.57745361328, 30.592874526978) },
	{ type = "gardening", coords = vector3(175.12037658691, -962.28381347656, 30.598251342773) },
	{ type = "gardening", coords = vector3(180.88578796387, -937.15649414062, 30.601179122925) },
	{ type = "gardening", coords = vector3(192.9680480957, -922.96716308594, 30.605037689209) },
	{ type = "gardening", coords = vector3(160.40896606445, -933.53851318359, 30.799980163574) },
	{ type = "gardening", coords = vector3(156.64834594727, -945.99615478516, 31.048196792603) },
	{ type = "gardening", coords = vector3(158.83738708496, -958.93469238281, 30.691566467285) }
}



Config.Uniforms = {
	prison_wear = {
		male = {
			['tshirt_1'] = 15,  ['tshirt_2'] = 0,
			['torso_1']  = 146, ['torso_2']  = 0,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms']     = 119, ['pants_1']  = 3,
			['pants_2']  = 7,   ['shoes_1']  = 12,
			['shoes_2']  = 12,  ['chain_1']  = 0,
			['chain_2']  = 0
		},
		female = {
			['tshirt_1'] = 3,   ['tshirt_2'] = 0,
			['torso_1']  = 38,  ['torso_2']  = 3,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms']     = 120,  ['pants_1'] = 3,
			['pants_2']  = 15,  ['shoes_1']  = 66,
			['shoes_2']  = 5,   ['chain_1']  = 0,
			['chain_2']  = 0
		}
	}
}
