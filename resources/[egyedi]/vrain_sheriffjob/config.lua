Config                            = {}

Config.DrawDistance               = 10.0 -- How close do you need to be for the markers to be drawn (in GTA units).
Config.MarkerType                 = {Cloakrooms = 20, Armories = 21, BossActions = 22, Vehicles = 20, Helicopters = 34}
Config.MarkerSize                 = {x = 1.5, y = 1.5, z = 0.5}
Config.MarkerColor                = {r = 50, g = 50, b = 204}

Config.EnablePlayerManagement     = true -- Enable if you want society managing.
Config.EnableArmoryManagement     = true
Config.EnableESXIdentity          = true -- Enable if you're using esx_identity.
Config.EnableESXOptionalneeds     = false -- Enable if you're using esx_optionalneeds
Config.EnableLicenses             = false -- Enable if you're using esx_license.

Config.EnableHandcuffTimer        = true -- Enable handcuff timer? will unrestrain player after the time ends.
Config.HandcuffTimer              = 10 * 60000 -- 10 minutes.

Config.EnableJobBlip              = true -- Enable blips for cops on duty, requires esx_society.
Config.EnableCustomPeds           = false -- Enable custom peds in cloak room? See Config.CustomPeds below to customize peds.

Config.EnableESXService           = true -- Enable esx service?
Config.MaxInService               = -1 -- How many people can be in service at once? Set as -1 to have no limit

Config.Locale                     = 'en'

Config.OxInventory                = ESX.GetConfig().OxInventory

Config.SheriffStations = {

	LSPD = {

		Blip = {
			Coords  = vector3(-440.31338500977, 6005.6196289063, 40.359367370605),
			Sprite  = 60,
			Display = 4,
			Scale   = 1.2,
			Colour  = 28
		},

		Cloakrooms = {
			vector3(-450.77972412109,6008.86328125,31.844327926636)
		},

		Armories = {
			vector3(-428.60974121094,5996.703125,31.716543197632)
		},

		Lefoglaltak = {
			vector3(-431.72348022461,5999.2641601563,31.716535568237)
		},

		Vehicles = {
		},

		Helicopters = {
		},

		BossActions = {
			vector3(-454.841796875,6014.853515625,31.71654510498)
		}

	}

}

Config.AuthorizedWeapons = {
	kadet = {
		{weapon = 'WEAPON_APPISTOL', components = {0, 0, 1000, 4000, nil}, price = 10000},
		{weapon = 'WEAPON_NIGHTSTICK', price = 0},
		{weapon = 'WEAPON_STUNGUN', price = 1500},
		{weapon = 'WEAPON_FLASHLIGHT', price = 80}
	},

	officer = {
		{weapon = 'WEAPON_APPISTOL', components = {0, 0, 1000, 4000, nil}, price = 10000},
		{weapon = 'WEAPON_ADVANCEDRIFLE', components = {0, 6000, 1000, 4000, 8000, nil}, price = 50000},
		{weapon = 'WEAPON_NIGHTSTICK', price = 0},
		{weapon = 'WEAPON_STUNGUN', price = 500},
		{weapon = 'WEAPON_FLASHLIGHT', price = 0}
	},

	sergeant = {
		{weapon = 'WEAPON_APPISTOL', components = {0, 0, 1000, 4000, nil}, price = 10000},
		{weapon = 'WEAPON_ADVANCEDRIFLE', components = {0, 6000, 1000, 4000, 8000, nil}, price = 50000},
		{weapon = 'WEAPON_PUMPSHOTGUN', components = {2000, 6000, nil}, price = 70000},
		{weapon = 'WEAPON_NIGHTSTICK', price = 0},
		{weapon = 'WEAPON_STUNGUN', price = 500},
		{weapon = 'WEAPON_FLASHLIGHT', price = 0}
	},

	lieutenant = {
		{weapon = 'WEAPON_APPISTOL', components = {0, 0, 1000, 4000, nil}, price = 10000},
		{weapon = 'WEAPON_ADVANCEDRIFLE', components = {0, 6000, 1000, 4000, 8000, nil}, price = 50000},
		{weapon = 'WEAPON_PUMPSHOTGUN', components = {2000, 6000, nil}, price = 70000},
		{weapon = 'WEAPON_NIGHTSTICK', price = 0},
		{weapon = 'WEAPON_STUNGUN', price = 500},
		{weapon = 'WEAPON_FLASHLIGHT', price = 0}
	},

	boss = {
		{weapon = 'WEAPON_APPISTOL', components = {0, 0, 1000, 4000, nil}, price = 10000},
		{weapon = 'WEAPON_ADVANCEDRIFLE', components = {0, 6000, 1000, 4000, 8000, nil}, price = 50000},
		{weapon = 'WEAPON_PUMPSHOTGUN', components = {2000, 6000, nil}, price = 70000},
		{weapon = 'WEAPON_NIGHTSTICK', price = 0},
		{weapon = 'WEAPON_STUNGUN', price = 500},
		{weapon = 'WEAPON_FLASHLIGHT', price = 0}
	}
}

