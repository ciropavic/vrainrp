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

Config.resource 				  = "esx_policejob"

Config.PoliceStations = {

	LSPD = {

		Blip = {
			Coords  = vector3(602.86981201172,-9.1632595062256,82.628051757813),
			Sprite  = 60,
			Display = 4,
			Scale   = 1.2,
			Colour  = 29
		},

		Cloakrooms = {
			vector3(629.08642578125,1.783896446228,76.628089904785),
            vector3(626.18072509766,-6.0308418273926,76.628067016602)
		},

		Armories = {
			vector3(608.23944091797,-18.130760192871,76.62809753418)
		},

		Lefoglaltak = {
			vector3(615.07019042969,-11.52170753479,76.628051757813)
		},

		Vehicles = {
		},

		Helicopters = {
		},

		BossActions = {
			vector3(577.64855957031,-20.826932907104,87.486747741699)
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

Config.DutyItems = {
	kadet = {
		{ id = 'WEAPON_PISTOL', count = 1 },
		{ id = 'WEAPON_NIGHTSTICK', count = 1 },
		{ id = 'WEAPON_STUNGUN', count = 1 },
		{ id = 'WEAPON_FLASHLIGHT', count = 1 }, 
		
		{ id = "ammo-9", count = 216 }, 
	},
	
	boss = {
		{ id = 'WEAPON_PISTOL', count = 1 },
		{ id = 'WEAPON_CARBINERIFLE', count = 1 },
		{ id = 'WEAPON_NIGHTSTICK', count = 1 },
		{ id = 'WEAPON_STUNGUN', count = 1 },
		{ id = 'WEAPON_FLASHLIGHT', count = 1 }, 

		{ id = "ammo-9", count = 216 }, 
		{ id = "ammo-rifle", count = 300 }, 
	},

	-- {'WEAPON_SMG', 30},
	-- officer, sergeant, intendent, lieutenant, chef, boss
};

-- CHECK SKINCHANGER CLIENT MAIN.LUA for matching elements
Config.Uniforms = {
	kadet = {
		male = {
			tshirt_1 = 56,  tshirt_2 = 0, -- undercoat
            torso_1 = 193,   torso_2 = 0, -- Top
            decals_1 = 0,   decals_2 = 0,
            arms = 4, -- UpperSkin
            pants_1 = 35,   pants_2 = 0,
            shoes_1 = 51,   shoes_2 = 0,
            helmet_1 = -1,  helmet_2 = 0,
            chain_1 = 0,    chain_2 = 0,
            ears_1 = 0,     ears_2 = 0
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
			tshirt_1 = 23,  tshirt_2 = 2,
            torso_1 = 2,   torso_2 = 0,
			arms = 0,
            decals_1 = 0,   decals_2 = 0,
            pants_1 = 19,   pants_2 = 0,
            shoes_1 = 36,   shoes_2 = 0,
            helmet_1 = -1,  helmet_2 = 0,
            chain_1 = 0,    chain_2 = 0,
            ears_1 = 0,     ears_2 = 0
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
			tshirt_1 = 23,  tshirt_2 = 2,
            torso_1 = 17,   torso_2 = 0,
            decals_1 = 0,   decals_2 = 0,
            arms = 4,
            pants_1 = 19,   pants_2 = 0,
            shoes_1 = 36,   shoes_2 = 0,
            helmet_1 = -1,  helmet_2 = 0,
            chain_1 = 0,    chain_2 = 0,
            ears_1 = 0,     ears_2 = 0
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
			tshirt_1 = 23,  tshirt_2 = 2,
            torso_1 = 17,   torso_2 = 1,
            decals_1 = 0,   decals_2 = 0,
            arms = 4,
            pants_1 = 19,   pants_2 = 0,
            shoes_1 = 36,   shoes_2 = 0,
            helmet_1 = -1,  helmet_2 = 0,
            chain_1 = 0,    chain_2 = 0,
            ears_1 = 0,     ears_2 = 0
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
			tshirt_1 = 23,  tshirt_2 = 2,
            torso_1 = 17,   torso_2 = 5,
            decals_1 = 0,   decals_2 = 0,
            arms = 4,
            pants_1 = 19,   pants_2 = 0,
            shoes_1 = 36,   shoes_2 = 0,
            helmet_1 = -1,  helmet_2 = 0,
            chain_1 = 0,    chain_2 = 0,
            ears_1 = 0,     ears_2 = 0
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
			tshirt_1 = 23,  tshirt_2 = 2,
            torso_1 = 17,   torso_2 = 6,
            decals_1 = 0,   decals_2 = 0,
            arms = 4,
            pants_1 = 19,   pants_2 = 0,
            shoes_1 = 36,   shoes_2 = 0,
            helmet_1 = -1,  helmet_2 = 0,
            chain_1 = 0,    chain_2 = 0,
            ears_1 = 0,     ears_2 = 0
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
			tshirt_1 = 23,  tshirt_2 = 2,
            torso_1 = 116,   torso_2 = 1,
            decals_1 = 0,   decals_2 = 0,
            arms = 4,
            pants_1 = 19,   pants_2 = 0,
            shoes_1 = 36,   shoes_2 = 0,
            helmet_1 = -1,  helmet_2 = 0,
            chain_1 = 0,    chain_2 = 0,
            ears_1 = 0,     ears_2 = 0,
			bproof_1 = 43,  bproof_2 = 0
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
			tshirt_1 = 23,  tshirt_2 = 2,
            torso_1 = 159,   torso_2 = 1,
            decals_1 = 0,   decals_2 = 0,
            arms = 4,
            pants_1 = 19,   pants_2 = 0,
            shoes_1 = 36,   shoes_2 = 0,
            helmet_1 = -1,  helmet_2 = 0,
            chain_1 = 0,    chain_2 = 0,
            ears_1 = 0,     ears_2 = 0,
			bproof_1 = 31,  bproof_2 = 0
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
			tshirt_1 = 23,  tshirt_2 = 2,
            torso_1 = 116,   torso_2 = 1,
            decals_1 = 0,   decals_2 = 0,
            arms = 4,
            pants_1 = 19,   pants_2 = 0,
            shoes_1 = 36,   shoes_2 = 0,
            helmet_1 = -1,  helmet_2 = 0,
            chain_1 = 0,    chain_2 = 0,
            ears_1 = 0,     ears_2 = 0,
			bproof_1 = 43,  bproof_2 = 0
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
			tshirt_1 = 23,  tshirt_2 = 2,
            torso_1 = 116,   torso_2 = 1,
            decals_1 = 0,   decals_2 = 0,
            arms = 4,
            pants_1 = 19,   pants_2 = 0,
            shoes_1 = 36,   shoes_2 = 0,
            helmet_1 = -1,  helmet_2 = 0,
            chain_1 = 0,    chain_2 = 0,
            ears_1 = 0,     ears_2 = 0,
			bproof_1 = 25,  bproof_2 = 0
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
			tshirt_1 = 23,  tshirt_2 = 2,
            torso_1 = 116,   torso_2 = 1,
            decals_1 = 0,   decals_2 = 0,
            arms = 4,
            pants_1 = 19,   pants_2 = 0,
            shoes_1 = 36,   shoes_2 = 0,
            helmet_1 = -1,  helmet_2 = 0,
            chain_1 = 0,    chain_2 = 0,
            ears_1 = 0,     ears_2 = 0,
			bproof_1 = 24,  bproof_2 = 0
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
			tshirt_1 = 23,  tshirt_2 = 2,
            torso_1 = 17,   torso_2 = 1,
            decals_1 = 0,   decals_2 = 0,
            arms = 4,
            pants_1 = 19,   pants_2 = 0,
            shoes_1 = 36,   shoes_2 = 0,
            helmet_1 = -1,  helmet_2 = 0,
            chain_1 = 0,    chain_2 = 0,
            ears_1 = 0,     ears_2 = 0,
			bproof_1 = 29,  bproof_2 = 0
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
			tshirt_1 = 23,  tshirt_2 = 2,
            torso_1 = 17,   torso_2 = 1,
            decals_1 = 0,   decals_2 = 0,
            arms = 4,
            pants_1 = 19,   pants_2 = 0,
            shoes_1 = 36,   shoes_2 = 0,
            helmet_1 = -1,  helmet_2 = 0,
            chain_1 = 0,    chain_2 = 0,
            ears_1 = 0,     ears_2 = 0,
			bproof_1 = 37,  bproof_2 = 0
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
			tshirt_1 = 23,  tshirt_2 = 2,
            torso_1 = 17,   torso_2 = 6,
            decals_1 = 0,   decals_2 = 0,
            arms = 4,
            pants_1 = 19,   pants_2 = 0,
            shoes_1 = 36,   shoes_2 = 0,
            helmet_1 = -1,  helmet_2 = 0,
            chain_1 = 0,    chain_2 = 0,
            ears_1 = 0,     ears_2 = 0,
			bproof_1 = 29,  bproof_2 = 0
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
