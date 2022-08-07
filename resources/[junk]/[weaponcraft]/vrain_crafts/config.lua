Config = {}

Config.UseOkokTextUI = false -- true = okokTextUI (I recommend you using this since it is way more optimized than the default ShowHelpNotification) | false = ShowHelpNotification

Config.Key = 38 -- [E] Key to open the interaction, check here the keys ID: https://docs.fivem.net/docs/game-references/controls/#controls

Config.HideMinimap = true -- If true it'll hide the minimap when the Crafting menu is opened

Config.ShowBlips = true -- If true it'll show the crafting blips on the map

Config.ShowFloorBlips = true -- If true it'll show the crafting markers on the floor

Config.Crafting = {
	{
		coordinates = vector3(1052.9630126953,-1964.0224609375,31.014488220215), -- coordinates of the table
		radius = 1, -- radius of the table
		maxCraftRadius = 5, -- if you are further it will stop the craft
		showBlipRadius = 50,
		blip = {}, -- to get blips and colors check this: https://wiki.gtanet.work/index.php?title=Blips
		tableName = 'Fegyver', -- Title
		tableID = 'fegyver', -- make a different one for every table with NO spaces
		crafts = { -- What items are available for crafting and the recipe
			{
				item = 'WEAPON_PISTOL', -- Item id and name of the image
				amount = 1,
				successCraftPercentage = 100, -- Percentage of successful craft 0 = 0% | 50 = 50% | 100 = 100%
				isItem = true, -- if true = is item | if false = is weapon
				time = 180, -- Time to craft (in seconds)
				recipe = { -- Recipe to craft it
					{'cso', 3, true}, -- item/amount/if the item should be removed when crafting
					{'tar', 3, true},
					{'rugo', 3, true},
				},
				job = { -- What jobs can craft this item in this workbench
					'ballas',
					'motogang',
					'lostnegro',
					'ndrangheta',
					'lacosanostra',
					'miraglia',
					'lostmc',
					'narcoscartel',
					'gentile',
					'medellin'
				},
			},

			{
				item = 'WEAPON_APPISTOL', -- Item id and name of the image
				amount = 1,
				successCraftPercentage = 100, -- Percentage of successful craft 0 = 0% | 50 = 50% | 100 = 100%
				isItem = true, -- if true = is item | if false = is weapon
				time = 180, -- Time to craft (in seconds)
				recipe = { -- Recipe to craft it
					{'cso', 3, true}, -- item/amount/if the item should be removed when crafting
					{'tus', 3, true},
					{'csavar', 3, true},
				},
				job = { -- What jobs can craft this item in this workbench
					'ballas',
					'motogang',
					'lostnegro',
					'ndrangheta',
					'lacosanostra',
					'miraglia',
					'lostmc',
					'narcoscartel',
					'gentile',
					'medellin'
				},
			},

			{
				item = 'WEAPON_ASSAULTRIFLE', -- Item id and name of the image
				amount = 1,
				successCraftPercentage = 100, -- Percentage of successful craft 0 = 0% | 50 = 50% | 100 = 100%
				isItem = true, -- if true = is item | if false = is weapon
				time = 180, -- Time to craft (in seconds)
				recipe = { -- Recipe to craft it
					{'cso', 3, true}, -- item/amount/if the item should be removed when crafting
					{'tar', 3, true},
					{'rugo', 3, true},
					{'csavar', 3, true},
					{'tus', 3, true},
				},
				job = { -- What jobs can craft this item in this workbench
					'ballas',
					'motogang',
					'lostnegro',
					'ndrangheta',
					'lacosanostra',
					'miraglia',
					'lostmc',
					'narcoscartel',
					'gentile',
					'medellin'
				},
			},

			{
				item = 'drill', -- Item id and name of the image
				amount = 1,
				successCraftPercentage = 100, -- Percentage of successful craft 0 = 0% | 50 = 50% | 100 = 100%
				isItem = true, -- if true = is item | if false = is weapon
				time = 180, -- Time to craft (in seconds)
				recipe = { -- Recipe to craft it
					{'akkumlator', 3, true}, -- item/amount/if the item should be removed when crafting
					{'furofej', 3, true},
					{'furomotor', 3, true},
				},
				job = { -- What jobs can craft this item in this workbench
					'ballas',
					'motogang',
					'lostnegro',
					'ndrangheta',
					'lacosanostra',
					'miraglia',
					'lostmc',
					'narcoscartel',
					'gentile',
					'medellin'
				},
			},
		},
	},

	{
		coordinates = vector3(826.17755126953,-2342.8076171875,30.334325790405), -- coordinates of the table
		radius = 1, -- radius of the table
		maxCraftRadius = 5, -- if you are further it will stop the craft
		showBlipRadius = 50,
		blip = {}, -- to get blips and colors check this: https://wiki.gtanet.work/index.php?title=Blips
		tableName = 'Drog', -- Title
		tableID = 'drogs', -- make a different one for every table with NO spaces
		crafts = { -- What items are available for crafting and the recipe
			{
				item = 'metamfetamin', -- Item id and name of the image
				amount = 1,
				successCraftPercentage = 100, -- Percentage of successful craft 0 = 0% | 50 = 50% | 100 = 100%
				isItem = true, -- if true = is item | if false = is weapon
				time = 180, -- Time to craft (in seconds)
				recipe = { -- Recipe to craft it
					{'feherpor', 3, true}, -- item/amount/if the item should be removed when crafting
					{'kalcium', 3, true},
					{'desztillaltviz', 3, true},
					{'sosav', 3, true},
					{'ammonia', 3, true},
				},
				job = { -- What jobs can craft this item in this workbench
					'ballas',
					'motogang',
					'lostnegro',
					'ndrangheta',
					'lacosanostra',
					'miraglia',
					'lostmc',
					'narcoscartel',
					'gentile',
					'medellin'
				},
			},

			{
				item = 'lsd', -- Item id and name of the image
				amount = 1,
				successCraftPercentage = 100, -- Percentage of successful craft 0 = 0% | 50 = 50% | 100 = 100%
				isItem = true, -- if true = is item | if false = is weapon
				time = 180, -- Time to craft (in seconds)
				recipe = { -- Recipe to craft it
					{'belyeg', 3, true}, -- item/amount/if the item should be removed when crafting
					{'aceton', 3, true},
					{'ragaszto', 3, true},
				},
				job = { -- What jobs can craft this item in this workbench
					'ballas',
					'motogang',
					'lostnegro',
					'ndrangheta',
					'lacosanostra',
					'miraglia',
					'lostmc',
					'narcoscartel',
					'gentile',
					'medellin'
				},
			},
		},
	},

	{
		coordinates = vector3(125.87761688232,-1035.7652587891,29.277141571045), -- coordinates of the table
		radius = 1, -- radius of the table
		maxCraftRadius = 5, -- if you are further it will stop the craft
		showBlipRadius = 50,
		blip = {}, -- to get blips and colors check this: https://wiki.gtanet.work/index.php?title=Blips
		tableName = 'Étel', -- Title
		tableID = 'fozes', -- make a different one for every table with NO spaces
		crafts = { -- What items are available for crafting and the recipe
			{
				item = 'tavaszitekercs', -- Item id and name of the image
				amount = 1,
				successCraftPercentage = 100, -- Percentage of successful craft 0 = 0% | 50 = 50% | 100 = 100%
				isItem = true, -- if true = is item | if false = is weapon
				time = 30, -- Time to craft (in seconds)
				recipe = { -- Recipe to craft it
					{'liszt', 1, true}, -- item/amount/if the item should be removed when crafting
					{'cukor', 1, true},
				},
				job = { -- What jobs can craft this item in this workbench
					'pearlsrestaurant'
				},
			},

			{
				item = 'sushi', -- Item id and name of the image
				amount = 1,
				successCraftPercentage = 100, -- Percentage of successful craft 0 = 0% | 50 = 50% | 100 = 100%
				isItem = true, -- if true = is item | if false = is weapon
				time = 30, -- Time to craft (in seconds)
				recipe = { -- Recipe to craft it
					{'hal', 1, true}, -- item/amount/if the item should be removed when crafting
					{'rizs', 1, true},
				},
				job = { -- What jobs can craft this item in this workbench
					'pearlsrestaurant'
				},
			},

			{
				item = 'szerencsesuti', -- Item id and name of the image
				amount = 1,
				successCraftPercentage = 100, -- Percentage of successful craft 0 = 0% | 50 = 50% | 100 = 100%
				isItem = true, -- if true = is item | if false = is weapon
				time = 30, -- Time to craft (in seconds)
				recipe = { -- Recipe to craft it
					{'cetli', 1, true}, -- item/amount/if the item should be removed when crafting
					{'paszta', 1, true},
				},
				job = { -- What jobs can craft this item in this workbench
					'pearlsrestaurant'
				},
			},

			{
				item = 'tea', -- Item id and name of the image
				amount = 1,
				successCraftPercentage = 100, -- Percentage of successful craft 0 = 0% | 50 = 50% | 100 = 100%
				isItem = true, -- if true = is item | if false = is weapon
				time = 30, -- Time to craft (in seconds)
				recipe = { -- Recipe to craft it
					{'water', 1, true}, -- item/amount/if the item should be removed when crafting
					{'teafilter', 1, true},
				},
				job = { -- What jobs can craft this item in this workbench
					'pearlsrestaurant'
				},
			},

			{
				item = 'whiskey', -- Item id and name of the image
				amount = 1,
				successCraftPercentage = 100, -- Percentage of successful craft 0 = 0% | 50 = 50% | 100 = 100%
				isItem = true, -- if true = is item | if false = is weapon
				time = 30, -- Time to craft (in seconds)
				recipe = { -- Recipe to craft it
					{'aroma', 1, true}, -- item/amount/if the item should be removed when crafting
					{'alkohol', 1, true},
				},
				job = { -- What jobs can craft this item in this workbench
					'pearlsrestaurant'
				},
			},
		},
	},
}

-------------------------- DISCORD LOGS

-- To set your Discord Webhook URL go to server.lua, line 3

Config.BotName = 'Crafting' -- Write the desired bot name

Config.ServerName = 'Vrain Roleplay' -- Write your server's name

Config.IconURL = 'https://cdn.discordapp.com/attachments/821811915189256204/958069789086089216/443263_1.png' -- Insert your desired image link

Config.DateFormat = '%d/%m/%Y [%X]' -- To change the date format check this website - https://www.lua.org/pil/22.1.html

-- To change a webhook color you need to set the decimal value of a color, you can use this website to do that - https://www.mathsisfun.com/hexadecimal-decimal-colors.html

Config.StartCraftWebhookColor = '16127'

Config.ConcludeCraftWebhookColor = '65352'

Config.AnticheatProtectionWebhookColor = '16776960'

Config.FailWebhookColor = '16711680'