Config.AuthorizedVehicles = {
	car = {
		kadet = {
		},

		zaszlos = {
		}
	},

	helicopter = {
		recruit = {},

		officer = {},

		sergeant = {},

		lieutenant = {
		},

		boss = {
		}
	}
}

Config.CustomPeds = {
	shared = {
	},

	recruit = {},

	officer = {},

	sergeant = {},

	lieutenant = {},

	boss = {
	}
}

-- CHECK SKINCHANGER CLIENT MAIN.LUA for matching elements
Config.Uniforms = {
	kadet = {
		male = {
			tshirt_1 = 17,  tshirt_2 = 0,
            torso_1 = 64,   torso_2 = 0,
            decals_1 = 0,   decals_2 = 0,
            arms = 0,
            pants_1 = 25,   pants_2 = 0,
            shoes_1 = 36,   shoes_2 = 0,
            helmet_1 = -1,  helmet_2 = 0,
            chain_1 = 0,    chain_2 = 0,
            ears_1 = 0,     ears_2 = 0,
			helmet_1 = 13,  helmet_2 = 1
		},
		female = {
			tshirt_1 = 17,  tshirt_2 = 0,
			torso_1 = 17,   torso_2 = 0,
			decals_1 = 0,   decals_2 = 0,
			arms = 44,
			pants_1 = 19,   pants_2 = 0,
			shoes_1 = 26,   shoes_2 = 0,
			helmet_1 = 45,  helmet_2 = 0,
			chain_1 = 0,    chain_2 = 0,
			ears_1 = 2,     ears_2 = 0
		}
	},

	ormester = {
		male = {
			tshirt_1 = 17,  tshirt_2 = 0,
            torso_1 = 64,   torso_2 = 0,
            decals_1 = 0,   decals_2 = 0,
            arms = 0,
            pants_1 = 25,   pants_2 = 0,
            shoes_1 = 36,   shoes_2 = 0,
            helmet_1 = -1,  helmet_2 = 0,
            chain_1 = 0,    chain_2 = 0,
            ears_1 = 0,     ears_2 = 0,
			bproof_1 = 20,  bproof_2 = 0,
			helmet_1 = 13,  helmet_2 = 1
		},
		female = {
			tshirt_1 = 17,  tshirt_2 = 0,
			torso_1 = 18,   torso_2 = 1,
			decals_1 = 0,   decals_2 = 0,
			arms = 44,
			pants_1 = 19,   pants_2 = 0,
			shoes_1 = 26,   shoes_2 = 0,
			helmet_1 = 45,  helmet_2 = 0,
			chain_1 = 0,    chain_2 = 0,
			ears_1 = 2,     ears_2 = 0
		}
	},

	torzsormester = {
		male = {
			tshirt_1 = 17,  tshirt_2 = 0,
            torso_1 = 64,   torso_2 = 0,
            decals_1 = 0,   decals_2 = 0,
            arms = 0,
            pants_1 = 25,   pants_2 = 0,
            shoes_1 = 36,   shoes_2 = 0,
            helmet_1 = -1,  helmet_2 = 0,
            chain_1 = 0,    chain_2 = 0,
            ears_1 = 0,     ears_2 = 0,
			helmet_1 = 13,  helmet_2 = 1
		},
		female = {
			tshirt_1 = 17,  tshirt_2 = 0,
			torso_1 = 134,   torso_2 = 0,
			decals_1 = 7,   decals_2 = 1,
			arms = 44,
			pants_1 = 19,   pants_2 = 0,
			shoes_1 = 26,   shoes_2 = 0,
			helmet_1 = -1,  helmet_2 = 0,
			chain_1 = 0,    chain_2 = 0,
			ears_1 = 2,     ears_2 = 0
		}
	},

	fotorzsormester = {
		male = {
			tshirt_1 = 17,  tshirt_2 = 0,
            torso_1 = 64,   torso_2 = 0,
            decals_1 = 0,   decals_2 = 0,
            arms = 0,
            pants_1 = 25,   pants_2 = 0,
            shoes_1 = 36,   shoes_2 = 0,
            helmet_1 = -1,  helmet_2 = 0,
            chain_1 = 0,    chain_2 = 0,
            ears_1 = 0,     ears_2 = 0,
			bproof_1 = 0,  bproof_2 = 0,
			helmet_1 = 13,  helmet_2 = 1
		},
		female = {
			tshirt_1 = 17,  tshirt_2 = 0,
			torso_1 = 18,   torso_2 = 1,
			decals_1 = 7,   decals_2 = 2,
			arms = 44,
			pants_1 = 19,   pants_2 = 0,
			shoes_1 = 26,   shoes_2 = 0,
			helmet_1 = -1,  helmet_2 = 0,
			chain_1 = 0,    chain_2 = 0,
			ears_1 = 2,     ears_2 = 0,
			bproof_1 = 12,  bproof_2 = 0
		}
	},

	zaszlos = {
		male = {
			tshirt_1 = 17,  tshirt_2 = 0,
            torso_1 = 64,   torso_2 = 0,
            decals_1 = 0,   decals_2 = 0,
            arms = 0,
            pants_1 = 25,   pants_2 = 0,
            shoes_1 = 36,   shoes_2 = 0,
            helmet_1 = -1,  helmet_2 = 0,
            chain_1 = 0,    chain_2 = 0,
            ears_1 = 0,     ears_2 = 0,
			bproof_1 = 0,  bproof_2 = 0,
			helmet_1 = 13,  helmet_2 = 1
		},
		female = {
			tshirt_1 = 17,  tshirt_2 = 0,
			torso_1 = 18,   torso_2 = 1,
			decals_1 = 7,   decals_2 = 2,
			arms = 44,
			pants_1 = 19,   pants_2 = 0,
			shoes_1 = 26,   shoes_2 = 0,
			helmet_1 = -1,  helmet_2 = 0,
			chain_1 = 0,    chain_2 = 0,
			ears_1 = 2,     ears_2 = 0,
			bproof_1 = 17,  bproof_2 = 0
		}
	},

	torzszaszlos = {
		male = {
			tshirt_1 = 17,  tshirt_2 = 0,
            torso_1 = 64,   torso_2 = 0,
            decals_1 = 0,   decals_2 = 0,
            arms = 0,
            pants_1 = 25,   pants_2 = 0,
            shoes_1 = 36,   shoes_2 = 0,
            helmet_1 = -1,  helmet_2 = 0,
            chain_1 = 0,    chain_2 = 0,
            ears_1 = 0,     ears_2 = 0,
			bproof_1 = 20,  bproof_2 = 0,
			helmet_1 = 13,  helmet_2 = 1
		},
		female = {
			tshirt_1 = 17,  tshirt_2 = 0,
			torso_1 = 18,   torso_2 = 1,
			decals_1 = 7,   decals_2 = 2,
			arms = 44,
			pants_1 = 19,   pants_2 = 0,
			shoes_1 = 26,   shoes_2 = 0,
			helmet_1 = -1,  helmet_2 = 0,
			chain_1 = 0,    chain_2 = 0,
			ears_1 = 2,     ears_2 = 0,
			bproof_1 = 21,  bproof_2 = 1
		}
	},

	fotorzszaszlos = {
		male = {
			tshirt_1 = 17,  tshirt_2 = 0,
            torso_1 = 64,   torso_2 = 0,
            decals_1 = 0,   decals_2 = 0,
            arms = 0,
            pants_1 = 25,   pants_2 = 0,
            shoes_1 = 36,   shoes_2 = 0,
            helmet_1 = -1,  helmet_2 = 0,
            chain_1 = 0,    chain_2 = 0,
            ears_1 = 0,     ears_2 = 0,
			bproof_1 = 25,  bproof_2 = 1,
			helmet_1 = 13,  helmet_2 = 1
		},
		female = {
			tshirt_1 = 17,  tshirt_2 = 0,
			torso_1 = 18,   torso_2 = 1,
			decals_1 = 7,   decals_2 = 2,
			arms = 44,
			pants_1 = 19,   pants_2 = 0,
			shoes_1 = 26,   shoes_2 = 0,
			helmet_1 = -1,  helmet_2 = 0,
			chain_1 = 0,    chain_2 = 0,
			ears_1 = 2,     ears_2 = 0,
			bproof_1 = 22,  bproof_2 = 2
		}
	},

	hadnagy = {
		male = {
			tshirt_1 = 17,  tshirt_2 = 0,
            torso_1 = 64,   torso_2 = 0,
            decals_1 = 0,   decals_2 = 0,
            arms = 0,
            pants_1 = 25,   pants_2 = 0,
            shoes_1 = 36,   shoes_2 = 0,
            helmet_1 = -1,  helmet_2 = 0,
            chain_1 = 0,    chain_2 = 0,
            ears_1 = 0,     ears_2 = 0,
			bproof_1 = 28,  bproof_2 = 1,
			helmet_1 = 13,  helmet_2 = 1
		},
		female = {
			tshirt_1 = 17,  tshirt_2 = 0,
			torso_1 = 18,   torso_2 = 1,
			decals_1 = 7,   decals_2 = 2,
			arms = 44,
			pants_1 = 19,   pants_2 = 0,
			shoes_1 = 26,   shoes_2 = 0,
			helmet_1 = -1,  helmet_2 = 0,
			chain_1 = 0,    chain_2 = 0,
			ears_1 = 2,     ears_2 = 0,
			bproof_1 = 9,  bproof_2 = 0
		}
	},

	fohadnagy = {
		male = {
			tshirt_1 = 17,  tshirt_2 = 0,
            torso_1 = 64,   torso_2 = 0,
            decals_1 = 0,   decals_2 = 0,
            arms = 0,
            pants_1 = 25,   pants_2 = 0,
            shoes_1 = 36,   shoes_2 = 0,
            helmet_1 = -1,  helmet_2 = 0,
            chain_1 = 0,    chain_2 = 0,
            ears_1 = 0,     ears_2 = 0,
			bproof_1 = 29,  bproof_2 = 1,
			helmet_1 = 13,  helmet_2 = 1
		},
		female = {
			tshirt_1 = 17,  tshirt_2 = 0,
			torso_1 = 18,   torso_2 = 1,
			decals_1 = 7,   decals_2 = 2,
			arms = 44,
			pants_1 = 19,   pants_2 = 0,
			shoes_1 = 26,   shoes_2 = 0,
			helmet_1 = -1,  helmet_2 = 0,
			chain_1 = 0,    chain_2 = 0,
			ears_1 = 2,     ears_2 = 0,
			bproof_1 = 9,  bproof_2 = 0
		}
	},

	szazados = {
		male = {
			tshirt_1 = 17,  tshirt_2 = 0,
            torso_1 = 64,   torso_2 = 0,
            decals_1 = 0,   decals_2 = 0,
            arms = 0,
            pants_1 = 25,   pants_2 = 0,
            shoes_1 = 36,   shoes_2 = 0,
            helmet_1 = -1,  helmet_2 = 0,
            chain_1 = 0,    chain_2 = 0,
            ears_1 = 0,     ears_2 = 0,
			bproof_1 = 29,  bproof_2 = 1,
			helmet_1 = 13,  helmet_2 = 1
		},
		female = {
			tshirt_1 = 17,  tshirt_2 = 0,
			torso_1 = 18,   torso_2 = 1,
			decals_1 = 7,   decals_2 = 2,
			arms = 44,
			pants_1 = 19,   pants_2 = 0,
			shoes_1 = 26,   shoes_2 = 0,
			helmet_1 = -1,  helmet_2 = 0,
			chain_1 = 0,    chain_2 = 0,
			ears_1 = 2,     ears_2 = 0,
			bproof_1 = 8,  bproof_2 = 0
		}
	},

	ornagy = {
		male = {
			tshirt_1 = 17,  tshirt_2 = 0,
            torso_1 = 64,   torso_2 = 0,
            decals_1 = 0,   decals_2 = 0,
            arms = 0,
            pants_1 = 25,   pants_2 = 0,
            shoes_1 = 36,   shoes_2 = 0,
            helmet_1 = -1,  helmet_2 = 0,
            chain_1 = 0,    chain_2 = 0,
            ears_1 = 0,     ears_2 = 0,
			bproof_1 = 30,  bproof_2 = 1,
			helmet_1 = 13,  helmet_2 = 1
		},
		female = {
			tshirt_1 = 17,  tshirt_2 = 0,
			torso_1 = 18,   torso_2 = 1,
			decals_1 = 7,   decals_2 = 2,
			arms = 44,
			pants_1 = 19,   pants_2 = 0,
			shoes_1 = 26,   shoes_2 = 0,
			helmet_1 = -1,  helmet_2 = 0,
			chain_1 = 0,    chain_2 = 0,
			ears_1 = 2,     ears_2 = 0,
			bproof_1 = 8,  bproof_2 = 0
		}
	},

	alezredes = {
		male = {
			tshirt_1 = 17,  tshirt_2 = 0,
            torso_1 = 64,   torso_2 = 0,
            decals_1 = 0,   decals_2 = 0,
            arms = 0,
            pants_1 = 25,   pants_2 = 0,
            shoes_1 = 36,   shoes_2 = 0,
            helmet_1 = -1,  helmet_2 = 0,
            chain_1 = 0,    chain_2 = 0,
            ears_1 = 0,     ears_2 = 0,
			bproof_1 = 37,  bproof_2 = 2,
			helmet_1 = 13,  helmet_2 = 1
		},
		female = {
			tshirt_1 = 17,  tshirt_2 = 0,
			torso_1 = 18,   torso_2 = 1,
			decals_1 = 7,   decals_2 = 2,
			arms = 44,
			pants_1 = 19,   pants_2 = 0,
			shoes_1 = 26,   shoes_2 = 0,
			helmet_1 = -1,  helmet_2 = 0,
			chain_1 = 0,    chain_2 = 0,
			ears_1 = 2,     ears_2 = 0,
			bproof_1 = 11,  bproof_2 = 1
		}
	},

	ezredes = {
		male = {
			tshirt_1 = 17,  tshirt_2 = 0,
            torso_1 = 64,   torso_2 = 0,
            decals_1 = 0,   decals_2 = 0,
            arms = 0,
            pants_1 = 25,   pants_2 = 0,
            shoes_1 = 36,   shoes_2 = 0,
            helmet_1 = -1,  helmet_2 = 0,
            chain_1 = 0,    chain_2 = 0,
            ears_1 = 0,     ears_2 = 0,
			bproof_1 = 4,  bproof_2 = 1,
			helmet_1 = 13,  helmet_2 = 1
		},
		female = {
			tshirt_1 = 17,  tshirt_2 = 0,
			torso_1 = 18,   torso_2 = 1,
			decals_1 = 7,   decals_2 = 2,
			arms = 44,
			pants_1 = 19,   pants_2 = 0,
			shoes_1 = 26,   shoes_2 = 0,
			helmet_1 = -1,  helmet_2 = 0,
			chain_1 = 0,    chain_2 = 0,
			ears_1 = 2,     ears_2 = 0,
			bproof_1 = 28,  bproof_2 = 0
		}
	},

	boss = {
		male = {
			tshirt_1 = 17,  tshirt_2 = 0,
            torso_1 = 64,   torso_2 = 0,
            decals_1 = 0,   decals_2 = 0,
            arms = 0,
            pants_1 = 25,   pants_2 = 0,
            shoes_1 = 36,   shoes_2 = 0,
            helmet_1 = -1,  helmet_2 = 0,
            chain_1 = 0,    chain_2 = 0,
            ears_1 = 0,     ears_2 = 0,
			bproof_1 = 8,  bproof_2 = 1,
			helmet_1 = 13,  helmet_2 = 1
		},
		female = {
			tshirt_1 = 17,  tshirt_2 = 0,
			torso_1 = 18,   torso_2 = 1,
			decals_1 = 7,   decals_2 = 2,
			arms = 44,
			pants_1 = 19,   pants_2 = 0,
			shoes_1 = 26,   shoes_2 = 0,
			helmet_1 = -1,  helmet_2 = 0,
			chain_1 = 0,    chain_2 = 0,
			ears_1 = 2,     ears_2 = 0,
			bproof_1 = 28,  bproof_2 = 0
		}
	}
}
